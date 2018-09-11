import 'dart:html';
import 'package:Web/src/Posts/evento.dart';
import 'package:Web/src/services/FireBaseServices.dart';
import 'package:angular/angular.dart';

import 'package:angular_components/laminate/components/modal/modal.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_dialog/material_dialog.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:bootstrap/bootstrap.dart';


@Component(
    selector: 'novo_evento_component',
    //styleUrls: const ['nova_empresa_component.css'],
    templateUrl: 'novo_evento_component.html',
    directives: const [
      CORE_DIRECTIVES,
      formDirectives,
      MaterialButtonComponent,
      MaterialDialogComponent,
      ModalComponent,
    ])
class novaEventoComponent {

  final FireBaseServices service;
  novaEventoComponent(this.service);

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

  Evento evento = new Evento(null,null,null,null,null,null,null,);



  adicionarEvento(){
    service.addEvento(evento.toMap());

    evento = new Evento(null,null,null,null,null,null,null,);
  }


  uploadImage(e) async {
    fileDisabled = true;
    var file = (e.target as FileUploadInputElement).files[0];
    var image = await service.putImageEventos(file);

    evento.imagem = image.toString();

    fileDisabled = false;
  }


  removeImage() {
    service.removeImage(evento.imagem);

    evento.imagem = null;
    fileDisabled = false;
  }
}
