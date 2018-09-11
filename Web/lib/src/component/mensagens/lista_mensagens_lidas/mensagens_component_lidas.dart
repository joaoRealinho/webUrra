import 'dart:html';
import 'package:Web/src/Posts/mensagemJunta.dart';
import 'package:angular/angular.dart';
import 'package:Web/src/services/FireBaseServices.dart';

@Component(
    selector: 'mensagensLidas_list',
    templateUrl: 'mensagens_component_lidas.html',
    styleUrls: const ['mensagens_component_lidas.css'],
    directives: const [
      CORE_DIRECTIVES
    ])
class mensagensLidasComponent implements OnInit {
  final FireBaseServices service;
  mensagensLidasComponent(this.service);

  List<MensagemJunta> mensagensLidasJunta = [];

  MensagemJunta mensagemJunta = new MensagemJunta(null,null,null,null,null,);

  @override
  ngOnInit() {
    mensagensLidasJunta = service.mensagemJuntaLidas;
  }
}
