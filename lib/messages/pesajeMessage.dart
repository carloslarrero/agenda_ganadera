import 'package:agenda_ganadera/barril.dart';

class PesajeMessage extends StatefulWidget {
  final String categoria;

  final Function(
    String identificativo,
    double peso,
  ) onSave;

  const PesajeMessage({
    super.key,
    required this.categoria,
    required this.onSave,
  });

  @override
  State<PesajeMessage> createState() => _PesajeAnimalMessageState();
}

class _PesajeAnimalMessageState extends State<PesajeMessage> {
  final TextEditingController _identificativoController =
      TextEditingController();

  final TextEditingController _pesoController = TextEditingController();

  void _guardar() {
    final String identificativo = _identificativoController.text.trim();

    final String pesoTexto = _pesoController.text.trim().replaceAll(',', '.');

    final double? peso = double.tryParse(pesoTexto);

    if (identificativo.isEmpty || peso == null || peso <= 0) {
      return;
    }

    widget.onSave(
      identificativo,
      peso,
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _identificativoController.dispose();
    _pesoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFFBFADA),
      title: Text(
        'Nuevo registro: ${widget.categoria}',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0XFF12372A),
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _identificativoController,
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Identificativo',
                hintText: 'Ej: Caravana 125 o pelaje colorado',
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _pesoController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Peso',
                suffixText: 'kg',
              ),
            ),
          ],
        ),
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
