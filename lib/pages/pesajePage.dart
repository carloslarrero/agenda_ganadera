import 'package:agenda_ganadera/barril.dart';

class PesajePage extends StatelessWidget {
  const PesajePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFBFADA),
      appBar: Appbarstyle(title: 'Pesaje', buttonBack: false),
      body: SingleChildScrollView(
          child: Column(
        children: [Text('Peso')],
      )),
    );
  }
}
