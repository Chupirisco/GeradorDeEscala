import 'package:flutter/material.dart';
import 'package:mobile/app/constants/datas.dart';
import 'package:table_calendar/table_calendar.dart';

class InserirDias extends StatefulWidget {
  const InserirDias({super.key});

  @override
  State<InserirDias> createState() => _InserirDiasState();
}

class _InserirDiasState extends State<InserirDias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecionar os dias do mês'),
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: Datas.primeiroDiaDoMes,
            lastDay: Datas.ultimoDiaDoMes,
            // locale: 'pt_BR',
          )
        ],
      ),
    );
  }
}
