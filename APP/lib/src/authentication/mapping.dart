import 'package:flutter/material.dart';
import 'authentication.dart';
import '../mixins/rootModel.dart';
import '../screens/login.dart';
import '../screens/home.dart';

class MappingPage extends StatefulWidget{
  final AuthImplementation auth;
  final RootModel model;
  
  MappingPage({
    this.auth,
    this.model
  });

  @override
  createState() => _MappingPageState();
}

enum AuthStatus{
  notSignedIn,
  signIn,
}

class _MappingPageState extends State<MappingPage>{
  AuthStatus _authStatus = AuthStatus.notSignedIn;
  
  void initState(){
    super.initState();
    widget.auth.getCurrentUser().then((firebaseUser){
      setState(() {
        _authStatus = firebaseUser == null ? AuthStatus.notSignedIn : AuthStatus.signIn;
      });
    });
  }

  void _signedIn(){
    setState(() {
     _authStatus =  AuthStatus.signIn;
    });
  }

  void _signedOut(){
    setState(() {
     _authStatus =  AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context){
    switch(_authStatus){
      case AuthStatus.notSignedIn:
        return Login(
          model: widget.model,
          auth: widget.auth,
          onSignedIn: _signedIn
        );
      case AuthStatus.signIn:
        return Home(model: widget.model, auth: widget.auth, onSignedOut: _signedOut);
    }
    return null;
  }
}