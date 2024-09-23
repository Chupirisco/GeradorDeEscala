import 'package:flutter/material.dart';
import 'package:mobile/app/constants/datas.dart';
import 'package:mobile/app/logica/eventos.dart';
import 'package:table_calendar/table_calendar.dart';

class InserirDias extends StatefulWidget {
  const InserirDias({super.key});

  @override
  State<InserirDias> createState() => _InserirDiasState();
}

class _InserirDiasState extends State<InserirDias> {
  DateTime _selectedDay = DateTime.now();
  final dynamic _events = Eventos.eventos;

  // Controlador para o campo de texto
  final TextEditingController _eventController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecionar os dias do mês'),
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _selectedDay,
            firstDay: Datas.primeiroDiaDoMes,
            lastDay: Datas.ultimoDiaDoMes,
            calendarFormat: CalendarFormat.month,
            headerStyle: _estiloCabecario(),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = DateTime(
                  selectedDay.year,
                  selectedDay.month,
                  selectedDay.day,
                );
              });
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
          ),
          const SizedBox(height: 8.0),

          // Campo para inserir o nome do evento
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _eventController,
              decoration: const InputDecoration(
                labelText: 'Adicionar evento',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          // Botão para adicionar o evento
          ElevatedButton(
            onPressed: _addEvent,
            child: const Text('Adicionar Evento'),
          ),

          const SizedBox(height: 8.0),

          Expanded(
            child: _buildEventList(_events, _selectedDay),
          ),
        ],
      ),
    );
  }

  void _addEvent() {
    if (_eventController.text.isEmpty) {
      return;
    }

    setState(() {
      if (_events[_selectedDay] != null) {
        _events[_selectedDay]!.add(_eventController.text);
      } else {
        _events[_selectedDay] = [_eventController.text];
      }
    });
    _eventController.clear();
  }
}

HeaderStyle _estiloCabecario() {
  return const HeaderStyle(
    formatButtonVisible: false,
    titleCentered: true,
  );
}

Widget _buildEventList(
    Map<DateTime, List<String>> events, DateTime selectedDay) {
  final eventsForDay = events[selectedDay] ?? [];

  if (eventsForDay.isEmpty) {
    return const Center(
      child: Text('Nenhum evento para este dia.'),
    );
  }

  return ListView.builder(
    itemCount: eventsForDay.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(eventsForDay[index]),
      );
    },
  );
}
