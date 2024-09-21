import 'package:flutter/material.dart';

import 'package:mobile/app/constants/routes.dart';
import 'package:mobile/app/constants/theme.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: tema(),
      routes: rotas(),
      initialRoute: '/paginaInicial',
    );
  }
}
