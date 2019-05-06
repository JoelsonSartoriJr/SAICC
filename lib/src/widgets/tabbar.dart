import 'package:flutter/material.dart';
import '../screens/dia.dart';
import '../screens/feed.dart';

class TabBarBuild {
  List<Widget> obterTabBarList() {
    int dias = 5;
    List<Widget> lista = new List<Widget>();
    lista.add(new Tab(
      text: 'Feed',
    ));
    for (int a = 0; a < dias; a++) {
      lista.add(new Tab(
      text: (a+1).toString()+'/05',
    ));
    }
    return lista;
  }
  List<Widget> obterTabBarItensList() {
    int dias = 5;
    List<Widget> lista = new List<Widget>();
    lista.add(Feed());
    for (int a = 0; a < dias; a++) {
      lista.add(Dia());
    }
    return lista;
  }
}
