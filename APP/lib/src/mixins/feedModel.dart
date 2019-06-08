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
}
