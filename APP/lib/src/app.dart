import 'package:SAICCIX/src/mixins/rootModel.dart';
import 'package:flutter/material.dart';
import 'screens/splashPage.dart';
import 'screens/home.dart';
import 'definitions/colors.dart';
import 'definitions/text.dart';
import 'sources/firebase.dart';

class App extends StatelessWidget {
  RootModel model;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TextDefinition().obterAppHomeText(),
      theme: ThemeData(
        primarySwatch: ColorsDefinitions().obterPrimarySwatch(),
      ),
      home: FutureBuilder(
        future: FirebaseJson().getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //print(snapshot.error);
          if (snapshot.data == null) {
            return Splash().screen();
          } else {
            return Home(snapshot.data);
          }
        },
      ),
    );
  }
}
