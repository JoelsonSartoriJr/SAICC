class DiasModel{
  List<String> dia = List<String>();

  DiasModel(this.dia);
  DiasModel.fromJson(Map<String, dynamic> parsedJson){
    List<String> keys = parsedJson.keys.toList();
    for(int a = 0; a< keys.length; a++){
      Map<String, dynamic> parsed = parsedJson[keys[a]];
      dia.add(parsed['dia']);
    } 
  }
}