import 'package:agenda_ganadera/barril.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int paginaActual = 0;

  final paginas = const [
    Principalpage(),
    Folderspage(),
    Stockpage(),
    PesajePage(),
    AlmacenPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        child: KeyedSubtree(
          key: ValueKey(paginaActual),
          child: paginas[paginaActual],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        paginaActual: paginaActual,
        onChanged: (index) {
          setState(() {
            paginaActual = index;
          });
        },
      ),
    );
  }
}
