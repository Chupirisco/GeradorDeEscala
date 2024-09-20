import 'package:flutter/material.dart';
import 'package:mobile/app/constants/estilos.dart';
import 'package:mobile/app/logica/pessoas.dart';

class AdicionarPessoas extends StatefulWidget {
  const AdicionarPessoas({super.key});

  @override
  State<AdicionarPessoas> createState() => _AdicionarPessoasState();
}

class _AdicionarPessoasState extends State<AdicionarPessoas> {
  final TextEditingController _nomeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adicionar Pessoas')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nomeController,
                    autocorrect: true,
                    autofocus: false,
                    decoration: inputDecoration(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um nome';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _adicionarNome,
                        child: const Text('Adicionar'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              '/paginaPrincipalDoGerador', (route) => false);
                        },
                        child: const Text('Finalizar'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
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

  void _adicionarNome() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        Pessoas.adicionarPessoasaLista(_nomeController.text);
        _nomeController.clear();
      });
    }
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      prefixIcon: const Icon(Icons.person),
      labelText: 'Nome',
      labelStyle: estiloTexto(cor: Colors.black),
    );
  }
}
