import 'package:agenda_ganadera/barril.dart';

class PesajePage extends StatefulWidget {
  const PesajePage({super.key});

  @override
  State<PesajePage> createState() => _PesajePageState();
}

class _PesajePageState extends State<PesajePage> {
  final List<Map<String, dynamic>> containers = [];
  final List<FocusNode> _focusNodes = [];

  void createFolder() {
    setState(() {
      containers.add({
        'title': '',
        'date': DateTime.now(),
        'isEditable': true,
      });

      _focusNodes.add(FocusNode());
    });
  }

  Future<void> _selectDate(int index) async {
    final DateTime fechaActual = containers[index]['date'];

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: fechaActual,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        containers[index]['date'] = picked;
      });
    }
  }

  String _formatearFecha(DateTime fecha) {
    final String dia = fecha.day.toString().padLeft(2, '0');
    final String mes = fecha.month.toString().padLeft(2, '0');
    final String anio = fecha.year.toString();

    return '$dia/$mes/$anio';
  }

  void _guardarTitulo(int index, String value) {
    final String titulo = value.trim();

    if (titulo.isNotEmpty) {
      setState(() {
        containers[index]['title'] = titulo;
        containers[index]['isEditable'] = false;
      });

      _focusNodes[index].unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFADA),
      appBar: const Appbarstyle(
        title: 'Control de Peso',
        buttonBack: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: containers.isEmpty
              ? Column(
                  children: [
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: createFolder,
                      child: const Icon(
                        FontAwesomeIcons.folderPlus,
                        color: Color(0xFF12372A),
                        size: 50,
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    const SizedBox(height: 30),
                    ...containers.asMap().entries.map((entry) {
                      final int index = entry.key;
                      final Map<String, dynamic> container = entry.value;

                      return GestureDetector(
                        onTap: () {
                          if (!container['isEditable'] &&
                              container['title'].toString().isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PesajepageContenido(
                                  folderName: container['title'],
                                  folderDate: container['date'],
                                ),
                              ),
                            );
                          }
                        },
                        child: Builder(
                          builder: (context) {
                            final double anchoPantalla =
                                MediaQuery.of(context).size.width;

                            final double margenHorizontal =
                                anchoPantalla > 600 ? anchoPantalla * 0.33 : 40;

                            return Container(
                              width: double.infinity,

                              // Antes estaba en 450.
                              // Ahora el cuadro es mucho más bajo.
                              constraints: const BoxConstraints(
                                minHeight: 130,
                              ),

                              margin: EdgeInsets.only(
                                bottom: 20,
                                left: margenHorizontal,
                                right: margenHorizontal,
                              ),

                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 18,
                              ),

                              decoration: BoxDecoration(
                                color: const Color(0XFFADBC9F),
                                borderRadius: BorderRadius.circular(30),
                              ),

                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: container['isEditable']
                                        ? Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextField(
                                                focusNode: _focusNodes[index],
                                                autofocus: true,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: 'Agregar título',
                                                  border: InputBorder.none,
                                                ),
                                                onSubmitted: (value) {
                                                  _guardarTitulo(index, value);
                                                },
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'Fecha:',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  TextButton(
                                                    onPressed: () {
                                                      _selectDate(index);
                                                    },
                                                    child: Text(
                                                      _formatearFecha(
                                                          container['date']),
                                                      style: const TextStyle(
                                                        fontSize: 17,
                                                        color:
                                                            Color(0XFF12372A),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 5),
                                            ],
                                          )
                                        : Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                container['title'],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                _formatearFecha(
                                                    container['date']),
                                                style: const TextStyle(
                                                  fontSize: 17,
                                                  color: Color(0XFF12372A),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                                  Positioned(
                                    top: -5,
                                    right: -5,
                                    child: GestureDetector(
                                      onTap: () {
                                        _showDeleteDialog(index);
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        size: 27,
                                        color: Color(0XFF12372A),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }),
                    GestureDetector(
                      onTap: createFolder,
                      child: const Icon(
                        FontAwesomeIcons.folderPlus,
                        color: Color(0xFF12372A),
                        size: 50,
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (final FocusNode node in _focusNodes) {
      node.dispose();
    }

    super.dispose();
  }

  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (context) => DeleteMessage(
        onConfirm: () {
          setState(() {
            _focusNodes[index].dispose();
            _focusNodes.removeAt(index);
            containers.removeAt(index);
          });
        },
      ),
    );
  }
}
