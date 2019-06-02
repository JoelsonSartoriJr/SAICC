import 'package:flutter/material.dart';
import '../widgets/gesturedetectorcard.dart';
import '../mixins/feedModel.dart';

class Feed extends StatefulWidget{
  List<FeedModel> feed;
  Feed(this.feed):super();
  @override
  createState() => _FeedState();
}
class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: obterListaCards(widget.feed),
        ),
    );
  }

  List<Widget> obterListaCards(List<FeedModel> feed) {

    List<Widget> lista = new List<Widget>();
    for (int a = 0; a < feed.length; a++) {
      lista.add(CardFeed(feed[a]));
    }
    return lista;
  }
}
