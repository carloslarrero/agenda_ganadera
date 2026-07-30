import 'package:agenda_ganadera/barril.dart';

class AlmacenMessage extends StatefulWidget {
  final Function(String, DateTime) onSave;

  final String titulo;
  final String labelTitulo;
  final bool mostrarCantidad;
  final bool mostrarMM;
  final bool mostrarKG;
  final bool fechaVencimiento;

  const AlmacenMessage({
    super.key,
    required this.onSave,
    required this.titulo,
    required this.labelTitulo,
    this.mostrarCantidad = false,
    this.mostrarMM = false,
    this.mostrarKG = false,
    this.fechaVencimiento = false,
  });

  @override
  State<AlmacenMessage> createState() => _AlmacenMessageState();
}

class _AlmacenMessageState extends State<AlmacenMessage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _cantidadController = TextEditingController();
  final TextEditingController _mmController = TextEditingController();
  final TextEditingController _kgController = TextEditingController();
  final TextEditingController _vencimientoController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFFBFADA),
      title: Text(
        widget.titulo,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0XFF12372A),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: widget.labelTitulo,
              ),
            ),
            if (widget.mostrarCantidad) ...[
              const SizedBox(height: 15),
              TextField(
                controller: _cantidadController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Cantidad",
                ),
              ),
            ],
            if (widget.mostrarMM) ...[
              const SizedBox(height: 15),
              TextField(
                controller: _mmController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Cantidad (ml)",
                ),
              ),
            ],
            if (widget.mostrarKG) ...[
              const SizedBox(height: 15),
              TextField(
                controller: _kgController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Cantidad (kg)",
                ),
              ),
            ],
            if (widget.fechaVencimiento) ...[
              const SizedBox(height: 15),
              TextField(
                controller: _vencimientoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Fecha de Vencimiento",
                ),
              ),
            ],
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  'Fecha:',
                  style: TextStyle(fontSize: 18),
                ),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text(
                    '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                    style: const TextStyle(
                      color: Color(0XFF12372A),
                    ),
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
          child: const Text(
            'Cancelar',
            style: TextStyle(
              fontSize: 16,
              color: Color(0XFF12372A),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            if (_titleController.text.isNotEmpty) {
              widget.onSave(
                _titleController.text,
                _selectedDate,
              );

              Navigator.pop(context);
            }
          },
          child: const Text(
            'Guardar',
            style: TextStyle(
              fontSize: 16,
              color: Color(0XFF12372A),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
