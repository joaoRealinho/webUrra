import 'dart:html';
import 'package:Web/src/Posts/comunicado.dart';
import 'package:Web/src/component/comunicados/alterar_comunicado_component/alterar_comunicado_component.dart';
import 'package:Web/src/component/comunicados/novo_comunicado/novo_comunicado_component.dart';
import 'package:angular/angular.dart';
import 'package:Web/src/Posts/post.dart';
import 'package:Web/src/services/FireBaseServices.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
    selector: 'comunicados_list',
    styleUrls: const ['comunicados_component.css'],
    templateUrl: 'comunicados_component.html',
    directives: const [
      CORE_DIRECTIVES,
      formDirectives,
      MaterialButtonComponent,
      MaterialDialogComponent,
      ModalComponent,
      AlterarComunicadoComponent,
      novaComunicadoComponent,
    ])
class comunicadosComponent implements OnInit {
  final FireBaseServices service;
  comunicadosComponent(this.service);

  List<Post> comunicados = [];

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
    comunicados = service.comunicados;
  }

  removerComunicado(Comunicado comunicado) {
    service.removeComunicado(comunicado.key);
  }


  uploadImage(e, Comunicado comunicado) async {
    fileDisabled = true;
    var file = (e.target as FileUploadInputElement).files[0];
    var image = await service.putImageComunicados(file);

    comunicado.imagem = image.toString();

    fileDisabled = false;
  }

  removeImage(Comunicado comunicado) {
    service.removeImage(comunicado.imagem);

    comunicado.imagem = null;
    fileDisabled = false;
  }
}
