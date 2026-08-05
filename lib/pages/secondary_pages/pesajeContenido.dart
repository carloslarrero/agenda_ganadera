import 'package:agenda_ganadera/barril.dart';

class PesajepageContenido extends StatefulWidget {
  final String folderName;
  final DateTime folderDate;

  const PesajepageContenido({
    super.key,
    required this.folderName,
    required this.folderDate,
  });

  @override
  State<PesajepageContenido> createState() => _PesajepageContenidoState();
}

class _PesajepageContenidoState extends State<PesajepageContenido> {
  final List<Map<String, dynamic>> activities = [];

  void _showActivityDialog() {
    showDialog(
      context: context,
      builder: (context) => ActivityMessage(
        onSave: (title, date) {
          setState(() {
            activities.insert(0, {
              'title': title,
              'date': date,
            });
          });
        },
      ),
    );
  }

  String _formatearFecha(DateTime fecha) {
    final String dia = fecha.day.toString().padLeft(2, '0');
    final String mes = fecha.month.toString().padLeft(2, '0');
    final String anio = fecha.year.toString();

    return '$dia/$mes/$anio';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0XFFADBC9F),
      appBar: const Appbarstyle(
        title: 'Pesaje',
        buttonBack: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 25),
          Text(
            widget.folderName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            _formatearFecha(widget.folderDate),
            style: const TextStyle(
              fontSize: 17,
              color: Color(0XFF12372A),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0XFFADBC9F),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0XFF12372A),
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _showActivityDialog,
                        child: const Icon(
                          Icons.add,
                          size: 50,
                          color: Color(0XFF12372A),
                        ),
                      ),
                      const SizedBox(height: 15),
                      ...activities.map(
                        (activity) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Tarjapage(
                                  activityTitle: activity['title'],
                                  activityDate: activity['date'],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            height: 75,
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0XFF12372A),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  activity['title'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  _formatearFecha(
                                    activity['date'],
                                  ),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
