import 'package:flutter/material.dart';

class SliverGridBuild {
  List<Widget> obterParceirosList() {
    int qtd = 100;
    List<Widget> lista = new List<Widget>();
    for (int i = 0; i < qtd; i++) {
      lista.add(
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              width: 75.0,
              height: 75.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(
                      'https://pt.freelogodesign.org/Content/img/logo-ex-7.png'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Text(
              'Parceiro',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }
    return lista;
  }

  List<Widget> obterPatrocinadorList() {
    int qtd = 100;
    List<Widget> lista = new List<Widget>();
    for (int i = 0; i < qtd; i++) {
      lista.add(
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              width: 75.0,
              height: 75.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(
                      'https://pt.freelogodesign.org/Content/img/logo-ex-7.png'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Text(
              'Patrocinador',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }
    return lista;
  }

  List<Widget> obterPatrocinadorGoldList() {
    List<Widget> lista = new List<Widget>();
    lista.add(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            width: 175.0,
            height: 175.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: new NetworkImage(
                    'https://pt.freelogodesign.org/Content/img/logo-ex-7.png'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          Text(
            'Parceiro',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
    return lista;
  }
}
