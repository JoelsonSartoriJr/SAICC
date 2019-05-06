import 'package:flutter/material.dart';
import '../widgets/slivergrid.dart';

class Patrocinadores extends StatefulWidget{
  @override
  createState() => _PatrocinadoresState();
}
class _PatrocinadoresState extends State<Patrocinadores> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Patrocinadores')
      ),
     body: CustomScrollView(
        slivers: <Widget>[
          SliverGrid.count(
            crossAxisCount: 1,
            children: SliverGridBuild().obterPatrocinadorGoldList()
          ),
          ///PARTE DOS OUTROS
          SliverGrid.count(
            crossAxisCount: 2,
            children: SliverGridBuild().obterPatrocinadorList(),
          ),
        ],
      ),
    );
  }
}