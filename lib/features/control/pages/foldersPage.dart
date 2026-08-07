import 'package:agenda_ganadera/barril.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Folderspage extends StatefulWidget {
  const Folderspage({super.key});

  @override
  State<Folderspage> createState() => _FolderspageState();
}

class _FolderspageState extends State<Folderspage> {
  final TextEditingController _tituloController = TextEditingController();
  final FocusNode _tituloFocusNode = FocusNode();

  bool _creandoCarpeta = false;

  void createFolder() {
    if (_creandoCarpeta) {
      _tituloFocusNode.requestFocus();
      return;
    }

    setState(() {
      _creandoCarpeta = true;
      _tituloController.clear();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _tituloFocusNode.requestFocus();
      }
    });
  }

  Future<void> _guardarCarpeta() async {
    final String titulo = _tituloController.text.trim();

    if (titulo.isEmpty) {
      _tituloFocusNode.requestFocus();
      return;
    }

    await context.read<CarpetasControlCubit>().crearCarpeta(
          titulo,
        );

    if (!mounted) return;

    setState(() {
      _creandoCarpeta = false;
      _tituloController.clear();
    });

    _tituloFocusNode.unfocus();
  }

  void _cancelarCreacion() {
    setState(() {
      _creandoCarpeta = false;
      _tituloController.clear();
    });

    _tituloFocusNode.unfocus();
  }

  void _showDeleteDialog(
    CarpetaControlData carpeta,
  ) {
    showDialog(
      context: context,
      builder: (context) => DeleteMessage(
        onConfirm: () {
          context.read<CarpetasControlCubit>().eliminarCarpeta(carpeta.id);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFADA),
      appBar: const Appbarstyle(
        title: 'Administración',
        buttonBack: false,
      ),
      body: BlocListener<CarpetasControlCubit, CarpetasControlState>(
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

          context.read<CarpetasControlCubit>().limpiarError();
        },
        child: BlocBuilder<CarpetasControlCubit, CarpetasControlState>(
          builder: (context, state) {
            if (state.estaCargando && state.carpetas.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0XFF12372A),
                ),
              );
            }

            final List<CarpetaControlData> carpetas = state.carpetas;

            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    if (_creandoCarpeta) _buildCarpetaEditable(),
                    ...carpetas.map(
                      (carpeta) => _buildCarpetaGuardada(carpeta),
                    ),
                    GestureDetector(
                      onTap: createFolder,
                      child: const Icon(
                        FontAwesomeIcons.folderPlus,
                        color: Color(0xFF12372A),
                        size: 50,
                      ),
                    ),
                    if (carpetas.isEmpty && !_creandoCarpeta)
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          'Todavía no hay estancias o campos',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCarpetaEditable() {
    return Builder(
      builder: (context) {
        final double anchoPantalla = MediaQuery.of(context).size.width;

        final double margenHorizontal =
            anchoPantalla > 600 ? anchoPantalla * 0.33 : 80;

        return Container(
          height: 450,
          width: double.infinity,
          margin: EdgeInsets.only(
            bottom: 30,
            left: margenHorizontal,
            right: margenHorizontal,
          ),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0XFFADBC9F),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: TextField(
                  controller: _tituloController,
                  focusNode: _tituloFocusNode,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  textInputAction: TextInputAction.done,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Agregar Título',
                    border: InputBorder.none,
                  ),
                  onSubmitted: (_) {
                    _guardarCarpeta();
                  },
                ),
              ),
              Positioned(
                top: -5,
                right: -5,
                child: GestureDetector(
                  onTap: _cancelarCreacion,
                  child: const Icon(
                    Icons.close,
                    size: 28,
                    color: Color(0XFF12372A),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCarpetaGuardada(
    CarpetaControlData carpeta,
  ) {
    return Builder(
      builder: (context) {
        final double anchoPantalla = MediaQuery.of(context).size.width;

        final double margenHorizontal =
            anchoPantalla > 600 ? anchoPantalla * 0.33 : 80;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Foldercontenido(
                  folderName: carpeta.titulo,
                  carpetaControlId: carpeta.id,
                ),
              ),
            );
          },
          child: Container(
            height: 450,
            width: double.infinity,
            margin: EdgeInsets.only(
              bottom: 30,
              left: margenHorizontal,
              right: margenHorizontal,
            ),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0XFFADBC9F),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        carpeta.titulo,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -5,
                  right: -5,
                  child: GestureDetector(
                    onTap: () {
                      _showDeleteDialog(carpeta);
                    },
                    child: const Icon(
                      Icons.close,
                      size: 28,
                      color: Color(0XFF12372A),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _tituloController.dispose();
    _tituloFocusNode.dispose();
    super.dispose();
  }
}
