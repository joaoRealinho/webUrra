import 'dart:html';
import 'package:Web/src/Posts/evento.dart';
import 'package:Web/src/services/FireBaseServices.dart';
import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
    selector: 'alterar_evento_component',
    //styleUrls: const ['alterar_evento_component.css'],
    templateUrl: 'alterar_evento_component.html',
    directives: const [
      CORE_DIRECTIVES,
      formDirectives,
      MaterialButtonComponent,
      MaterialDialogComponent,
      ModalComponent,
    ])
class AlterarEventoComponent {

  final FireBaseServices service;
  AlterarEventoComponent(this.service);

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
  Evento alterarEvento;



  modificarEvento(){
    service.alterarEvento(alterarEvento);
  }

  uploadImage(e) async {
    fileDisabled = true;
    var file = (e.target as FileUploadInputElement).files[0];
    var image = await service.putImageEventos(file);

    alterarEvento.imagem = image.toString();

    fileDisabled = false;
  }


  removeImage() {
    service.removeImage(alterarEvento.imagem);

    alterarEvento.imagem = null;
    fileDisabled = false;
  }
}
