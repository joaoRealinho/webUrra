import 'dart:html';
import 'package:Web/src/Posts/empresa.dart';
import 'package:Web/src/services/FireBaseServices.dart';
import 'package:angular/angular.dart';

import 'package:angular_components/laminate/components/modal/modal.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_dialog/material_dialog.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
    selector: 'nova_empresa_component',
    styleUrls: const ['nova_empresa_component.css'],
    templateUrl: 'nova_empresa_component.html',
    directives: const [
      CORE_DIRECTIVES,
      formDirectives,
      MaterialButtonComponent,
      MaterialDialogComponent,
      ModalComponent,
    ])
class novaEmpresaComponent {

  final FireBaseServices service;
  novaEmpresaComponent(this.service);

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

  Empresa empresa = new Empresa(null,null,null,null,null,null,null,null,);



  adicionarEmpresa(){
    service.addEmpresa(empresa.toMap());

    empresa = new Empresa(null,null,null,null,null,null,null,null,);
  }


  uploadImage(e) async {
    fileDisabled = true;
    var file = (e.target as FileUploadInputElement).files[0];
    var image = await service.putImageEmpresas(file);

    empresa.imagem = image.toString();

    fileDisabled = false;
  }


  removeImage() {
    service.removeImage(empresa.imagem);

    empresa.imagem = null;
    fileDisabled = false;
  }
}
