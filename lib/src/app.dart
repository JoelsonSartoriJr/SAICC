import 'package:flutter/material.dart';
import 'screens/splashPage.dart';
import 'screens/login.dart';
import 'screens/home.dart';
import 'definitions/colors.dart';
import 'definitions/text.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(  
      title: TextDefinition().obterAppHomeText(),
      theme: ThemeData(
        primarySwatch:  ColorsDefinitions().obterPrimarySwatch(),
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/LoginPage': (BuildContext context) => new LoginPage(),
        '/HomePage': (BuildContext context) => new Home()
      },
    );
  }
}