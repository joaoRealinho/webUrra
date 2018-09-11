import 'dart:html';
import 'package:Web/src/Posts/evento.dart';

import 'package:Web/src/component/eventos/alterar_evento_component/alterar_evento_component.dart';
import 'package:angular/angular.dart';
import 'package:Web/src/Posts/post.dart';
import 'package:Web/src/services/FireBaseServices.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:Web/src/component/eventos/novo_evento/novo_evento_component.dart';

@Component(
    selector: 'eventos_list',
    styleUrls: const ['eventos_component.css'],
    templateUrl: 'eventos_component.html',
    directives: const [
      CORE_DIRECTIVES,
      formDirectives,
      MaterialButtonComponent,
      MaterialDialogComponent,
      ModalComponent,
      AlterarEventoComponent,
      novaEventoComponent,
    ])
class eventosComponent implements OnInit {
  final FireBaseServices service;
  eventosComponent(this.service);

  List<Post> eventos = [];

  bool showBasicDialog = false;
  bool showBasicScrollingDialog = false;
  bool showMaxHeightDialog = false;
  bool showHeaderedDialog = false;
  bool showInfoDialog = false;
  bool showDialogWithError = false;
  bool showDialogWithTooltip = false;
  bool showCustomColorsDialog = false;
  bool showAutoDismissDialog = false;
  bool showNoHeaderFooterDialog = false;
  bool showFullscreenDialog = false;

  bool isInFullscreenMode = false;

  bool fileDisabled = false;

  @override
  ngOnInit() {
    eventos = service.eventos;
  }

  removerEvento(Evento evento) {
    service.removeEvento(evento.key);
  }


  uploadImage(e, Evento evento) async {
    fileDisabled = true;
    var file = (e.target as FileUploadInputElement).files[0];
    var image = await service.putImageEventos(file);

    evento.imagem = image.toString();

    fileDisabled = false;
  }

  removeImage(Evento evento) {
    service.removeImage(evento.imagem);

    evento.imagem = null;
    fileDisabled = false;
  }
}
