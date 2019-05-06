import 'package:flutter/material.dart';

class CardFeed extends StatefulWidget {
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
                backgroundImage: NetworkImage("http://i.pravatar.cc/300"),
              ),
              title: new Text(
                "PET Ciências Computacionais",
                style: new TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://images.pexels.com/photos/556416/pexels-photo-556416.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
                  ),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.rectangle,
              ),
              height: 150.0,
            ),
            ListTile(
              title: Text("Plantio acontecendo."),
            )
          ],
        ),
      ),
    );
    ;
  }
}
