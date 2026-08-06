import 'package:agenda_ganadera/barril.dart';

class StockMessage extends StatelessWidget {
  final Function(String, String) onSave;
  final TextEditingController animalsType = TextEditingController();
  final TextEditingController animalsCount = TextEditingController();
  StockMessage({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFFBFADA),
      title: const Text(
        'Agregar Animal',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFF12372A)),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: animalsType,
            decoration: const InputDecoration(
              labelText: 'Tipo de Animal',
              hintText: 'Ej: Vacas',
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: animalsCount,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Cantidad',
            ),
             onChanged: (value) {
              // validación para evitar numeros negativos
              if (value.startsWith('-')) {
                animalsCount.text = value.replaceAll('-', '');
                animalsCount.selection = TextSelection.fromPosition(
                  TextPosition(offset: animalsCount.text.length));
              }
            },
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
            if (animalsType.text.isNotEmpty && animalsCount.text.isNotEmpty) {
              onSave(animalsType.text, animalsCount.text);
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