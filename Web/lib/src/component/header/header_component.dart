import 'package:Web/src/services/FireBaseServices.dart';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
    selector: 'header_Component',
    styleUrls: const ['header_component.css'],
    templateUrl: 'header_component.html',
    directives: const [CORE_DIRECTIVES, formDirectives])
class headerComponent{

  final FireBaseServices service;
  headerComponent(this.service);

  String email;
  String pass;


  submitlogin() {
    service.signInEmail(email, pass);

    email = '';
    pass = '';
  }

}