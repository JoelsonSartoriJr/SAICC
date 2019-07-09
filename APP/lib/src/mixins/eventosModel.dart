import 'package:firebase_database/firebase_database.dart';
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
  String lattes;
  String linkedin;
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
      this.lattes,
      this.linkedin,
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
    lattes = parsedJson['lattes'];
    linkedin = parsedJson['linkedin'];
    subtitulo = parsedJson['subtitulo'];
    titulo = parsedJson['titulo'];
    imagemtema = parsedJson['imagemtema'];
  }

  EventosModel.fromSnapshot(DataSnapshot snapshot, String id) {
    key = id;
    tipo = snapshot.value['tipo'];
    autor = snapshot.value['autor'];
    autoremail = snapshot.value['autoremail'];
    autorformacao = snapshot.value['autorformacao'];
    autorprofissao = snapshot.value['autorprofissao'];
    avaliacao = snapshot.value['avaliacao'];
    contadoravaliacoes = snapshot.value['contadoravaliacoes'];
    data = snapshot.value['data'];
    descricao = snapshot.value['descricao'];
    hora = snapshot.value['hora'];
    imagemperfilautor = snapshot.value['imagemperfilautor'];
    lattes = snapshot.value['lattes'];
    linkedin = snapshot.value['linkedin'];
    subtitulo = snapshot.value['subtitulo'];
    titulo = snapshot.value['titulo'];
    imagemtema = snapshot.value['imagemtema'];
  }
}
