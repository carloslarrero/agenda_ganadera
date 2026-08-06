import 'package:agenda_ganadera/barril.dart';

// ignore: must_be_immutable
class ActivityMessage extends StatelessWidget {
  final Function(String, DateTime) onSave;
  final TextEditingController _titleController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  ActivityMessage({super.key, required this.onSave});

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFFBFADA),
      title: const Text('Nueva Actividad', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFF12372A)),),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Título',
                hintText: 'Ej: Vacunación',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Fecha:', style: TextStyle(fontSize: 18,),),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text(
                    '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                    style: const TextStyle(color: Color(0XFF12372A)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar', style: TextStyle(fontSize: 16, color: Color(0XFF12372A), fontWeight: FontWeight.bold),),
        ),
        TextButton(
          onPressed: () {
            if (_titleController.text.isNotEmpty) {
              onSave(_titleController.text, _selectedDate);
              Navigator.pop(context);
            }
          },
          child: const Text('Guardar', style: TextStyle(fontSize: 16, color: Color(0XFF12372A), fontWeight: FontWeight.bold),),
        ),
      ],
    );
  }
}