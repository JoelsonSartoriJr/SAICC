import 'package:flutter/material.dart';

class Minicurso extends StatefulWidget {
  @override
  createState() => _MinicursoState();
}

class _MinicursoState extends State<Minicurso> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Palestra')
      ),
    );
  }
}
