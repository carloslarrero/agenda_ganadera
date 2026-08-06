import 'package:agenda_ganadera/barril.dart';

class CategoriaMessage extends StatefulWidget {
  final Function(String nombre) onSave;

  const CategoriaMessage({
    super.key,
    required this.onSave,
  });

  @override
  State<CategoriaMessage> createState() => _CategoriaMessageState();
}

class _CategoriaMessageState extends State<CategoriaMessage> {
  final TextEditingController _nombreController = TextEditingController();

  void _guardar() {
    final String nombre = _nombreController.text.trim();

    if (nombre.isEmpty) {
      return;
    }

    widget.onSave(nombre);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _nombreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFFBFADA),
      title: const Text(
        'Nueva Categoría',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0XFF12372A),
          fontWeight: FontWeight.bold,
        ),
      ),
      content: TextField(
        controller: _nombreController,
        autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: const InputDecoration(
          labelText: 'Nombre de la categoría',
          hintText: 'Ej: Vacas, Toros o Terneros',
        ),
        onSubmitted: (_) {
          _guardar();
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancelar',
            style: TextStyle(
              color: Color(0XFF12372A),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: _guardar,
          child: const Text(
            'Guardar',
            style: TextStyle(
              color: Color(0XFF12372A),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
