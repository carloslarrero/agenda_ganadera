// ignore_for_file: file_names
import 'package:agenda_ganadera/barril.dart';
import 'package:intl/intl.dart';

class Principalpage extends StatefulWidget {
  const Principalpage({super.key});

  @override
  State<Principalpage> createState() => _PrincipalpageState();
}

class _PrincipalpageState extends State<Principalpage> {
  List<Map<String, dynamic>> recordatorios = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFADA),
      appBar: const Appbarstyle(title: 'Agenda Ganadera', buttonBack: false),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Folderspage()));
                },
                child: Container(
                  height: 120,
                  width: 200,
                  margin: const EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                      color: const Color(0xFF12372A),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'CONTROL',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Icon(
                        FontAwesomeIcons.clipboardCheck,
                        color: Colors.white,
                        size: 55,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 150,
                width: 260,
                margin: const EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                    color: const Color(0XFFADBC9F),
                    borderRadius: BorderRadius.circular(40)),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => RecordatorioMessage(
                        onSave: (nombre, fecha) {
                          setState(() {
                            recordatorios.add({
                              'nombre': nombre,
                              'fecha': fecha,
                            });
                          });
                        },
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Recordatorios',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.notification_add)
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (recordatorios.isNotEmpty)
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: recordatorios
                                    .map((recordatorio) => Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12,
                                                  right: 12,
                                                  bottom: 3),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    recordatorio['nombre'],
                                                    style: const TextStyle(
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                    DateFormat('dd/MM/yyyy')
                                                        .format(recordatorio[
                                                            'fecha']),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Stockpage()));
                },
                child: Container(
                    height: 130,
                    width: 260,
                    margin: const EdgeInsets.only(top: 40),
                    decoration: BoxDecoration(
                        color: const Color(0XFFADBC9F),
                        borderRadius: BorderRadius.circular(40)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Stock de Animales',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          '1231',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Total',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    )),
              ),
              Container(
                  height: 130,
                  width: 260,
                  margin: const EdgeInsets.only(top: 40),
                  decoration: BoxDecoration(
                      color: const Color(0XFFADBC9F),
                      borderRadius: BorderRadius.circular(40)),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Consejo del día',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'El ojo del dueño, engorda el ganado',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  )),
              //FloatingActionButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const Tarjapage()));})
            ],
          ),
        ),
      ),
    );
  }
}