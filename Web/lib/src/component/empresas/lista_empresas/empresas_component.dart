import 'dart:html';
import 'package:Web/src/Posts/empresa.dart';
import 'package:Web/src/component/empresas/alterar_empresa_component/alterar_empresa_component.dart';
import 'package:angular/angular.dart';
import 'package:Web/src/Posts/post.dart';
import 'package:Web/src/services/FireBaseServices.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
    selector: 'empresas_list',
    styleUrls: const ['empresas_component.css'],
    templateUrl: 'empresas_component.html',
    directives: const [
      CORE_DIRECTIVES,
      formDirectives,
      MaterialButtonComponent,
      MaterialDialogComponent,
      ModalComponent,
      AlterarEmpresaComponent,
    ])
class empresasComponent implements OnInit {
  final FireBaseServices service;
  empresasComponent(this.service);

  List<Post> empresas = [];

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
    empresas = service.empresas;
  }

  removerEmpresa(Empresa empresa) {
    service.removeEmpresa(empresa.key);
  }


  uploadImage(e, Empresa empresa) async {
    fileDisabled = true;
    var file = (e.target as FileUploadInputElement).files[0];
    var image = await service.putImageEmpresas(file);

    empresa.imagem = image.toString();

    fileDisabled = false;
  }

  removeImage(Empresa empresa) {
    service.removeImage(empresa.imagem);

    empresa.imagem = null;
    fileDisabled = false;
  }
}
