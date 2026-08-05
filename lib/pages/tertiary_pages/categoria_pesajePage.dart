import 'package:agenda_ganadera/barril.dart';

class CategoriaPesajePage extends StatefulWidget {
  final String categoria;
  final List<Map<String, dynamic>> animales;

  const CategoriaPesajePage({
    super.key,
    required this.categoria,
    required this.animales,
  });

  @override
  State<CategoriaPesajePage> createState() => _CategoriaPesajePageState();
}

class _CategoriaPesajePageState extends State<CategoriaPesajePage> {
  final TextEditingController _destareController =
      TextEditingController(text: '0');

  double porcentajeDestare = 0;

  void _showAddAnimalDialog() {
    showDialog(
      context: context,
      builder: (context) => PesajeMessage(
        categoria: widget.categoria,
        onSave: (identificativo, peso) {
          setState(() {
            widget.animales.add({
              'identificativo': identificativo,
              'peso': peso,
            });
          });
        },
      ),
    );
  }

  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (context) => DeleteMessage(
        onConfirm: () {
          setState(() {
            widget.animales.removeAt(index);
          });
        },
      ),
    );
  }

  double _calcularTotal() {
    return widget.animales.fold<double>(
      0,
      (suma, animal) {
        final num peso = animal['peso'] ?? 0;
        return suma + peso.toDouble();
      },
    );
  }

  double _calcularPromedio() {
    if (widget.animales.isEmpty) {
      return 0;
    }

    return _calcularTotal() / widget.animales.length;
  }

  double _calcularDestare() {
    final double total = _calcularTotal();

    return total * porcentajeDestare / 100;
  }

  double _calcularTotalConDestare() {
    return _calcularTotal() - _calcularDestare();
  }

  void _actualizarDestare(String value) {
    final String valorCorregido = value.trim().replaceAll(',', '.');
    double porcentaje = double.tryParse(valorCorregido) ?? 0;

    if (porcentaje < 0) {
      porcentaje = 0;
    }

    if (porcentaje > 100) {
      porcentaje = 100;
    }

    setState(() {
      porcentajeDestare = porcentaje;
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFADBC9F),
      appBar: Appbarstyle(
        title: widget.categoria,
        buttonBack: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          GestureDetector(
            onTap: _showAddAnimalDialog,
            child: const Icon(
              Icons.add,
              size: 50,
              color: Color(0XFF12372A),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
              ),
              decoration: BoxDecoration(
                color: const Color(0XFF12372A),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: widget.animales.isEmpty
                        ? const Center(
                            child: Text(
                              'Todavía no hay animales registrados',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.all(15),
                            itemCount: widget.animales.length,
                            itemBuilder: (context, index) {
                              final animal = widget.animales[index];
                              final num peso = animal['peso'] ?? 0;

                              return Column(
                                children: [
                                  ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    title: Text(
                                      animal['identificativo'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          '${_formatearPeso(peso.toDouble())} kg',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        GestureDetector(
                                          onTap: () {
                                            _showDeleteDialog(index);
                                          },
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 23,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    color: Color(0xFFFBFADA),
                                    thickness: 1.5,
                                    height: 1,
                                  ),
                                ],
                              );
                            },
                          ),
                  ),
                  const Divider(
                    color: Color(0xFFFBFADA),
                    thickness: 2,
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Total Peso de ${widget.categoria}:',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              '${_formatearPeso(_calcularTotal())} kg',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Promedio:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              '${_formatearPeso(_calcularPromedio())} kg',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Porcentaje de destare:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 75,
                              height: 45,
                              child: TextField(
                                controller: _destareController,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0XFF12372A),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 251, 228, 218),
                                  suffixText: '%',
                                  suffixStyle: const TextStyle(
                                    color: Color(0XFF12372A),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                onChanged: _actualizarDestare,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Total con Destare:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              '${_formatearPeso(_calcularTotalConDestare())} kg',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _destareController.dispose();
    super.dispose();
  }
}
