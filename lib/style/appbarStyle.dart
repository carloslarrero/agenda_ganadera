import 'package:agenda_ganadera/barril.dart';

class Appbarstyle extends StatelessWidget implements PreferredSizeWidget {
  const Appbarstyle({
    super.key,
    required this.title,
    required this.buttonBack,
  });

  final String title;
  final bool buttonBack;

  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight); //define el tamaño preferido del appbar

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: const Color(0xFF12372A),
      leading: buttonBack
          ? IconButton(
              //si el buttonBack es true muestra si es false da un valor null
              icon: const Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () => Navigator.pop(context),
            )
          : null,
    );
  }
}
