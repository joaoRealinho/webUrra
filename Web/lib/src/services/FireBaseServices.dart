import 'dart:html';
import 'package:Web/src/Posts/mensagemJunta.dart';
import 'package:Web/src/Posts/comunicado.dart';
import 'package:Web/src/Posts/empresa.dart';
import 'package:Web/src/Posts/evento.dart';
import 'package:Web/src/Posts/pontoInteresse.dart';
import 'package:Web/src/Posts/post.dart';
import 'package:angular/angular.dart';
import 'package:firebase/firebase.dart';

@Injectable()
class FireBaseServices {
  final Auth _auth = auth();
  User user;

  final DatabaseReference _refEmpresas = database().ref('empresas');
  final DatabaseReference _refEventos = database().ref('eventos');
  final DatabaseReference _refComunicados = database().ref('comunicados');
  final DatabaseReference _refPontosInter = database().ref('pontosInteresse');
  final DatabaseReference _refMensagemJunta = database().ref('mensagemJunta');
  final DatabaseReference _refMensagemJuntaLidas = database().ref('mensagemJuntaLidas');

  final StorageReference _storageRefEmpresas = storage().ref('empresas');
  final StorageReference _storageRefEventos = storage().ref('eventos');
  final StorageReference _storageRefComunicados = storage().ref('comunicados');
  final StorageReference _storageRefPontosInteresse = storage().ref('pontosInteresse');


  final List<Post> empresas = [];
  final List<Post> eventos = [];
  final List<Post> comunicados = [];
  final List<Post> pontosInteresse = [];
  final List<MensagemJunta> mensagemJunta = [];
  final List<MensagemJunta> mensagemJuntaLidas = [];

  bool loading = true;

  String imageUrl = "https://firebasestorage.googleapis.com/v0/b/urra-e2ced.appspot.com/o/favicon.png?alt=media&token=fb9e7070-0cd5-440c-bfa0-a09ddb068363";
  String plusUrl = "https://firebasestorage.googleapis.com/v0/b/urra-e2ced.appspot.com/o/plus.png?alt=media&token=ff89b37f-8e76-4677-9c33-dde1b87181fb";



  init() {
    _refMensagemJunta.onChildAdded.listen((e) {
      DataSnapshot data = e.snapshot;

      var val = data.val();

      var item = new MensagemJunta(
          data.key,
          val["user"],
          val["assunto"],
          val["texto"],
      val["imagem"]);

      mensagemJunta.insert(0, item);
    });


    _refMensagemJunta.onChildRemoved.listen((e) {
      DataSnapshot data = e.snapshot;

      mensagemJunta.removeWhere((n) => data.key == n.key);
    });


    _refMensagemJuntaLidas.onChildAdded.listen((e) {
      DataSnapshot data = e.snapshot;

      var val = data.val();

      var item = new MensagemJunta(
          data.key,
          val["user"],
          val["assunto"],
          val["texto"],
          val["imagem"]);

      mensagemJuntaLidas.insert(0, item);
    });





    //retorn o evento que e adicionado
    _refEventos.onChildAdded.listen((e) {
      DataSnapshot data = e.snapshot;

      var val = data.val();

      var item = new Evento(
          data.key,
          val["nome"],
          val["imagem"],
          val["descricao"],
          val["contato"],
          val["local"],
          val["organizadores"]);

      eventos.insert(0, item);
    });

    //retorna o evento que e apagada
    _refEventos.onChildRemoved.listen((e) {
      DataSnapshot data = e.snapshot;

      //Remove imagem da Storage
      var val = data.val();
      var imageUrl = val["imagem"];
      if (imageUrl != null) {
        removeImage(imageUrl);
      }

      eventos.removeWhere((n) => data.key == n.key);
    });






    //retorn o comunicado que e adicionado
    _refComunicados.onChildAdded.listen((e) {
      DataSnapshot data = e.snapshot;

      var val = data.val();

      var item = new Comunicado(
          data.key,
          val["nome"],
          val["imagem"],
          val["descricao"],
          val["contato"],
      );

      comunicados.insert(0, item);
    });

    //retorna o comunicado que e apagada
    _refComunicados.onChildRemoved.listen((e) {
      DataSnapshot data = e.snapshot;

      //Remove imagem da Storage
      var val = data.val();
      var imageUrl = val["imagem"];
      if (imageUrl != null) {
        removeImage(imageUrl);
      }

      comunicados.removeWhere((n) => data.key == n.key);
    });






    //retorna o Ponto de Interesse que e adicionado
    _refPontosInter.onChildAdded.listen((e) {
      DataSnapshot data = e.snapshot;

      var val = data.val();

      var item = new PontoInteresse(
          data.key,
          val["nome"],
          val["imagem"],
          val["descricao"],
          val["contato"],
          val["local"],
          val["horarioFun"]);

      pontosInteresse.insert(0, item);
    });

    //retorna o Ponto de Interesse que e apagada
    _refPontosInter.onChildRemoved.listen((e) {
      DataSnapshot data = e.snapshot;

      //Remove imagem da Storage
      var val = data.val();
      var imageUrl = val["imagem"];
      if (imageUrl != null) {
        removeImage(imageUrl);
      }

      pontosInteresse.removeWhere((n) => data.key == n.key);
    });







    _refEmpresas.onChildAdded.listen((e) {
      DataSnapshot data = e.snapshot;

      var val = data.val();

      var item = new Empresa(
          data.key,
          val["nome"],
          val["imagem"],
          val["descricao"],
          val["contato"],
          val["tipoEmpresa"],
          val["local"],
          val["horarioFun"]);

      empresas.insert(0, item);
    });

    //retorna a empresa que e apagada
    _refEmpresas.onChildRemoved.listen((e) {
      DataSnapshot data = e.snapshot;

      //Remove imagem da Storage
      var val = data.val();
      var imageUrl = val["imagem"];
      if (imageUrl != null) {
        removeImage(imageUrl);
      }

      empresas.removeWhere((n) => data.key == n.key);
    });







    //Retorna o Utilizador que acabou de fazer login e Retorna null quando faz logout
    auth().onIdTokenChanged.listen((e){
      user = e;
    });

  }





