import 'package:flutter/material.dart';
import '../widgets/slivergrid.dart';

class Parceiros extends StatefulWidget {
  @override
  createState() => _ParceirosState();
}

class _ParceirosState extends State<Parceiros> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Parceiros')),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverGrid.count(
            crossAxisCount: 2,
            children: SliverGridBuild().obterParceirosList(), 
          ),
        ],
      ),
    );
  }
}
