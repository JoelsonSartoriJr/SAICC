import 'package:flutter/material.dart';

class ImageDefinition{

  Image obterSplashScreenImage(){
    return Image.asset('assets/logosaicc.png', height: 55, width: 100, fit: BoxFit.scaleDown,);
  }
}