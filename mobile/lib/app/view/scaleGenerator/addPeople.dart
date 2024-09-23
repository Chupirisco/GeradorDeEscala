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

  // Variável para armazenar a opção selecionada
  String? _selectedOption;

  // Mapa com as opções e valores associados
  final Map<String, String> _options = {
    'Normal': 'normal',
    'Missal': 'missal',
    'Cerimoniario': 'cerimoniario',
  };

  @override
  void dispose() {
    _nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adicionar Pessoas')),
      body: ListView(
        shrinkWrap: true,
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
                  DropdownButtonFormField<String>(
                    hint: const Text('Selecione uma opção'),
                    value: _selectedOption,
                    items: _options.keys.map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedOption = newValue;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Por favor, selecione uma opção';
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
                      const SizedBox(width: 10),
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
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: Pessoas.acolitos.length,
            itemBuilder: (context, index) {
              String nome = Pessoas.acolitos.keys.elementAt(index);
              String funcao = Pessoas.acolitos[nome] ?? 'Sem função';

              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.person),
                title: Text(nome),
                subtitle: Text(funcao),
                trailing: IconButton(
                  onPressed: () {
                    _removerNome(nome);
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _removerNome(String key) {
    setState(() {
      Pessoas.acolitos.remove(key);
    });
  }

  void _adicionarNome() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        // Obtém a função correspondente à opção selecionada
        String funcaoSelecionada = _selectedOption ?? 'Sem função';

        // Adiciona a pessoa e a função diretamente
        Pessoas.adicionarPessoa(_nomeController.text, funcaoSelecionada);

        _nomeController.clear();
        _selectedOption = null; // Limpar a seleção após adicionar
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
