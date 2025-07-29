import 'package:agenda_ganadera/barril.dart';

class AnimalesMessage extends StatelessWidget {
  final Function(String) onSave;
  final TextEditingController animalsType = TextEditingController();
  AnimalesMessage({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFFBFADA),
      title: const Text('Agregar Animal', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFF12372A)),),
      content: TextField(
         controller: animalsType,
              decoration: const InputDecoration(
                labelText: 'Tipo de Animal',
                hintText: 'Ej: Vacas',
              ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar', style: TextStyle(fontSize: 16, color: Color(0XFF12372A), fontWeight: FontWeight.bold),),
        ),
        TextButton(
          onPressed: () {
            if (animalsType.text.isNotEmpty) {
              onSave(animalsType.text,);
              Navigator.pop(context);
            }
          },
          child: const Text('Guardar', style: TextStyle(fontSize: 16, color: Color(0XFF12372A), fontWeight: FontWeight.bold),),
        ),
      ],
    );
  }
}