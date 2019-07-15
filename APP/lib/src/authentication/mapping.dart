import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authentication.dart';
import 'authprovider.dart';
import '../mixins/rootModel.dart';
import '../screens/login.dart';
import '../screens/home.dart';

class MappingPage extends StatefulWidget {
  final RootModel model;

  MappingPage({this.model});

  @override
  createState() => _MappingPageState();
}

enum AuthStatus {
  notSignedIn,
  signIn,
}

class _MappingPageState extends State<MappingPage> {
  AuthStatus _authStatus = AuthStatus.notSignedIn;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final AuthImplementation auth = AuthProvider.of(context).auth;
    auth.getCurrentUser().then((FirebaseUser user) {
      setState(() {
        _authStatus = user == null ? AuthStatus.notSignedIn : AuthStatus.signIn;
      });
    });
  }

  void _signedIn() {
    setState(() {
      _authStatus = AuthStatus.signIn;
    });
  }

  void _signedOut() {
    setState(() {
      _authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_authStatus) {
      case AuthStatus.notSignedIn:
        return Login(model: widget.model, onSignedIn: _signedIn);
      case AuthStatus.signIn:
        return Home(model: widget.model, onSignedOut: _signedOut);
    }
    return null;
  }
}
