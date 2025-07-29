import 'package:agenda_ganadera/barril.dart';

class EditMessage extends StatefulWidget {
  final String currentName;
  final int currentCount;
  final Function(String, int) onSave;
  final Function() onDelete;

  const EditMessage({
    super.key,
    required this.currentName,
    required this.currentCount,
    required this.onSave,
    required this.onDelete,
  });

  @override
  State<EditMessage> createState() => _EditMessageState();
}

class _EditMessageState extends State<EditMessage> {
  late TextEditingController _nameController;
  late TextEditingController _countController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
    _countController =
        TextEditingController(text: widget.currentCount.toString());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _countController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFFBFADA),
      title: const Text(
        'Editar Animal',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Color(0XFF12372A),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 5),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Nombre del animal',
              labelStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: _countController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Cantidad',
              labelStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onChanged: (value) { // hace que no se puedan agregar numeros negativos al editar    
              if (value.startsWith('-')) {
                _countController.text = value.replaceAll('-', '');
                _countController.selection = TextSelection.fromPosition(
                    TextPosition(offset: _countController.text.length));
              }
            },
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            IconButton(
              iconSize: 30,
              icon: Icon(Icons.delete_rounded, color: Colors.red[900]),
              onPressed: () {
                Navigator.pop(context); // Cierra este diálogo
                showDialog(
                  context: context,
                  builder: (context) => DeleteMessage(
                    onConfirm: widget.onDelete,
                  ),
                );
              },
            ),
            TextButton(
              onPressed: () {
                final newName = _nameController.text;
                final newCount =
                    int.tryParse(_countController.text) ?? widget.currentCount;
                widget.onSave(newName, newCount);
                Navigator.pop(context);
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
        ),
      ],
    );
  }
}
