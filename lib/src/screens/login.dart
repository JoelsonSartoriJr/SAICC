import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLogged = false;

  Future<FirebaseUser> _loginWithFacebook() async {
    var facebookLogin = new FacebookLogin();
    var result = await facebookLogin
        .logInWithReadPermissions(['email', 'public_profile']);
    FacebookAccessToken myToken = result.accessToken;
    AuthCredential credential =
        FacebookAuthProvider.getCredential(accessToken: myToken.token);

    debugPrint(result.status.toString());

    if (result.status == FacebookLoginStatus.loggedIn) {
      FirebaseUser user = await _auth.signInWithCredential(credential);
      Navigator.pushReplacementNamed(context, '/HomePage');
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SAICC IX"),
      ),
      body: Center(
        child: isLogged
            ? null
            : FacebookSignInButton(
                onPressed: _loginWithFacebook,
              ),
      ),
    );
  }
}
