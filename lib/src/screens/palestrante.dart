import 'package:flutter/material.dart';
import '../definitions/colors.dart';
import '../screens/palestra.dart';

class Palestrante extends StatefulWidget {
  @override
  createState() => _PalestranteState();
}

class _PalestranteState extends State<Palestrante> {
  @override
  Widget build(BuildContext context) {
    final definitions = ColorsDefinitions();
    return Scaffold(
      body: CustomScrollView(
        cacheExtent: 10.0,
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'http://i.pravatar.cc/300',
                fit: BoxFit.cover,
              ),
              title: Text(
                'Armani',
                style: TextStyle(
                  color: definitions.obterPalestranteNome(),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.only(bottom:2.0, top: 2.0, right: 10.0, left: 10.0),
                  child: Text(
                    'Email:',
                    style: TextStyle(
                      color: definitions.obterPalestranteText(),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      height: 2.0,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom:2.0, top: 2.0, right: 10.0, left: 10.0),
                  child: Text(
                    'armany@gmail.com',
                    style: TextStyle(
                      color: definitions.obterPalestranteText(),
                      fontSize: 20.0,
                      height: 2.0,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom:2.0, top: 2.0, right: 10.0, left: 10.0),
                  child: Text(
                    'Especializações:',
                    style: TextStyle(
                      color: definitions.obterPalestranteText(),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      height: 2.0,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom:2.0, top: 2.0, right: 10.0, left: 10.0),
                  child: Text(
                    'Graduação em engenharia da computação em 1980; Mestrado em tecnologias para a internet em 1994; Doutorado em internet das coisas em 2001;',
                    style: TextStyle(
                      color: definitions.obterPalestranteText(),
                      fontSize: 20.0,
                      height: 2.0,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom:2.0, top: 2.0, right: 10.0, left: 10.0),
                  child: Text(
                    'Palestras Ministradas:',
                    style: TextStyle(
                      color: definitions.obterPalestranteText(),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      height: 2.0,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom:2.0, top: 2.0, right: 10.0, left: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Palestra(),
                        ),
                      );
                    },
                    child: Text(
                      'Introdução a IOT',
                      style: TextStyle(
                        color: definitions.obterPalestranteText(),
                        fontSize: 20.0,
                        height: 2.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom:2.0, top: 2.0, right: 10.0, left: 10.0),
                  child: Text(
                    'Trabalho:',
                    style: TextStyle(
                      color: definitions.obterPalestranteText(),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      height: 2.0,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom:2.0, top: 2.0, right: 10.0, left: 10.0),
                  child: Text(
                    'Gerente de projetos IOT na SAP',
                    style: TextStyle(
                      color: definitions.obterPalestranteText(),
                      fontSize: 20.0,
                      height: 2.0,
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
