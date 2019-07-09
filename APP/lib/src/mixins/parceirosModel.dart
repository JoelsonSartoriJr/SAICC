import 'package:firebase_database/firebase_database.dart';
class ParceirosModel {
  String key;
  String logo;
  String nome;

  ParceirosModel(this.key, this.logo, this.nome);

  ParceirosModel.fromJson(Map<String, dynamic> parsedJson, String id) {
    key = id;
    logo = parsedJson['logo'];
    nome = parsedJson['nome'];
  }

  ParceirosModel.fromSnapshot(DataSnapshot snapshot, String id) {
    key = id;
    logo = snapshot.value['logo'];
    nome = snapshot.value['nome'];
  }
}
