import 'package:firebase_database/firebase_database.dart';
class FeedModel {
  String key;
  String descricao;
  String imagemtema;
  String titulo;
  String fonte;
  String imagemfonte;

  FeedModel(this.descricao, this.imagemtema, this.titulo, this.key, this.fonte, this.imagemfonte);

  FeedModel.fromJson(Map<String, dynamic> parsedJson, String id) {
    key = id;
    descricao = parsedJson['descricao'];
    titulo = parsedJson['titulo'];
    imagemtema = parsedJson['imagemtema'];
    fonte = parsedJson['fonte'];
    imagemfonte = parsedJson['imagemfonte'];
  }

  FeedModel.fromSnapshot(DataSnapshot snapshot, String id) {
    key = id;
    descricao = snapshot.value['descricao'];
    titulo = snapshot.value['titulo'];
    imagemtema = snapshot.value['imagemtema'];
    fonte = snapshot.value['fonte'];
    imagemfonte = snapshot.value['imagemfonte'];
  }
}
