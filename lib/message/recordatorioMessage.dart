import 'package:flutter/material.dart';
import 'package:agenda_ganadera/barril.dart';
import 'package:intl/intl.dart';

class RecordatorioMessage extends StatefulWidget {
  final Function(String, DateTime) onSave;

  const RecordatorioMessage({super.key, required this.onSave});

  @override
  State<RecordatorioMessage> createState() => _RecordatorioMessageState();
}

class _RecordatorioMessageState extends State<RecordatorioMessage> {
  final TextEditingController _nombreController = TextEditingController();
  DateTime _fechaSeleccionada = DateTime.now();
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _fechaSeleccionada,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0XFF12372A), // Color del header
            ),
            dialogBackgroundColor:
                const Color(0xFFFBFADA), // Fondo del datepicker
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _fechaSeleccionada) {
      setState(() {
        _fechaSeleccionada = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFFBFADA),
      title: const Text(
        'Nuevo Recordatorio',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0XFF12372A),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nombreController,
            decoration: const InputDecoration(
              labelText: 'Nombre del recordatorio',
              labelStyle: TextStyle(color: Color(0XFF12372A)),
              hintText: 'Ej: Vacunación aftosa',
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color(0XFF12372A)), 
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color(0XFF12372A),
                    width: 2), 
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text('Fecha: ', style: TextStyle(fontSize: 16)),
              TextButton(
                onPressed: () => _selectDate(context),
                child: Text(
                  _dateFormat.format(_fechaSeleccionada),
                  style: const TextStyle(
                      fontSize: 16,
                      color: Color(0XFF12372A),
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Icon(Icons.calendar_today, color: Color(0XFF12372A)),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancelar',
            style: TextStyle(
                fontSize: 16,
                color: Color(0XFF12372A),
                fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: () {
            if (_nombreController.text.isNotEmpty) {
              widget.onSave(_nombreController.text, _fechaSeleccionada);
              Navigator.pop(context);
            }
          },
          child: const Text(
            'Guardar',
            style: TextStyle(
                fontSize: 16,
                color: Color(0XFF12372A),
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
