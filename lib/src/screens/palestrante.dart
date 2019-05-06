import 'package:flutter/material.dart';

class Palestrante extends StatefulWidget{
  @override
  createState() => _PalestranteState();
}
class _PalestranteState extends State<Palestrante> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Text('Palestrante'),
      ),
    );
  }
}
