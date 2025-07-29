import 'package:agenda_ganadera/barril.dart';

class DeleteMessage extends StatelessWidget {
  final Function() onConfirm;
  
  const DeleteMessage({
    super.key,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFFBFADA),
      title: const Text(
        'Eliminar',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0XFF12372A),
        ),
      ),
      content: const Text(
        '¿Estás seguro de que quieres eliminar?',
        style: TextStyle(color: Color(0XFF12372A), fontSize: 16),
        textAlign: TextAlign.center,
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
            onConfirm();
            Navigator.pop(context);
          },
          child: Text(
            'Eliminar',
            style: TextStyle(
              fontSize: 16,
              color: Colors.red[900],
              fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}