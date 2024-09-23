import 'package:flutter/material.dart';
import 'dart:io';
import 'package:excel/excel.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await gerarEscala(); // Chama a função de forma assíncrona
            },
            child: const Text('Clique aqui'),
          ),
        ),
      ),
    );
  }
}

Future<void> gerarEscala() async {
  var escala = Excel.createExcel();
  var planilha = escala['escala mês ${DateTime.now().year}'];

  // Inserir uma coluna e linha
  planilha.insertColumn(3);
  planilha.insertRow(2);

  // Escrever dados na célula
  planilha.cell(CellIndex.indexByString('A1')).value =
      TextCellValue('Nome'); // Cabeçalho

  // Caminho do arquivo
  var filePath = 'C:/Users/yurig/Documents/salvarEscala.xlsx';
  var file = File(filePath);

  // Criar o diretório se não existir
  await file.parent.create(recursive: true);

  // Salvar o arquivo
  var bytes = escala.save();
  await file.writeAsBytes(bytes!);
}
