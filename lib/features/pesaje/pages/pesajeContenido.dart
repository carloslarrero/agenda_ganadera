import 'package:agenda_ganadera/barril.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PesajepageContenido extends StatefulWidget {
  final int controlPesajeId;
  final String folderName;
  final DateTime folderDate;

  const PesajepageContenido({
    super.key,
    required this.folderName,
    required this.folderDate,
    required this.controlPesajeId,
  });

  @override
  State<PesajepageContenido> createState() => _PesajepageContenidoState();
}

class _PesajepageContenidoState extends State<PesajepageContenido> {
  late final CategoriaPesajeCubit _categoriaCubit;

  @override
  void initState() {
    super.initState();

    final PesajeRepository repository = context.read<PesajeRepository>();

    _categoriaCubit = CategoriaPesajeCubit(
      repository: repository,
      controlPesajeId: widget.controlPesajeId,
    )..observarCategorias();
  }

  void _showAddCategoryDialog() {
    showDialog(
      context: context,
      builder: (context) => CategoriaMessage(
        onSave: (nombre) {
          _categoriaCubit.crearCategoria(nombre);
        },
      ),
    );
  }

  void _showDeleteCategoryDialog(
    CategoriasPesajeData categoria,
  ) {
    showDialog(
      context: context,
      builder: (context) => DeleteMessage(
        onConfirm: () {
          _categoriaCubit.eliminarCategoria(
            categoria.id,
          );
        },
      ),
    );
  }

  Future<void> _abrirCategoria(
    CategoriasPesajeData categoria,
  ) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoriaPesajePage(
          categoriaId: categoria.id,
          categoria: categoria.nombre,
          porcentajeDestareInicial: categoria.porcentajeDestare,
        ),
      ),
    );

    if (mounted) {
      setState(() {});
    }
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

  Future<List<AnimalesPesajeData>> _obtenerAnimalesCategoria(
    int categoriaId,
  ) {
    return context.read<PesajeRepository>().obtenerAnimales(categoriaId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriaPesajeCubit>.value(
      value: _categoriaCubit,
      child: Scaffold(
        backgroundColor: const Color(0XFFADBC9F),
        appBar: const Appbarstyle(
          title: 'Pesaje',
          buttonBack: true,
        ),
        body: BlocListener<CategoriaPesajeCubit, CategoriaPesajeState>(
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

            _categoriaCubit.limpiarError();
          },
          child: Column(
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
                  child:
                      BlocBuilder<CategoriaPesajeCubit, CategoriaPesajeState>(
                    builder: (context, state) {
                      if (state.estaCargando && state.categorias.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Color(0XFF12372A),
                          ),
                        );
                      }

                      final List<CategoriasPesajeData> categorias =
                          state.categorias;

                      return SingleChildScrollView(
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
                                  padding: EdgeInsets.only(
                                    top: 25,
                                  ),
                                  child: Text(
                                    'Agregá una categoría de animales',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0XFF12372A),
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ...categorias.map(
                                (categoria) {
                                  return FutureBuilder<
                                      List<AnimalesPesajeData>>(
                                    future: _obtenerAnimalesCategoria(
                                      categoria.id,
                                    ),
                                    builder: (context, snapshot) {
                                      final animales = snapshot.data ??
                                          const <AnimalesPesajeData>[];

                                      final double total =
                                          animales.fold<double>(
                                        0,
                                        (
                                          suma,
                                          animal,
                                        ) =>
                                            suma + animal.peso,
                                      );

                                      return _construirCategoria(
                                        categoria: categoria,
                                        cantidadAnimales: animales.length,
                                        totalPeso: total,
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
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

  Widget _construirCategoria({
    required CategoriasPesajeData categoria,
    required int cantidadAnimales,
    required double totalPeso,
  }) {
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
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    categoria.nombre,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    '$cantidadAnimales animales',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Total: ${_formatearPeso(totalPeso)} kg',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  _showDeleteCategoryDialog(
                    categoria,
                  );
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
  }

  @override
  void dispose() {
    _categoriaCubit.close();
    super.dispose();
  }
}
