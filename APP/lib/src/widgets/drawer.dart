import 'package:SAICCIX/src/mixins/organizacaoModel.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  bool notification = false;
  bool favoritos = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: obterItens(),
      ),
    );
  }

  List<Widget> obterItens() {
    List<Widget> lista = [
      UserAccountsDrawerHeader(
       // decoration:
        accountName: Text(''),
        accountEmail: Text(widget.user == null? '' : widget.user.email),
        currentAccountPicture: CircleAvatar(
        backgroundImage: widget.user == null? ImageDefinition().obterPersonImage(''): ImageDefinition().obterPersonImage(widget.user.photoUrl),
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
        onTap: () {
          //widget.ref;
          setState(() {
            notification = !notification;
          });
        },
        trailing: new Checkbox(
            value: notification,
            onChanged: (bool value) {
              setState(() {
                notification = value;
              });
            }),
      ),
      Divider(
        color: Colors.black,
        height: 5.0,
      ),
      ListTile(
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
      ),
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
