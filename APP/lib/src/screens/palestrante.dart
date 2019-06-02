import 'package:flutter/material.dart';
import '../definitions/colors.dart';
import '../screens/palestra.dart';
import '../mixins/eventosModel.dart';

class Palestrante extends StatefulWidget {
  EventosModel model;
  Palestrante(this.model) : super();
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
                widget.model.imagemperfilautor,
                fit: BoxFit.cover,
              ),
              title: Text(
                widget.model.autor,
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
                    widget.model.autoremail,
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
                    widget.model.autorformacao,
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
                    'Palestra Ministrada:',
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => Palestra(widget.model),
                      //   ),
                      // );
                    },
                    child: Text(
                      widget.model.titulo,
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
                    widget.model.autorprofissao,
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
