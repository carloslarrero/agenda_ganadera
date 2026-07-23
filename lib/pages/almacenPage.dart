import 'package:agenda_ganadera/barril.dart';

class AlmacenPage extends StatelessWidget {
  const AlmacenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFBFADA),
      appBar: Appbarstyle(title: 'Almacen', buttonBack: false),
      body: Column(
        children: [
          Text('Almacen'),
        ],
      ),
    );
  }
}
