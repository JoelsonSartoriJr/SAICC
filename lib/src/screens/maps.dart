import 'package:flutter/material.dart';
import '../definitions/colors.dart';

class Maps extends StatefulWidget{
  @override
  createState() => _MapsState();
}
class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Maps'),
        backgroundColor: ColorsDefinitions().obterAppBarColor(),
      ),
    );
  }
}
