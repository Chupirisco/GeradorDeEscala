import 'package:flutter/material.dart';
import 'package:mobile/app/constants/estilos.dart';
import 'package:mobile/app/logica/classes.dart';

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
      body: ListView(
        shrinkWrap: true,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/adicionarPessoas', (route) => false);
            },
            child: const Text('Inserir Pessoas'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/inserirDias');
            },
            child: const Text('Proxima Etapa'),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Lista de pessoas inseridas: ',
              style: estiloTexto(tamanho: 20, peso: FontWeight.bold),
            ),
          ),
          Pessoas.nomes.isEmpty
              ? Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Nenhuma pessoa inserida ',
                    style: estiloTexto(tamanho: 15, peso: FontWeight.bold),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: Pessoas.nomes.length,
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.person),
                    title: Text(Pessoas.nomes[index]),
                    trailing: Text('${++index}'),
                  ),
                ),
        ],
      ),
    );
  }
}