  //Adiciona Evento a Database
  addEvento(Map map) async {
    await _refEventos.push(map);
  }
  //Remove Evento da Database
  removeEvento(String key) async {
    await _refEventos.child(key).remove();
  }
  //Altera Evento da Database
  alterarEvento(Evento evento) async {
    _refEventos.child(evento.key).update(evento.toMap());
  }




  //Adiciona comunicado a Database
  addComunicado(Map map) async {
    await _refComunicados.push(map);
  }
  //Remove comunicado da Database
  removeComunicado(String key) async {
    await _refComunicados.child(key).remove();
  }
  //Altera comunicado da Database
  alterarComunicado(Comunicado comunicado) async {
    _refComunicados.child(comunicado.key).update(comunicado.toMap());
  }




  //Adiciona pontosInteresse a Database
  addPontosInteresse(Map map) async {
    await _refPontosInter.push(map);
  }
  //Remove pontosInteresse da Database
  removePontosInteresse(String key) async {
    await _refPontosInter.child(key).remove();
  }
  //Altera pontosInteresse da Database
  alterarPontosInteresse(PontoInteresse pontoInter) async {
    _refPontosInter.child(pontoInter.key).update(pontoInter.toMap());
  }




  //Adiciona Empresa a Database
  addEmpresa(Map map) async {
    await _refEmpresas.push(map);
  }
  //Remove Empresa da Database
  removeEmpresa(String key) async {
    await _refEmpresas.child(key).remove();
  }
  //Altera Empresa da Database
  alterarEmpresa(Empresa empresa) async {
    _refEmpresas.child(empresa.key).update(empresa.toMap());
  }



  //Adiciona Mensagem Lida a Database
  addMensagemLida(Map map) async {
    await _refMensagemJuntaLidas.push(map);
  }
  //Remove Mensagem por Ler da Database
  removeMensagem(String key) async {
    await _refMensagemJunta.child(key).remove();
  }





  // Puts image into a storage.
  putImageEventos(File file) async {
    try {
      var task = _storageRefEventos.child(file.name).put(file);
      task.onStateChanged
          .listen((_) => loading = true, onDone: () => loading = false);

      var snapshot = await task.future;

      return snapshot.ref.getDownloadURL();
    } catch (e) {
      print("Error in uploading to storage: $e");
    }
  }


  // Puts image into a storage.
  putImageComunicados(File file) async {
    try {
      var task = _storageRefComunicados.child(file.name).put(file);
      task.onStateChanged
          .listen((_) => loading = true, onDone: () => loading = false);

      var snapshot = await task.future;

      return snapshot.ref.getDownloadURL();
    } catch (e) {
      print("Error in uploading to storage: $e");
    }
  }


  // Puts image into a storage.
  putImagePontosInteresse(File file) async {
    try {
      var task = _storageRefPontosInteresse.child(file.name).put(file);
      task.onStateChanged
          .listen((_) => loading = true, onDone: () => loading = false);

      var snapshot = await task.future;

      return snapshot.ref.getDownloadURL();
    } catch (e) {
      print("Error in uploading to storage: $e");
    }
  }



  // Puts image into a storage.
  putImageEmpresas(File file) async {
    try {
      var task = _storageRefEmpresas.child(file.name).put(file);
      task.onStateChanged
          .listen((_) => loading = true, onDone: () => loading = false);

      var snapshot = await task.future;

      return snapshot.ref.getDownloadURL();
    } catch (e) {
      print("Error in uploading to storage: $e");
    }
  }






  // Removes image from storage
  removeImage(String imageUrl) async {
    try {
      var imageRef = storage().refFromURL(imageUrl);
      await imageRef.delete();
    } catch (e) {
      print("Error in deleting $imageUrl: $e");
    }
  }


  signInEmail(String email, String password) async {

    try{
      await _auth.signInWithEmailAndPassword(email, password);
    }
    catch (e) {
      //todo usar o codigo para saber o que deu de errado
      //print(e.code);
      //print(e.message);
    }
  }



  signOut() async {
    await _auth.signOut();
    user = null;
  }
}
