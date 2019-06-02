class FeedModel {
  String key;
  String descricao;
  String imagemtema;
  String titulo;

  FeedModel(this.descricao, this.imagemtema, this.titulo, this.key);

  FeedModel.fromJson(Map<String, dynamic> parsedJson, String id) {
    key = id;
    descricao = parsedJson['descricao'];
    titulo = parsedJson['titulo'];
    imagemtema = parsedJson['imagemtema'];
  }
}
