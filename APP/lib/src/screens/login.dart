import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../authentication/authentication.dart';
import '../mixins/rootModel.dart';
import '../screens/home.dart';

class Login extends StatefulWidget {
  final RootModel model;
  final AuthImplementation auth;
  final VoidCallback onSignedIn;

  Login({this.model, this.auth, this.onSignedIn});

  @override
  createState() => _LoginState();
}

enum FormType { login, register }

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  FormType _formType = FormType.login;
  String _email = "";
  String _password = "";
  String _label = 'Login';
  FirebaseUser _user;

  bool validateAndSave() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          _user = await widget.auth.signIn(_email, _password);
          print(_user);
        } else {
          _user = await widget.auth.signUp(_email, _password);
          print(_user);
        }
        widget.onSignedIn();
      } catch (e) {
        print(e.toString());
      }
    }
  }

  void validateAndResetPassword() async {
    if (validateAndSave()) {
      try {
        await widget.auth.requestNewPassword(_email);
      } catch (e) {
        print(e.toString());
      }
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();

    setState(() {
      _label = 'Registrar';
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();

    setState(() {
      _label = 'Login';
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2.5,
                          decoration: BoxDecoration(
                            color: Colors.red.shade900,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(70),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                height: MediaQuery.of(context).size.height / 3,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset('assets/logooriginal.png'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 42),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                height: 50,
                                padding: EdgeInsets.only(
                                  top: 4,
                                  left: 16,
                                  right: 16,
                                  bottom: 4,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 5,
                                      ),
                                    ]),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: 'Email',
                                      icon: Icon(Icons.email)),
                                  validator: (value) {
                                    return value.isEmpty
                                        ? 'Email obrigatório.'
                                        : null;
                                  },
                                  onSaved: (value) {
                                    return _email = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 32),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                height: 50,
                                padding: EdgeInsets.only(
                                  top: 4,
                                  left: 16,
                                  right: 16,
                                  bottom: 4,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 5,
                                      ),
                                    ]),
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: 'Senha',
                                      icon: Icon(Icons.vpn_key)),
                                  validator: (value) {
                                    return value.isEmpty
                                        ? 'Senha obrigatória.'
                                        : null;
                                  },
                                  onSaved: (value) {
                                    return _email = value;
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(right: 8.0, top: 8.0),
                                  child: FlatButton(
                                    child: Text(
                                      'Esqueci a senha',
                                      style: TextStyle(
                                          fontSize: 12.5, color: Colors.grey),
                                    ),
                                    onPressed: validateAndResetPassword,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.red.shade900,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                            child: FlatButton(
                              child: Text(
                                _label,
                                style: TextStyle(fontSize: 20.0),
                              ),
                              textColor: Colors.white,
                              onPressed: validateAndSubmit,
                            )),
                        FlatButton(
                          child: Text(
                            'Criar Conta',
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.grey),
                          ),
                          onPressed: moveToRegister,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: FlatButton(
                                child: Text(
                                  'SKiP',
                                  style: TextStyle(
                                      fontSize: 12.5, color: Colors.grey),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => Home(
                                        model: widget.model,
                                        auth: null,
                                        onSignedOut: null,
                                        user: _user,
                                      ),
                                    ),
                                  );
                                },
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
