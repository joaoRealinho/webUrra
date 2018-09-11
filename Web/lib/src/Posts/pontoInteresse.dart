import 'package:Web/src/Posts/post.dart';

class PontoInteresse extends Post {
  String _local;
  String _horarioFun;

  ///Construtor
  PontoInteresse(
      String key, String nome, String imagem, String descricao, String contato, this._local,
      [this._horarioFun]) //([this._horas] significa que e opcional)
      : super(key, nome, imagem, descricao, contato);

  ///Gets
  String get horarioFun => _horarioFun;
  String get local => _local;

  ///Sets
  set horarioFun(String value) => _horarioFun = value;
  set local(String value) => _local = value;


  @override
  Map toMap()  => {
    "nome": nome,
    "imagem": imagem,
    "descricao": descricao,
    "contato": contato,
    "local": local,
    "horarioFun": horarioFun,
  };
}
