import 'package:firebase/firebase.dart';

class MensagemJunta {
  String _key;
  String _user;
  String _assunto;
  String _texto;
  String _imagem;


  MensagemJunta(this._key,this._user, this._assunto, this._texto, this._imagem);

  String get key => _key;
  String get user => _user;
  String get assunto => _assunto;
  String get texto => _texto;
  String get imagem => _imagem;


  set user(String value) => _user = value;
  set assunto(String value) => _assunto = value;
  set texto(String value) => _texto = value;
  set key(String value) => _key = value;
  set imagem(String value) => _imagem = value;


  @override
  Map toMap()  => {
    "user": user,
    "assunto": assunto,
    "texto": texto,
    "imagem": imagem,
  };
}