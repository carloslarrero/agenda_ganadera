import 'package:agenda_ganadera/barril.dart';

class AlmacenMessage extends StatefulWidget {
  final Function(Map<String, dynamic>) onSave;

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

  DateTime _selectedDate = DateTime.now();
  DateTime _selectedExpirationDate = DateTime.now();

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

  Future<void> _selectExpirationDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedExpirationDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _selectedExpirationDate = picked;
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _cantidadController.dispose();
    _mmController.dispose();
    _kgController.dispose();
    super.dispose();
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
                  labelText: 'Cantidad',
                ),
              ),
            ],
            if (widget.mostrarMM) ...[
              const SizedBox(height: 15),
              TextField(
                controller: _mmController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Cantidad (ml)',
                ),
              ),
            ],
            if (widget.mostrarKG) ...[
              const SizedBox(height: 15),
              TextField(
                controller: _kgController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Cantidad (kg)',
                ),
              ),
            ],
            if (widget.fechaVencimiento) ...[
              const SizedBox(height: 20),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Vencimiento:',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _selectExpirationDate(context),
                    child: Text(
                      '${_selectedExpirationDate.day}/'
                      '${_selectedExpirationDate.month}/'
                      '${_selectedExpirationDate.year}',
                      style: const TextStyle(
                        color: Color(0XFF12372A),
                      ),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 20),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Fecha:',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text(
                    '${_selectedDate.day}/'
                    '${_selectedDate.month}/'
                    '${_selectedDate.year}',
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
          onPressed: () {
            Navigator.pop(context);
          },
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
            if (_titleController.text.trim().isEmpty) {
              return;
            }

            widget.onSave({
              'title': _titleController.text.trim(),
              'cantidad': _cantidadController.text.trim(),
              'ml': _mmController.text.trim(),
              'kg': _kgController.text.trim(),
              'date': _selectedDate,
              'expirationDate':
                  widget.fechaVencimiento ? _selectedExpirationDate : null,
            });

            Navigator.pop(context);
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
