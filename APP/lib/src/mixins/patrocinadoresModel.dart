import 'package:firebase_database/firebase_database.dart';
class PatrocinadoresModel {
  String key;
  String logo;
  String nome;
  String tipo;

  PatrocinadoresModel(this.key, this.logo, this.nome, this.tipo);

  PatrocinadoresModel.fromJson(Map<String, dynamic> parsedJson, String id) {
    key = id;
    logo = parsedJson['logo'];
    tipo = parsedJson['tipo'];
    nome = parsedJson['nome'];
  }

  PatrocinadoresModel.fromSnapshot(DataSnapshot snapshot, String id) {
    key = id;
    logo = snapshot.value['logo'];
    tipo = snapshot.value['tipo'];
    nome = snapshot.value['nome'];
  }
}
