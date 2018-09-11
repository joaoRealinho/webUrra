import 'package:angular/angular.dart';
import 'package:angular_components/annotations/rtl_annotation.dart';
import 'package:angular_components/material_tab/fixed_material_tab_strip.dart';
import 'package:angular_components/material_tab/tab_change_event.dart';
import 'package:angular_components/material_toggle/material_toggle.dart';
import 'package:angular_components/utils/browser/dom_service/angular_2.dart';
import 'package:angular_components/utils/browser/window/module.dart';

import 'package:Web/src/component/empresas/nova_empresa/nova_empresa_component.dart';
import 'package:Web/src/component/empresas/lista_empresas/empresas_component.dart';

import 'package:Web/src/component/eventos/lista_eventos/eventos_component.dart';
import 'package:Web/src/component/eventos/novo_evento/novo_evento_component.dart';

import 'package:Web/src/component/comunicados/novo_comunicado/novo_comunicado_component.dart';
import 'package:Web/src/component/comunicados/lista_comunicados/comunicados_component.dart';

import 'package:Web/src/component/pontosInteresse/novo_pontosInteresse/novo_pontosInteresse_component.dart';
import 'package:Web/src/component/pontosInteresse/lista_pontosInteresse/pontosInteresse_component.dart';

import 'package:Web/src/component/mensagens/lista_mensagens/mensagens_component.dart';
import 'package:Web/src/component/mensagens/lista_mensagens_lidas/mensagens_component_lidas.dart';

@Component(
  selector: 'tab_component',
  templateUrl: 'tab_component.html',
  directives: const [
    MaterialToggleComponent,
    FixedMaterialTabStripComponent,
    CORE_DIRECTIVES,
    novaEmpresaComponent,
    empresasComponent,
    novaEventoComponent,
    eventosComponent,
    novaComunicadoComponent,
    comunicadosComponent,
    novoPontoInteresseComponent,
    pontosInteresseComponent,
    mensagensComponent,
    mensagensLidasComponent,
  ],
  providers: const [domServiceBinding, rtlProvider, windowBindings],
)
class tabComponent {

  int tabIndex = 0;

  void onTabChange(TabChangeEvent event) {
    tabIndex = event.newIndex;
  }

  void onBeforeTabChange(TabChangeEvent event) {}


  final tabLabels = const <String>[
    'Eventos',
    'Comunicados',
    'Pontos de Interesse',
    'Empresas',
    'Mensagens'
  ];
}
