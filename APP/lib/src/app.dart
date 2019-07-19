import 'package:flutter/material.dart';
import 'screens/splashPage.dart';
import 'authentication/mapping.dart';
import 'authentication/authentication.dart';
import 'authentication/authprovider.dart';
import 'definitions/colors.dart';
import 'definitions/text.dart';
import 'sources/firebase.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
      title: TextDefinition().obterAppHomeText(),
      theme: ThemeData(
        primarySwatch: ColorsDefinitions().obterPrimarySwatch(),
      ),
      home: FutureBuilder(
        future: FirebaseDatabaseSnapshot().getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.error != null) {
            //print(snapshot.error);
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: const Text('Algo saiu errado!'),
                    children: <Widget>[Text(snapshot.error.toString())],
                  );
                });
          }
          if (snapshot.data == null) {
            return Splash().screen();
          } else {
            return MappingPage(model: snapshot.data);
          }
        },
      ),
      ),
    );
  }
}
