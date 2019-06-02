class EventosModel {
  String key;
  String autor;
  String autoremail;
  String autorformacao;
  String autorprofissao;
  int avaliacao;
  int contadoravaliacoes;
  String data;
  String descricao;
  String hora;
  String imagemperfilautor;
  String imagemtema;
  String subtitulo;
  String tipo;
  String titulo;

  EventosModel(
      this.key,
      this.tipo,
      this.autor,
      this.autoremail,
      this.autorformacao,
      this.autorprofissao,
      this.avaliacao,
      this.contadoravaliacoes,
      this.data,
      this.descricao,
      this.hora,
      this.imagemperfilautor,
      this.imagemtema,
      this.subtitulo,
      this.titulo);

  EventosModel.fromJson(Map<String, dynamic> parsedJson, String id) {
    key = id;
    tipo = parsedJson['tipo'];
    autor = parsedJson['autor'];
    autoremail = parsedJson['autoremail'];
    autorformacao = parsedJson['autorformacao'];
    autorprofissao = parsedJson['autorprofissao'];
    avaliacao = parsedJson['avaliacao'];
    contadoravaliacoes = parsedJson['contadoravaliacoes'];
    data = parsedJson['data'];
    descricao = parsedJson['descricao'];
    hora = parsedJson['hora'];
    imagemperfilautor = parsedJson['imagemperfilautor'];
    subtitulo = parsedJson['subtitulo'];
    titulo = parsedJson['titulo'];
    imagemtema = parsedJson['imagemtema'];
  }
}
