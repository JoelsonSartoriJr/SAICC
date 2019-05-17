import 'package:flutter/material.dart';
import '../screens/palestrante.dart';
import '../definitions/colors.dart';

class Palestra extends StatefulWidget {
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
              background: Image.network(
                'https://blog.even3.com.br/wp-content/uploads/2017/12/Aprenda-de-uma-vez-como-elaborar-um-minicurso-770x470.png',
                fit: BoxFit.cover,
              ),
              title: Text(
                'IOT FUNDAMENTOS',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Center(
                  child: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: 2.0,
                                  top: 2.0,
                                  right: 10.0,
                                  left: 10.0),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    NetworkImage('http://i.pravatar.cc/300'),
                              ),
                            ),
                            Text(
                              'Armani',
                              style: TextStyle(
                                color: definitions.obterPalestraText(),
                                fontSize: 20.0,
                                height: 2.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom: 2.0, top: 2.0, right: 10.0, left: 10.0),
                          width: 100,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 2.0, top: 2.0, right: 10.0, left: 10.0),
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.favorite),
                              color: Colors.grey[600],
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.location_on),
                              color: Colors.grey[600],
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.share),
                              color: Colors.grey[600],
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: 2.0, top: 2.0, right: 10.0, left: 10.0),
                  child: Text(
                    'A internet das coisas nada mais é que uma rede de objetos físicos (veículos, prédios e outros dotados de tecnologia embarcada, sensores e conexão com a rede) capaz de coletar e transmitir dados. É uma extensão da internet atual que possibilita que objetos do dia-a-dia (quaisquer que sejam, mas com capacidade computacional e de comunicação) se conectem à Internet. A conexão com a rede mundial de computadores possibilita, em primeiro lugar, controlar remotamente os objetos e, em segundo lugar, que os próprios objetos sejam acessados como provedores de serviços. Essas novas capacidades dos objetos comuns geram um grande número de possibilidades, tanto no âmbito acadêmico quanto no industrial. Todavia, tais possibilidades apresentam riscos e representam grandes desafios técnicos e sociais.',
                    style: TextStyle(
                      color: definitions.obterPalestraText(),
                      fontSize: 17.0,
                      height: 2.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
