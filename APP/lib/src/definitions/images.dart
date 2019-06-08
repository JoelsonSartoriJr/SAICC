import 'package:flutter/material.dart';

class ImageDefinition {
  Image obterSplashScreenImage() {
    return Image.asset(
      'assets/logosaicc.png',
      height: 55,
      width: 100,
      fit: BoxFit.scaleDown,
    );
  }

  NetworkImage obterFeedFonte(String imagem) {
    if (imagem == '') {
      return NetworkImage(
          "https://scontent.fpet2-1.fna.fbcdn.net/v/t1.0-9/40888477_1954333701294842_820183408863870976_n.png?_nc_cat=107&_nc_ht=scontent.fpet2-1.fna&oh=3314adf59daaf98ab0999aa560b04800&oe=5D513903");
    } else {
      return NetworkImage(imagem);
    }
  }

  AssetImage obterDrawerTema() {
    return AssetImage('assets/logosaicc.png');
  }
}
