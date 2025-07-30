import 'package:agenda_ganadera/barril.dart';

class Foldercontenido extends StatefulWidget {
  final String folderName;

  const Foldercontenido({
    super.key,
    required this.folderName,
  });

  @override
  State<Foldercontenido> createState() => _FoldercontenidoState();
}

class _FoldercontenidoState extends State<Foldercontenido> {
  List<Map<String, dynamic>> activities = [];

  void _showActivityDialog() {
    showDialog(
      context: context,
      builder: (context) => ActivityMessage(
        onSave: (title, date) {
          setState(() {
            activities.insert(0, {
              //añade a la ultima actividad agregada al comienzo en el index 0
              'title': title,
              'date': date,
            });
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, //evita que el Scaffold se redimensione cuando aparece el teclado
      backgroundColor: const Color(0XFFADBC9F),
      appBar: const Appbarstyle(title: 'Actividades', buttonBack: true),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            widget.folderName,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: 360,
              decoration: BoxDecoration(
                color: const Color(0XFFADBC9F),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0XFF12372A), width: 2.0),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Icon(Icons.delete),
                    GestureDetector(
                      onTap: _showActivityDialog,
                      child: const Icon(Icons.add, size: 50),
                    ),
                    ...activities.map((activity) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Tarjapage(
                                  activityTitle: activity[
                                      'title'], //mandamos el titulo de la actividad
                                  activityDate: activity[
                                      'date'], //mandamos la fecha de la actividad
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            height: 75,
                            width: 250,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0XFF12372A),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  activity['title'],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${activity['date'].day}/${activity['date'].month}/${activity['date'].year}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
