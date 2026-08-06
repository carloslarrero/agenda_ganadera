import 'dart:async';

import 'package:agenda_ganadera/barril.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriaPesajePage extends StatefulWidget {
  final int categoriaId;
  final String categoria;
  final double porcentajeDestareInicial;

  const CategoriaPesajePage({
    super.key,
    required this.categoriaId,
    required this.categoria,
    required this.porcentajeDestareInicial,
  });

  @override
  State<CategoriaPesajePage> createState() => _CategoriaPesajePageState();
}

class _CategoriaPesajePageState extends State<CategoriaPesajePage> {
  late final AnimalesPesajeCubit _animalesCubit;

  late final TextEditingController _destareController;

  late double porcentajeDestare;

  Timer? _destareTimer;

  @override
  void initState() {
    super.initState();

    porcentajeDestare = widget.porcentajeDestareInicial;

    _destareController = TextEditingController(
      text: _formatearPorcentaje(
        widget.porcentajeDestareInicial,
      ),
    );

    final PesajeRepository repository = context.read<PesajeRepository>();

    _animalesCubit = AnimalesPesajeCubit(
      repository: repository,
      categoriaPesajeId: widget.categoriaId,
    )..observarAnimales();
  }

  void _showAddAnimalDialog() {
    showDialog(
      context: context,
      builder: (context) => PesajeMessage(
        categoria: widget.categoria,
        onSave: (identificativo, peso) {
          _animalesCubit.agregarAnimal(
            identificativo: identificativo,
            peso: peso,
          );
        },
      ),
    );
  }

  void _showDeleteDialog(
    AnimalesPesajeData animal,
  ) {
    showDialog(
      context: context,
      builder: (context) => DeleteMessage(
        onConfirm: () {
          _animalesCubit.eliminarAnimal(
            animal.id,
          );
        },
      ),
    );
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

    /*
     * Esperamos un momento antes de guardar.
     *
     * Esto evita escribir en la base cada vez que
     * el usuario presiona una tecla rápidamente.
     */
    _destareTimer?.cancel();

    _destareTimer = Timer(
      const Duration(milliseconds: 500),
      () {
        context.read<PesajeRepository>().actualizarDestare(
              categoriaId: widget.categoriaId,
              porcentaje: porcentaje,
            );
      },
    );
  }

  double _calcularDestare(
    double total,
  ) {
    return total * porcentajeDestare / 100;
  }

  double _calcularTotalConDestare(
    double total,
  ) {
    return total - _calcularDestare(total);
  }

  String _formatearPorcentaje(
    double porcentaje,
  ) {
    if (porcentaje == porcentaje.roundToDouble()) {
      return porcentaje.toStringAsFixed(0);
    }

    return porcentaje
        .toStringAsFixed(2)
        .replaceFirst(RegExp(r'0+$'), '')
        .replaceFirst(RegExp(r'\.$'), '')
        .replaceAll('.', ',');
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
    return BlocProvider<AnimalesPesajeCubit>.value(
      value: _animalesCubit,
      child: Scaffold(
        backgroundColor: const Color(0XFFADBC9F),
        appBar: Appbarstyle(
          title: widget.categoria,
          buttonBack: true,
        ),
        body: BlocListener<AnimalesPesajeCubit, AnimalesPesajeState>(
          listenWhen: (anterior, actual) {
            return anterior.mensajeError != actual.mensajeError &&
                actual.mensajeError != null;
          },
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.mensajeError ?? 'Ocurrió un error.',
                ),
              ),
            );

            _animalesCubit.limpiarError();
          },
          child: Column(
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
                  child: BlocBuilder<AnimalesPesajeCubit, AnimalesPesajeState>(
                    builder: (context, state) {
                      if (state.estaCargando && state.animales.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      }

                      final List<AnimalesPesajeData> animales = state.animales;

                      final double total = state.totalPeso;

                      final double promedio = state.promedioPeso;

                      final double totalConDestare = _calcularTotalConDestare(
                        total,
                      );

                      return Column(
                        children: [
                          Expanded(
                            child: animales.isEmpty
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
                                    padding: const EdgeInsets.all(
                                      15,
                                    ),
                                    itemCount: animales.length,
                                    itemBuilder: (context, index) {
                                      final animal = animales[index];

                                      return Column(
                                        children: [
                                          ListTile(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            title: Text(
                                              animal.identificativo,
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
                                                  '${_formatearPeso(animal.peso)} kg',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    _showDeleteDialog(
                                                      animal,
                                                    );
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
                                            color: Color(
                                              0xFFFBFADA,
                                            ),
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
                                      '${_formatearPeso(total)} kg',
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
                                      '${_formatearPeso(promedio)} kg',
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
                                        keyboardType: const TextInputType
                                            .numberWithOptions(
                                          decimal: true,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Color(
                                            0XFF12372A,
                                          ),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: const Color.fromARGB(
                                            255,
                                            251,
                                            228,
                                            218,
                                          ),
                                          suffixText: '%',
                                          suffixStyle: const TextStyle(
                                            color: Color(
                                              0XFF12372A,
                                            ),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 8,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
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
                                      '${_formatearPeso(totalConDestare)} kg',
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
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _destareTimer?.cancel();
    _destareController.dispose();
    _animalesCubit.close();
    super.dispose();
  }
}
