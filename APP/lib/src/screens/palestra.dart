import 'package:flutter/material.dart';
import '../definitions/colors.dart';
import '../definitions/images.dart';
import '../mixins/eventosModel.dart';
import '../screens/maps.dart';

class Palestra extends StatefulWidget {
  EventosModel model;
  Palestra(this.model) : super();
  @override
  createState() => _PalestraState();
}

class _PalestraState extends State<Palestra> {
  @override
  Widget build(BuildContext context) {
    final definitions = ColorsDefinitions();
    return Scaffold(
      body: CustomScrollView(
        cacheExtent: 10.0,
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: ImageDefinition()
                  .obterPalestraImageWidget(widget.model.imagemtema),
              title: Text(
                widget.model.tipo + ' - ' + widget.model.hora,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.favorite),
                        color: Colors.grey[600],
                        onPressed: () {},
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 95.0),
                      ),
                      IconButton(
                        icon: Icon(Icons.location_on),
                        color: Colors.grey[600],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => Maps(),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 95.0),
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                        color: Colors.grey[600],
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Text(
                  widget.model.titulo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: definitions.obterPalestraText(),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.model.subtitulo,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: definitions.obterPalestraText(),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: 10.0, top: 5.0, right: 20.0, left: 20.0),
                  child: Text(
                    widget.model.descricao,
                    style: TextStyle(
                      color: definitions.obterPalestraText(),
                      fontSize: 17.0,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Divider(
                  color: Colors.black,
                  height: 5.0,
                ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: 10.0, top: 5.0, right: 10.0, left: 10.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 2.0, top: 2.0, right: 10.0, left: 10.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: ImageDefinition()
                              .obterPersonImage(widget.model.imagemperfilautor),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                      ),
                      Text(
                        widget.model.autor,
                        style: TextStyle(
                          color: definitions.obterPalestraText(),
                          fontSize: 20.0,
                          height: 2.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
