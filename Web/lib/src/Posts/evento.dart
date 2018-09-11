import 'package:Web/src/Posts/post.dart';

class Evento extends Post {
  String _local;
  String _organizadores;

  Evento(String key, String nome, String imagem, String descricao,
      String contato, this._local, this._organizadores)
      : super(key, nome, imagem, descricao, contato);

  ///Gets
  String get local => _local;
  String get organizadores => _organizadores;

  ///Sets
  set local(String value) => _local = value;
  set organizadores(String value) => _organizadores = value;

  @override
  Map toMap() => {
      "nome": nome,
      "imagem": imagem,
      "descricao": descricao,
      "contato": contato,
      "local": local,
      "organizadores": organizadores
    };
}
