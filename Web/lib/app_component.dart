import 'package:Web/src/component/header/header_component.dart';
import 'package:Web/src/component/tab_component/tab_component.dart';
import 'package:Web/src/services/FireBaseServices.dart';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

//Decorator
@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [
    materialDirectives,
    headerComponent,
    tabComponent
  ],
  providers: const [materialProviders, FireBaseServices],
)
class AppComponent implements OnInit {
  ///Declara os serviços do Firebase e instacios
  //(DI, Dependice Injection)
  final FireBaseServices _fireBaseServices;
  AppComponent(this._fireBaseServices);

  @override
  ngOnInit() {
    _fireBaseServices.init();
  }
}