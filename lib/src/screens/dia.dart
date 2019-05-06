import 'package:flutter/material.dart';
import '../widgets/card.dart';

class Dia extends StatefulWidget {
  @override
  createState() => _DiaState();
}

class _DiaState extends State<Dia> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView(
        children: obterListaCards('01/05'),
        ),
    );
  }

  List<Widget> obterListaCards(String dia) {
    int cards = 5;
    List<Widget> lista = new List<Widget>();
    for (int a = 0; a < cards; a++) {
      if(a%2==0){
      lista.add(CardPalestra());
      }
      else{
        lista.add(CardMinicurso());
      }
    }
    return lista;
  }
}
