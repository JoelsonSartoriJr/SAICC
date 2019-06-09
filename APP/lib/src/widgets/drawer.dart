import 'package:flutter/material.dart';
import '../screens/parceiros.dart';
import '../screens/patrocinadores.dart';
import '../screens/maps.dart';
import '../screens/equipe.dart';
import '../mixins/parceirosModel.dart';
import '../mixins/patrocinadoresModel.dart';
import '../definitions/images.dart';

class SideMenu extends StatefulWidget {
  List<ParceirosModel> parceiros;
  List<PatrocinadoresModel> patrocinadores;
  SideMenu(this.parceiros, this.patrocinadores) : super();
  @override
  _SideMenuState createState() {
    return new _SideMenuState();
  }
}

class _SideMenuState extends State<SideMenu> {
  bool notification = true;
  bool favoritos = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            //decoration:
            accountName: Text(''),
            accountEmail: Text(''),
            //currentAccountPicture: CircleAvatar(
            //backgroundImage: ImageDefinition().obterDrawerTema(),
            //),
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
                    builder: (BuildContext context) =>
                        Parceiros(widget.parceiros),
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
            title: Text('Equipe'),
            leading: Icon(Icons.people),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Equipe(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
