import 'package:flutter/material.dart';

class PageInicial extends StatelessWidget {
  const PageInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerador de Escalas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/paginaPrincipalDoGerador');
              },
              child: const Text('Gerar escala'),
            ),
          ],
        ),
      ),
    );
  }
}
