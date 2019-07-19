import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../mixins/eventosModel.dart';
import '../mixins/feedModel.dart';
import '../screens/dia.dart';
import '../screens/feed.dart';
import '../sources/firebase.dart';

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

  List<Widget> obterTabBarItensList(
      List<String> dia,
      List<EventosModel> eventos,
      List<FeedModel> feed,
      DatabaseReference ref,
      FirebaseUser user) {
    List<Widget> lista = new List<Widget>();
    if (user != null) {
      FirebaseDatabaseSnapshot().getFavoritos(ref, user.uid).then((mapeamento) {
        if (mapeamento != null) {
          for (int a = 0; a < mapeamento.length; a++) {
            int index = eventos.indexWhere((evento) =>
                evento.key == mapeamento[mapeamento.keys.elementAt(a)]);
            if (index != -1) {
              eventos[index].favoritar = true;
              eventos[index].keyfavorito = mapeamento.keys.elementAt(a);
            }
          }
        }
      });
    }
    lista.add(Feed(feed, ref));
    for (int a = 0; a < dia.length; a++) {
      lista.add(Dia(dia[a], eventos, ref, user == null ? '' : user.uid));
    }
    return lista;
  }
}
