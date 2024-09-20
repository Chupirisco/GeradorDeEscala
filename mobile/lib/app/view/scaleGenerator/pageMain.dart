import 'package:flutter/material.dart';
import 'package:mobile/app/constants/estilos.dart';
import 'package:mobile/app/logica/pessoas.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerar Escala'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/adicionarPessoas', (route) => false);
              },
              child: const Text('Inserir Pessoas'),
            ),
            Text('Lista de pessoas inseridas: ',
                style: estiloTexto(tamanho: 20, peso: FontWeight.bold)),
            Text(
              Pessoas.nomesEmSequencia() == ''
                  ? 'Nenhuma pessoa inserida'
                  : Pessoas.nomesEmSequencia(),
              style: estiloTexto(tamanho: 15, peso: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
