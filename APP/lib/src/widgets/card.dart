import 'package:flutter/material.dart';
import '../screens/palestra.dart';
import '../screens/palestrante.dart';
import '../mixins/eventosModel.dart';
import '../definitions/colors.dart';
import '../screens/maps.dart';

class CardPalestra extends StatefulWidget {
  EventosModel model;
  CardPalestra(this.model) : super();
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Palestra(widget.model),
                ),
              );
            },
            child: Container(
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: new NetworkImage(widget.model.imagemtema),
                  //fit: BoxFit.fill,
                ),
                shape: BoxShape.rectangle,
              ),
              height: 150.0,
            ),
          ),
          Container(
            color: Colors.blueAccent,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    widget.model.titulo,
                    style: TextStyle(
                      color: definitions.obterDiaCardText(),
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    widget.model.hora + ' - ' + widget.model.tipo,
                    style: TextStyle(
                      color: definitions.obterDiaCardText(),
                      fontSize: 15.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Palestra(widget.model),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        NetworkImage(widget.model.imagemperfilautor),
                  ),
                  title: Text(
                    widget.model.autor,
                    style: TextStyle(
                      color: definitions.obterDiaCardText(),
                      fontSize: 15.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Palestrante(widget.model),
                      ),
                    );
                  },
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.location_on),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => Maps(),
                            ),
                          );
                        },
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
