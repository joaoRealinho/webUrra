import 'dart:html';
import 'package:Web/src/Posts/empresa.dart';
import 'package:Web/src/services/FireBaseServices.dart';
import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
    selector: 'alterar_empresa_component',
    styleUrls: const ['alterar_empresa_component.css'],
    templateUrl: 'alterar_empresa_component.html',
    directives: const [
      CORE_DIRECTIVES,
      formDirectives,
      MaterialButtonComponent,
      MaterialDialogComponent,
      ModalComponent,
    ])
class AlterarEmpresaComponent {

  final FireBaseServices service;
  AlterarEmpresaComponent(this.service);

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


  /*Pass values into the directive*/
  @Input()
  Empresa alterarEmpresa;



  modificarEmpresa(){
    service.alterarEmpresa(alterarEmpresa);
  }

  uploadImage(e) async {
    fileDisabled = true;
    var file = (e.target as FileUploadInputElement).files[0];
    var image = await service.putImageEmpresas(file);

    alterarEmpresa.imagem = image.toString();

    fileDisabled = false;
  }


  removeImage() {
    service.removeImage(alterarEmpresa.imagem);

    alterarEmpresa.imagem = null;
    fileDisabled = false;
  }
}
