class OrganizacaoModel {
  String key;
  String imagem;
  String nome;

  OrganizacaoModel(this.key, this.imagem, this.nome);

  OrganizacaoModel.fromJson(Map<String, dynamic> parsedJson, String id) {
    key = id;
    imagem = parsedJson['imagem'];
    nome = parsedJson['nome'];
  }
}
