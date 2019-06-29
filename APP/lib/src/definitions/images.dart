import 'package:flutter/material.dart';

class ImageDefinition {
  Image obterSplashScreenImage() {
    return Image.asset(
      'assets/logosaicc.png',
      height: 140,
      width: 150,
      alignment: Alignment.center,
      fit: BoxFit.contain,
    );
  }

  ImageProvider obterPersonImage(String imagem) {
    if (imagem == '') {
      return AssetImage('assets/temp_person.png');
    } else {
      return NetworkImage(imagem);
    }
  }

  Widget obterPersonImageWidget(String imagem) {
    if (imagem == '') {
      return Image.asset(
        'assets/temp_person.png',
        fit: BoxFit.cover,
      );
    } else {
      return Image.network(
        imagem,
        fit: BoxFit.cover,
      );
    }
  }

  ImageProvider obterPalestraImage(String imagem) {
    if (imagem == '') {
      return AssetImage('assets/temp_palestra.jpg');
    } else {
      return NetworkImage(imagem);
    }
  }

  Widget obterPalestraImageWidget(String imagem) {
    if (imagem == '') {
      return Image.asset('assets/temp_palestra.jpg', fit: BoxFit.cover);
    } else {
      return Image.network(imagem, fit: BoxFit.cover);
    }
  }

  AssetImage obterDrawerTema() {
    return AssetImage('assets/logosaicc.png');
  }
}
