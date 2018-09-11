import 'dart:html';
import 'package:Web/src/Posts/pontoInteresse.dart';
import 'package:Web/src/component/pontosInteresse/altera_pontosInteresse_component/alterar_pontoInteresse_component.dart';
import 'package:angular/angular.dart';
import 'package:Web/src/Posts/post.dart';
import 'package:Web/src/services/FireBaseServices.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
    selector: 'pontosInteresse_list',
    //styleUrls: const ['pontosInteresse_component.css'],
    templateUrl: 'pontosInteresse_component.html',
    directives: const [
      CORE_DIRECTIVES,
      formDirectives,
      MaterialButtonComponent,
      MaterialDialogComponent,
      ModalComponent,
      AlterarPontoInteresseComponent,
    ])
class pontosInteresseComponent implements OnInit {
  final FireBaseServices service;
  pontosInteresseComponent(this.service);

  List<Post> pontosInteresse = [];

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
    pontosInteresse = service.pontosInteresse;
  }

  removerPontoInter(PontoInteresse pontoInter) {
    service.removePontosInteresse(pontoInter.key);
  }


  uploadImage(e, PontoInteresse pontoInter) async {
    fileDisabled = true;
    var file = (e.target as FileUploadInputElement).files[0];
    var image = await service.putImagePontosInteresse(file);

    pontoInter.imagem = image.toString();

    fileDisabled = false;
  }

  removeImage(PontoInteresse pontoInter) {
    service.removeImage(pontoInter.imagem);

    pontoInter.imagem = null;
    fileDisabled = false;
  }
}
