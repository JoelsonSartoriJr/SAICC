import 'package:flutter/material.dart';
import '../widgets/gesturedetectorcard.dart';

class Feed extends StatefulWidget{
  @override
  createState() => _FeedState();
}
class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: obterListaCards('01/05'),
        ),
    );
  }

  List<Widget> obterListaCards(String dia) {
    int cards = 5;
    List<Widget> lista = new List<Widget>();
    for (int a = 0; a < cards; a++) {
      lista.add(CardFeed());
    }
    return lista;
  }
}
