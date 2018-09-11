import 'package:angular/angular.dart';

import 'package:Web/app_component.dart';
import 'package:firebase/firebase.dart';

void main() {
  //Inicia a conecção ao Firebase
  initializeApp(
      apiKey: "AIzaSyAKq8Q9JZSvYRDu6p6yOysWEoEmXrB-CfI",
      authDomain: "urra-e2ced.firebaseapp.com",
      databaseURL: "https://urra-e2ced.firebaseio.com",
      projectId: "urra-e2ced",
      storageBucket: "urra-e2ced.appspot.com",
      messagingSenderId: "290975447138");

  bootstrap(AppComponent);
}
