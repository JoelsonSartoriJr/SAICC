import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';
import 'diasModel.dart';
import 'eventosModel.dart';
import 'feedModel.dart';
import 'parceirosModel.dart';
import 'patrocinadoresModel.dart';
import 'organizacaoModel.dart';

class RootModel {
  DatabaseReference referencia;
  DiasModel dias;
  List<EventosModel> eventos = List<EventosModel>();
  List<FeedModel> feed = List<FeedModel>();
  List<ParceirosModel> parceiros = List<ParceirosModel>();
  List<PatrocinadoresModel> patrocinadores = List<PatrocinadoresModel>();
  List<OrganizacaoModel> organizacao = List<OrganizacaoModel>();

  RootModel(this.dias, this.eventos, this.feed, this.parceiros,
      this.patrocinadores, this.organizacao, this.referencia);

  RootModel.fromJson(Map<String, dynamic> parsedJson) {
    dias = DiasModel.fromJson(parsedJson['dias']);

    Map<String, dynamic> parsedEvent = parsedJson['eventos'];
    List<String> keys = parsedEvent.keys.toList();
    for (int a = 0; a < keys.length; a++) {
      Map<String, dynamic> parsed = parsedEvent[keys[a]];
      eventos.add(EventosModel.fromJson(parsed, keys[a]));
    }
    parsedEvent = parsedJson['feed'];
    keys = parsedEvent.keys.toList();
    for (int a = 0; a < keys.length; a++) {
      Map<String, dynamic> parsed = parsedEvent[keys[a]];
      feed.add(FeedModel.fromJson(parsed, keys[a]));
    }
    parsedEvent = parsedJson['parceiros'];
    keys = parsedEvent.keys.toList();
    for (int a = 0; a < keys.length; a++) {
      Map<String, dynamic> parsed = parsedEvent[keys[a]];
      parceiros.add(ParceirosModel.fromJson(parsed, keys[a]));
    }
    parsedEvent = parsedJson['patrocinadores'];
    keys = parsedEvent.keys.toList();
    for (int a = 0; a < keys.length; a++) {
      Map<String, dynamic> parsed = parsedEvent[keys[a]];
      patrocinadores.add(PatrocinadoresModel.fromJson(parsed, keys[a]));
    }

    parsedEvent = parsedJson['organizacao'];
    keys = parsedEvent.keys.toList();
    for (int a = 0; a < keys.length; a++) {
      Map<String, dynamic> parsed = parsedEvent[keys[a]];
      organizacao.add(OrganizacaoModel.fromJson(parsed, keys[a]));
    }
  }


  RootModel.fromSnapshot(DataSnapshot snapshot) {
    String dados = jsonEncode(snapshot.value);
    
    Map<String, dynamic> mapeamento = json.decode(dados);
    
    dias = DiasModel.fromJson(mapeamento['dias']);

    Map<String, dynamic> parsedEvent = mapeamento['eventos'];
    List<String> keys = parsedEvent.keys.toList();
    for (int a = 0; a < keys.length; a++) {
      Map<String, dynamic> parsed = parsedEvent[keys[a]];
      eventos.add(EventosModel.fromJson(parsed, keys[a]));
    }

    parsedEvent = mapeamento['feed'];
    keys = parsedEvent.keys.toList();
    for (int a = 0; a < keys.length; a++) {
      Map<String, dynamic> parsed = parsedEvent[keys[a]];
      feed.add(FeedModel.fromJson(parsed, keys[a]));
    }
    parsedEvent = mapeamento['parceiros'];
    keys = parsedEvent.keys.toList();
    for (int a = 0; a < keys.length; a++) {
      Map<String, dynamic> parsed = parsedEvent[keys[a]];
      parceiros.add(ParceirosModel.fromJson(parsed, keys[a]));
    }
    parsedEvent = mapeamento['patrocinadores'];
    keys = parsedEvent.keys.toList();
    for (int a = 0; a < keys.length; a++) {
      Map<String, dynamic> parsed = parsedEvent[keys[a]];
      patrocinadores.add(PatrocinadoresModel.fromJson(parsed, keys[a]));
    }

    parsedEvent = mapeamento['organizacao'];
    keys = parsedEvent.keys.toList();
    for (int a = 0; a < keys.length; a++) {
      Map<String, dynamic> parsed = parsedEvent[keys[a]];
      organizacao.add(OrganizacaoModel.fromJson(parsed, keys[a]));
    }
  }
}
