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
  // 1. Cambiamos kToolbarHeight por un número menor, por ejemplo 40.0
  Size get preferredSize => const Size.fromHeight(40.0); 

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // 2. Le decimos al AppBar que su altura ahora es 40.0
      toolbarHeight: 40.0, 
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
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