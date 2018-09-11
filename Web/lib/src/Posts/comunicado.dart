import 'package:Web/src/Posts/post.dart';

class Comunicado extends Post {

  ///Construtor
  Comunicado(String key, String nome, String imagem, String descricao, String contato)
      : super(key, nome, imagem, descricao, contato);



  @override
  Map toMap() =>
      {
        "nome": nome,
        "imagem": imagem,
        "descricao": descricao,
        "contato": contato,
      };
}
