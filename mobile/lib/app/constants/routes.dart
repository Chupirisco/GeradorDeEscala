import 'package:flutter/material.dart';
import 'package:mobile/app/view/pageInitial.dart';
import 'package:mobile/app/view/scaleGenerator/addPeople.dart';
import 'package:mobile/app/view/scaleGenerator/insertDays.dart';
import 'package:mobile/app/view/scaleGenerator/pageMain.dart';

Map<String, WidgetBuilder> rotas() {
  return {
    '/paginaInicial': (context) => const PageInicial(),
    '/paginaPrincipalDoGerador': (context) => const PaginaPrincipal(),
    '/adicionarPessoas': (context) => const AdicionarPessoas(),
    '/inserirDias': (context) => const InserirDias(),
  };
}
