import 'diasModel.dart';
import 'eventosModel.dart';
import 'feedModel.dart';
import 'parceirosModel.dart';
import 'patrocinadoresModel.dart';

class RootModel{
  DiasModel dias;
  List<EventosModel> eventos = List<EventosModel>();
  List<FeedModel> feed = List<FeedModel>();
  List<ParceirosModel> parceiros = List<ParceirosModel>();
  List<PatrocinadoresModel> patrocinadores = List<PatrocinadoresModel>();

  RootModel(this.dias, this.eventos, this.feed, this.parceiros, this.patrocinadores);

  RootModel.fromJson(Map<String, dynamic> parsedJson){
    dias = DiasModel.fromJson(parsedJson['dias']);

    Map<String, dynamic> parsedEvent = parsedJson['eventos'];
    List<String> keys = parsedEvent.keys.toList();
    for(int a = 0; a< keys.length; a++){
      Map<String, dynamic> parsed = parsedEvent[keys[a]];
      eventos.add(EventosModel.fromJson(parsed, keys[a]));
    } 
    parsedEvent = parsedJson['feed'];
    keys = parsedEvent.keys.toList();
    for(int a = 0; a< keys.length; a++){
      Map<String, dynamic> parsed = parsedEvent[keys[a]];
      feed.add(FeedModel.fromJson(parsed, keys[a]));
    } 
    parsedEvent = parsedJson['parceiros'];
    keys = parsedEvent.keys.toList();
    for(int a = 0; a< keys.length; a++){
      Map<String, dynamic> parsed = parsedEvent[keys[a]];
      parceiros.add(ParceirosModel.fromJson(parsed, keys[a]));
    } 
    parsedEvent = parsedJson['patrocinadores'];
    keys = parsedEvent.keys.toList();
    for(int a = 0; a< keys.length; a++){
      Map<String, dynamic> parsed = parsedEvent[keys[a]];
      patrocinadores.add(PatrocinadoresModel.fromJson(parsed, keys[a]));
    } 
  }
}