import 'package:flutter/material.dart';

class Datas {
  static DateTime primeiroDiaDoMes =
      DateTime(DateTime.now().year, DateTime.now().month, 1);

  static DateTime ultimoDiaDoMes = DateTime(
      DateTime.now().month == 12
          ? DateTime.now().year + 1
          : DateTime.now().year,
      DateTime.now().month == 12 ? 2 : DateTime.now().month + 2,
      0);
}
