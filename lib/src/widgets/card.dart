import 'package:flutter/material.dart';
import '../screens/palestra.dart';
import '../screens/minicurso.dart';
import '../definitions/colors.dart';

class CardPalestra extends StatefulWidget {
  @override
  _CardPalestraState createState() {
    return new _CardPalestraState();
  }
}

class _CardPalestraState extends State<CardPalestra> {
  final definitions = ColorsDefinitions();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: new NetworkImage(
                    'https://www.ofitexto.com.br/wp-content/uploads/2019/03/2304-como-montar-uma-palestra.png'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.rectangle,
            ),
            height: 150.0,
          ),
          Container(
            color: Colors.blueAccent,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Introdução a IOT',
                    style: TextStyle(
                      color: definitions.obterDiaCardText(),
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Fundamentos de IOT',
                    style: TextStyle(
                      color: definitions.obterDiaCardText(),
                      fontSize: 15.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Palestra(),
                  ));
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage('http://i.pravatar.cc/300'),
                  ),
                  title: Text(
                    'Dr. Marcos Vila Boa',
                    style: TextStyle(
                      color: definitions.obterDiaCardText(),
                      fontSize: 15.0,
                    ),
                  ),
                  onTap: () {},
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.location_on),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardMinicurso extends StatefulWidget {
  @override
  _CardMinicursoState createState() {
    return new _CardMinicursoState();
  }
}

class _CardMinicursoState extends State<CardMinicurso> {
  final definitions = ColorsDefinitions();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: new NetworkImage(
                    'https://blog.even3.com.br/wp-content/uploads/2017/12/Aprenda-de-uma-vez-como-elaborar-um-minicurso-770x470.png'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.rectangle,
            ),
            height: 150.0,
          ),
          Container(
            color: Colors.blueAccent,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Introdução a IOT',
                    style: TextStyle(
                      color: definitions.obterDiaCardText(),
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Fundamentos de IOT',
                    style: TextStyle(
                      color: definitions.obterDiaCardText(),
                      fontSize: 15.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Minicurso(),
                  ));
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage('http://i.pravatar.cc/300'),
                  ),
                  title: Text(
                    'Dr. Marcos Vila Boa',
                    style: TextStyle(
                      color: definitions.obterDiaCardText(),
                      fontSize: 15.0,
                    ),
                  ),
                  onTap: () {},
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.location_on),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
