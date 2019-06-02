import 'package:flutter/material.dart';
import '../widgets/card.dart';
import '../mixins/eventosModel.dart';

class Dia extends StatefulWidget {
  String dia;
  List<EventosModel> eventos;
  Dia(this.dia, this.eventos) : super();
  @override
  createState() => _DiaState();
}

class _DiaState extends State<Dia> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView(
        children: obterListaCards(widget.eventos, widget.dia),
      ),
    );
  }

  List<Widget> obterListaCards(List<EventosModel> eventos, String dia) {
    List<EventosModel> eventodia = List<EventosModel>();
    for (int a = 0; a < eventos.length; a++) {
      if (eventos[a].data == dia) {
        eventodia.add(eventos[a]);
      }
    }
    List<Widget> lista = new List<Widget>();
    for (int a = 0; a < eventodia.length; a++) {
      lista.add(CardPalestra(eventodia[a]));
    }
    return lista;
  }
}
