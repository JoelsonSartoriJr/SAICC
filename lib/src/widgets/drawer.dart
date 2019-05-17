import 'package:flutter/material.dart';
import '../screens/parceiros.dart';
import '../screens/patrocinadores.dart';
import '../screens/maps.dart';

class SideMenu extends StatefulWidget {
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
            accountName: Text('Armani'),
            accountEmail: Text('armany@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('http://i.pravatar.cc/300'),
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
                    builder: (BuildContext context) => Parceiros(),
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
                    builder: (BuildContext context) => Patrocinadores(),
                  ));
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
                    builder: (BuildContext context) => Patrocinadores(),
                  ));
            },
          )
        ],
      ),
    );
  }
}
