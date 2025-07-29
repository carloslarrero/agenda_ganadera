import 'package:agenda_ganadera/barril.dart';

class Tarjapage extends StatefulWidget {
  final String activityTitle; //para traer el texto de la actividad
  final DateTime activityDate;//para traer la fecha de la actividad

  const Tarjapage({super.key, required this.activityTitle, required this.activityDate});

  @override
  State<Tarjapage> createState() => _TarjapageState();
}

class _TarjapageState extends State<Tarjapage> {
  List<Map<String, dynamic>> animals = [];

  void _showActivityDialog() {
    showDialog(
      context: context,
      builder: (context) => AnimalesMessage(
        onSave: (
          String title,
        ) {
          setState(() {
            animals.add({
              'type': title,
              'count': 0,
            });
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFADBC9F),
      appBar: const Appbarstyle(title: 'Tarja', buttonBack: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              widget.activityTitle,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Text(
              '${widget.activityDate.day}/${widget.activityDate.month}/${widget.activityDate.year}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Color(0XFF12372A),
              thickness: 3.0,
            ),
            GestureDetector(
                onTap: _showActivityDialog,
                child: const Icon(
                  Icons.add,
                  size: 50,
                )),
            ...animals.map((animal) => Container(
                    height: 75,
                    width: 350,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: const Color(0XFF12372A),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            animal['type'],
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          child: const Icon(
                            Icons.add_circle_outline_outlined,
                            size: 33,
                            color: Colors.white70,
                          ),
                          onTap: () {
                            setState(() {
                              animal['count']++;
                            });
                          },
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${animal['count']}',
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          child: const Icon(
                            Icons.remove_circle_outline,
                            size: 33,
                            color: Colors.white70,
                          ),
                          onTap: () {
                            setState(() {
                              animal['count'] =
                                  animal['count'] > 0 ? animal['count'] - 1 : 0;
                            });
                          },
                        ),
                        const SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false, // evita salir del mensaje al presionar fuera de el
                                  builder: (context) => EditMessage(
                                    currentName: animal['type'],
                                    currentCount: animal['count'],
                                    onSave: (newName, newCount){
                                      setState(() {
                                        animal['type'] = newName;
                                        animal['count'] = newCount;
                                      });
                                    },
                                    onDelete: (){
                                      setState(() {
                                        animals.removeAt(animals.indexOf(animal));
                                      });
                                    }
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.settings,
                                size: 30,
                                color: Colors.white70,
                              )),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  void createTarja() {}
}
