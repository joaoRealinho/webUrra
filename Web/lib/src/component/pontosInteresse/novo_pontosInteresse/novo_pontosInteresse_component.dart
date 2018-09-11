import 'dart:html';
import 'package:Web/src/Posts/pontoInteresse.dart';
import 'package:Web/src/services/FireBaseServices.dart';
import 'package:angular/angular.dart';

import 'package:angular_components/laminate/components/modal/modal.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_dialog/material_dialog.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
    selector: 'novo_pontosInteresse_component',
    //styleUrls: const ['novo_pontosInteresse_component.css'],
    templateUrl: 'novo_pontosInteresse_component.html',
    directives: const [
      CORE_DIRECTIVES,
      formDirectives,
      MaterialButtonComponent,
      MaterialDialogComponent,
      ModalComponent,
    ])
class novoPontoInteresseComponent {

  final FireBaseServices service;
  novoPontoInteresseComponent(this.service);

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

  PontoInteresse pontoInter = new PontoInteresse(null,null,null,null,null,null,null,);



  adicionarPontoInteresse(){
    service.addPontosInteresse(pontoInter.toMap());

    pontoInter = new PontoInteresse(null,null,null,null,null,null,null,);
  }


  uploadImage(e) async {
    fileDisabled = true;
    var file = (e.target as FileUploadInputElement).files[0];
    var image = await service.putImagePontosInteresse(file);

    pontoInter.imagem = image.toString();

    fileDisabled = false;
  }


  removeImage() {
    service.removeImage(pontoInter.imagem);

    pontoInter.imagem = null;
    fileDisabled = false;
  }
}
