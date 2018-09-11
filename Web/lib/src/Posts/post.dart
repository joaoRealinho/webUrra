abstract class Post {
  String _key;
  String _nome;
  String _imagem;
  String _descricao;
  String _contato;
  //String _tag;

  Post(this._key, this._nome, this._imagem, this._descricao, [this._contato]);

  ///Gets para os atributos
  String get key => _key;
  String get nome => _nome;
  String get imagem => _imagem;
  String get descricao => _descricao;
  String get contato => _contato;



  ///Sets para os atributos
  set key(String key) => _key = key;
  set nome(String Nome) => _nome = Nome;
  set imagem(String imagem) => _imagem = imagem;
  set descricao(String descricao) => _descricao = descricao;
  set contato(String value) => _contato = value;


  Map toMap();
}
