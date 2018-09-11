import 'dart:html';
import 'package:Web/src/Posts/mensagemJunta.dart';
import 'package:angular/angular.dart';
import 'package:Web/src/services/FireBaseServices.dart';

@Component(
    selector: 'mensagens_list',
    templateUrl: 'mensagens_component.html',
    styleUrls: const ['mensagens_component.css'],
    directives: const [
      CORE_DIRECTIVES
    ])

class mensagensComponent implements OnInit {
  final FireBaseServices service;
  mensagensComponent(this.service);

  List<MensagemJunta> mensagensJunta = [];

  bool fileDisabled;

  MensagemJunta mensagemJunta = new MensagemJunta(null,null,null,null,null,);

  @override
  ngOnInit() {
    mensagensJunta = service.mensagemJunta;
  }

  removerMensagem(MensagemJunta mensagem) {
    service.removeMensagem(mensagem.key);
  }

  adicionarMensagemLida(MensagemJunta mensagem){
    service.addMensagemLida(mensagem.toMap());
  }

  mudarMensagemParaLida(mensagem){
    adicionarMensagemLida(mensagem);
    removerMensagem(mensagem);
  }
}
