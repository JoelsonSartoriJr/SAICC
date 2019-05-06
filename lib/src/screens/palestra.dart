import 'package:flutter/material.dart';

class Palestra extends StatefulWidget{
  @override
  createState() => _PalestraState();
}
class _PalestraState extends State<Palestra> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Palestra')
      ),
    );
  }
}
