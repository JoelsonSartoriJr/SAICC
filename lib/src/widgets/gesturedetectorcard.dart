import 'package:flutter/material.dart';
import '../mixins/feedModel.dart';
import '../definitions/text.dart';
import '../definitions/images.dart';

class CardFeed extends StatefulWidget {
  FeedModel model;
  CardFeed(this.model):super();
  @override
  _CardFeedState createState() {
    return new _CardFeedState();
  }
}

class _CardFeedState extends State<CardFeed> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Abrir facebook/abrir notícias no app
      },
      child: Card(
        child: new Column(
          children: <Widget>[
            new ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: ImageDefinition().obterFeedFonte(),
              ),
              title: new Text(
                TextDefinition().obterFeedFonteText(),
                style: new TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.model.imagemtema
                  ),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.rectangle,
              ),
              height: 150.0,
            ),
            ListTile(
              title: Text(widget.model.titulo),
            )
          ],
        ),
      ),
    );
  }
}
