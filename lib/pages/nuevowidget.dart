import 'package:agenda_ganadera/barril.dart';

class Nuevowidget extends StatelessWidget {
  const Nuevowidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFADA),
      appBar: const Appbarstyle(title: 'Nuevo Widget', buttonBack: true),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 25),
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                    color: Color(0XFFADBC9F),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                // ignore: sized_box_for_whitespace
                child: Container(
                  height: 250,
                  width: 250,
                  child: Image.network(
                      'https://www.lanacion.com.py/resizer/v2/Q22EMALIGRCWPNG7V6HJRMTPUI.jpg?auth=f7ca1af11f0bf1abbf440a96a590f0ee00816dbb96fa0ae8135518995063e0d6&width=900&smart=true'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25),
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                    color: Color(0XFFADBC9F),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                //child: Image(image: Image.asset('assets/images/micho.jpeg')),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25),
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                    color: Color(0XFFADBC9F),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                //child: Image(image: Image.asset('assets/images/micho.jpeg')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
