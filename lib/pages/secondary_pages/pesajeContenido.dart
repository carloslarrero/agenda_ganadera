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
  final List<Map<String, dynamic>> categorias = [];

  void _showAddCategoryDialog() {
    showDialog(
      context: context,
      builder: (context) => CategoriaMessage(
        onSave: (nombre) {
          setState(() {
            categorias.add({
              'nombre': nombre,
              'animales': <Map<String, dynamic>>[],
            });
          });
        },
      ),
    );
  }

  void _showDeleteCategoryDialog(int index) {
    showDialog(
      context: context,
      builder: (context) => DeleteMessage(
        onConfirm: () {
          setState(() {
            categorias.removeAt(index);
          });
        },
      ),
    );
  }

  double _calcularTotalCategoria(
    List<Map<String, dynamic>> animales,
  ) {
    return animales.fold<double>(
      0,
      (suma, animal) {
        final num peso = animal['peso'] ?? 0;
        return suma + peso.toDouble();
      },
    );
  }

  String _formatearFecha(DateTime fecha) {
    final String dia = fecha.day.toString().padLeft(2, '0');
    final String mes = fecha.month.toString().padLeft(2, '0');
    final String anio = fecha.year.toString();

    return '$dia/$mes/$anio';
  }

  String _formatearPeso(double peso) {
    if (peso == peso.roundToDouble()) {
      return peso.toStringAsFixed(0);
    }

    return peso
        .toStringAsFixed(2)
        .replaceFirst(RegExp(r'0+$'), '')
        .replaceFirst(RegExp(r'\.$'), '')
        .replaceAll('.', ',');
  }

  Future<void> _abrirCategoria(
    Map<String, dynamic> categoria,
  ) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoriaPesajePage(
          categoria: categoria['nombre'],
          animales: categoria['animales'],
        ),
      ),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              width: double.infinity,
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: const Color(0XFFADBC9F),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0XFF12372A),
                  width: 2,
                ),
              ),
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: _showAddCategoryDialog,
                        child: const Icon(
                          Icons.add,
                          size: 50,
                          color: Color(0XFF12372A),
                        ),
                      ),
                      const SizedBox(height: 15),
                      if (categorias.isEmpty)
                        const Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: Text(
                            'Agregá una categoría de animales',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0XFF12372A),
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ...categorias.asMap().entries.map((entry) {
                        final int index = entry.key;
                        final Map<String, dynamic> categoria = entry.value;

                        final List<Map<String, dynamic>> animales =
                            List<Map<String, dynamic>>.from(
                          categoria['animales'],
                        );

                        final double total = _calcularTotalCategoria(animales);

                        return GestureDetector(
                          onTap: () {
                            _abrirCategoria(categoria);
                          },
                          child: Container(
                            width: double.infinity,
                            constraints: const BoxConstraints(
                              minHeight: 110,
                            ),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0XFF12372A),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      categoria['nombre'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      '${animales.length} animales',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Total: ${_formatearPeso(total)} kg',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      _showDeleteCategoryDialog(index);
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
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
