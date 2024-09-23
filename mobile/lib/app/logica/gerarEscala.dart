import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';

void gararEscala() {
  var escala = Excel.createExcel();

  var planilha = escala['escala mês ${DateTime.now().year}'];

  planilha.insertColumn(3);
  planilha.insertRow(2);

  planilha.cell(CellIndex.indexByString('A1')).value = 'Nome' as CellValue?;
  var file = 'C:/Users/yurig/repositorios/GeradorDeEscala/salvarEscala.xlsx';
  var bytes = escala.save();
  File(file).writeAsBytesSync(bytes!);
}
