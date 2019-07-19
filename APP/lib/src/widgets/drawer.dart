import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../app.dart';
import '../authentication/authentication.dart';
import '../authentication/authprovider.dart';
import '../screens/parceiros.dart';
import '../screens/patrocinadores.dart';
import '../screens/maps.dart';
import '../screens/desenvolvedores.dart';
import '../screens/organizacao.dart';
import '../mixins/parceirosModel.dart';
import '../mixins/patrocinadoresModel.dart';
import '../mixins/organizacaoModel.dart';
import '../sources/firebase.dart';
import '../definitions/images.dart';

class SideMenu extends StatefulWidget {
  final FirebaseUser user;
  final VoidCallback onSignedOut;
  List<ParceirosModel> parceiros;
  List<PatrocinadoresModel> patrocinadores;
  List<OrganizacaoModel> organizacao;
  DatabaseReference ref;
  SideMenu(this.parceiros, this.patrocinadores, this.organizacao, this.ref,
      this.onSignedOut, this.user)
      : super();
  @override
  _SideMenuState createState() {
    return new _SideMenuState();
  }
}

class _SideMenuState extends State<SideMenu> {
  bool _notification = false;
  //bool favoritos = false;
  final FirebaseMessaging _messaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();

    _messaging.configure(
      onMessage: (Map<String, dynamic> message) {
        //print('on message $message');
      },
      onResume: (Map<String, dynamic> message) {
        //print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) {
        //print('on launch $message');
      },
    );
    setNotificationsOnStart();
    _messaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: obterItens(),
      ),
    );
  }

  void setNotificationsOnTap() {
    _messaging.getToken().then((token) {
      FirebaseDatabaseSnapshot()
          .getTokenSmartphone(widget.ref, token, widget.user)
          .then((valor) {
        FirebaseDatabaseSnapshot()
            .updateTokenSmartphone(widget.ref, token, widget.user, valor)
            .then((valor) {
          setState(() {
            _notification = valor;
          });
        });
      });
    });
  }

  void setNotificationsOnStart() {
    _messaging.getToken().then((token) {
      FirebaseDatabaseSnapshot()
          .getTokenSmartphone(widget.ref, token, widget.user)
          .then((valor) {
        setState(() {
          _notification = valor;
        });
      });
    });
  }

  List<Widget> obterItens() {
    List<Widget> lista = [
      UserAccountsDrawerHeader(
        // decoration:
        accountName: Text(''),
        accountEmail: Text(
          widget.user == null ? '' : widget.user.email,
          style: TextStyle(color: Colors.black),
        ),
        currentAccountPicture: CircleAvatar(
          backgroundImage: widget.user == null
              ? ImageDefinition().obterPersonImage('')
              : ImageDefinition().obterPersonImage(widget.user.photoUrl),
        ),
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          image: new DecorationImage(
            //: BoxFit.fill,
            image: ImageDefinition().obterDrawerTema(),
          ),
        ),
      ),
      ListTile(
        title: Text('Notificação'),
        leading: Icon(Icons.notifications),
        onTap: setNotificationsOnTap,
        trailing: new Checkbox(
          value: _notification,
          onChanged: (value) {
            setNotificationsOnTap();
            setState(() {
              _notification = value;
            });
          },
        ),
      ),
      Divider(
        color: Colors.black,
        height: 5.0,
      ),
      /*ListTile(
        title: Text('Favoritos'),
        leading: Icon(Icons.favorite),
        onTap: () {
          //widget.ref;
          setState(() {
            favoritos = !favoritos;
          });
        },
        trailing: new Checkbox(
            value: favoritos,
            onChanged: (bool value) {
              setState(() {
                favoritos = value;
              });
            }),
      ),
      Divider(
        color: Colors.black,
        height: 5.0,
      ),*/
      ListTile(
        title: Text('Como chegar'),
        leading: Icon(Icons.place),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Maps(),
            ),
          );
        },
      ),
      Divider(
        color: Colors.black,
        height: 5.0,
      ),
      ListTile(
        title: Text('Parceiros'),
        leading: Icon(Icons.people),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Parceiros(widget.parceiros),
              ));
        },
      ),
      Divider(
        color: Colors.black,
        height: 5.0,
      ),
      ListTile(
        title: Text('Patrocinadores'),
        leading: Icon(Icons.people),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  Patrocinadores(widget.patrocinadores),
            ),
          );
        },
      ),
      Divider(
        color: Colors.black,
        height: 5.0,
      ),
      ListTile(
        title: Text('Organizadores'),
        leading: Icon(Icons.people),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  Organizacao(widget.organizacao),
            ),
          );
        },
      ),
      Divider(
        color: Colors.black,
        height: 5.0,
      ),
      ListTile(
        title: Text('Desenvolvedores'),
        leading: Icon(Icons.people),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Desenvolvedores(),
            ),
          );
        },
      ),
    ];
    if (widget.user != null) {
      lista.add(
        Divider(
          color: Colors.black,
          height: 5.0,
        ),
      );
      lista.add(
        ListTile(
          title: Text('Logout'),
          leading: Icon(Icons.exit_to_app),
          onTap: () {
            _logout(context);
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => App(),
              ),
            );
          },
        ),
      );
    }
    return lista;
  }

  Future<void> _logout(BuildContext context) async {
    try {
      final AuthImplementation auth = AuthProvider.of(context).auth;
      await auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }
}
