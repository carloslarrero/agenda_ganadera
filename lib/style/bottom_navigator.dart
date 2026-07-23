import 'package:agenda_ganadera/barril.dart';

class BottomNavigation extends StatelessWidget {
  final int paginaActual;
  final Function(int) onChanged;

  const BottomNavigation({
    super.key,
    required this.paginaActual,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const colorin = Color(0xFFFBFADA);

    return Container(
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 25,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF12372A),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _item(context, Icons.home, 'Inicio', 0, colorin),
              _item(context, FontAwesomeIcons.clipboard, 'Control', 1, colorin),
              _item(context, FontAwesomeIcons.solidRectangleList, 'Stock', 2,
                  colorin),
              _item(
                  context, FontAwesomeIcons.weightHanging, 'Peso', 3, colorin),
              _item(context, FontAwesomeIcons.boxesStacked, 'Almacén', 4,
                  colorin),
            ],
          ),
        ),
      ),
    );
  }

  Widget _item(BuildContext context, IconData icon, String texto, int indice,
      Color color) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onChanged(indice);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 35,
            color: color,
          ),
          Text(
            texto,
            style: TextStyle(color: color, fontSize: 12),
          )
        ],
      ),
    );
  }
}
