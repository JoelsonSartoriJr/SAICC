import 'package:flutter/material.dart';
import '../mixins/eventosModel.dart';
import '../mixins/feedModel.dart';
import '../mixins/diasModel.dart';
import '../screens/dia.dart';
import '../screens/feed.dart';

class TabBarBuild {
  List<Widget> obterTabBarList(List<String> dia) {
    List<Widget> lista = new List<Widget>();
    lista.add(new Tab(
      text: 'Feed',
    ));
    for (int a = 0; a < dia.length; a++) {
      lista.add(new Tab(
      text: dia[a],
    ));
    }
    return lista;
  }
  List<Widget> obterTabBarItensList(List<String> dia, List<EventosModel> eventos, List<FeedModel> feed) {
    List<Widget> lista = new List<Widget>();
    lista.add(Feed(feed));
    for (int a = 0; a < dia.length; a++) {
      lista.add(Dia(dia[a], eventos));
    }
    return lista;
  }
}