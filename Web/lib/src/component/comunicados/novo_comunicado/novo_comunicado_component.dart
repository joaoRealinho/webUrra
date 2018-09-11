import 'dart:html';
import 'package:Web/src/Posts/comunicado.dart';
import 'package:Web/src/services/FireBaseServices.dart';
import 'package:angular/angular.dart';

import 'package:angular_components/laminate/components/modal/modal.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_dialog/material_dialog.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
    selector: 'novo_comunicado_component',
    //styleUrls: const ['novo_comunicado_component.css'],
    templateUrl: 'novo_comunicado_component.html',
    directives: const [
      CORE_DIRECTIVES,
      formDirectives,
      MaterialButtonComponent,
      MaterialDialogComponent,
      ModalComponent,
    ])
class novaComunicadoComponent {

  final FireBaseServices service;
  novaComunicadoComponent(this.service);

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

  Comunicado comunicado = new Comunicado(null,null,null,null,null,);



  adicionarComunicado(){
    service.addComunicado(comunicado.toMap());

    comunicado = new Comunicado(null,null,null,null,null,);
  }


  uploadImage(e) async {
    fileDisabled = true;
    var file = (e.target as FileUploadInputElement).files[0];
    var image = await service.putImageComunicados(file);

    comunicado.imagem = image.toString();

    fileDisabled = false;
  }


  removeImage() {
    service.removeImage(comunicado.imagem);

    comunicado.imagem = null;
    fileDisabled = false;
  }
}
