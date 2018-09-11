import 'package:Web/src/Posts/post.dart';

class Empresa extends Post {
  String _tipoEmpresa;
  String _local;
  String _horarioFun;

  Empresa(String key, String nome, String imagem, String descricao, String contato,
      this._tipoEmpresa, this._local, this._horarioFun)
      : super(key, nome, imagem, descricao, contato);

  ///Gets
  String get horarioFun => _horarioFun;
  String get local => _local;
  String get tipoEmpresa => _tipoEmpresa;

  ///Sets
  set horarioFun(String value) => _horarioFun = value;
  set local(String value) => _local = value;
  set tipoEmpresa(String value) => _tipoEmpresa = value;

  @override
  Map toMap() =>
    {
      "nome": nome,
      "imagem": imagem,
      "descricao": descricao,
      "contato": contato,
      "tipoEmpresa": tipoEmpresa,
      "local": local,
      "horarioFun": horarioFun
    };

}
