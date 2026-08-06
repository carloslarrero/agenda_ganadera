import 'package:agenda_ganadera/barril.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PesajePage extends StatefulWidget {
  const PesajePage({super.key});

  @override
  State<PesajePage> createState() => _PesajePageState();
}

class _PesajePageState extends State<PesajePage> {
  final TextEditingController _tituloController = TextEditingController();
  final FocusNode _tituloFocusNode = FocusNode();

  bool _creandoControl = false;
  DateTime _fechaSeleccionada = DateTime.now();

  void _crearControlTemporal() {
    if (_creandoControl) {
      _tituloFocusNode.requestFocus();
      return;
    }

    setState(() {
      _creandoControl = true;
      _fechaSeleccionada = DateTime.now();
      _tituloController.clear();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _tituloFocusNode.requestFocus();
      }
    });
  }

  Future<void> _seleccionarFecha() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _fechaSeleccionada,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && mounted) {
      setState(() {
        _fechaSeleccionada = picked;
      });
    }
  }

  Future<void> _guardarControl() async {
    final String titulo = _tituloController.text.trim();

    if (titulo.isEmpty) {
      _tituloFocusNode.requestFocus();
      return;
    }

    await context.read<PesajeCubit>().crearControl(
          titulo: titulo,
          fecha: _fechaSeleccionada,
        );

    if (!mounted) return;

    setState(() {
      _creandoControl = false;
      _tituloController.clear();
      _fechaSeleccionada = DateTime.now();
    });

    _tituloFocusNode.unfocus();
  }

  void _cancelarCreacion() {
    setState(() {
      _creandoControl = false;
      _tituloController.clear();
      _fechaSeleccionada = DateTime.now();
    });

    _tituloFocusNode.unfocus();
  }

  void _mostrarEliminarControl(ControlesPesajeData control) {
    showDialog(
      context: context,
      builder: (dialogContext) => DeleteMessage(
        onConfirm: () {
          context.read<PesajeCubit>().eliminarControl(control.id);
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
      backgroundColor: const Color(0xFFFBFADA),
      appBar: const Appbarstyle(
        title: 'Control de Peso',
        buttonBack: false,
      ),
      body: BlocListener<PesajeCubit, PesajeState>(
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

          context.read<PesajeCubit>().limpiarError();
        },
        child: BlocBuilder<PesajeCubit, PesajeState>(
          builder: (context, state) {
            if (state.estaCargando && state.controles.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0XFF12372A),
                ),
              );
            }

            final List<ControlesPesajeData> controles = state.controles;

            return SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    if (_creandoControl) _construirControlEditable(),
                    ...controles.map(
                      (control) => _construirControlGuardado(control),
                    ),
                    GestureDetector(
                      onTap: _crearControlTemporal,
                      child: const Icon(
                        FontAwesomeIcons.folderPlus,
                        color: Color(0xFF12372A),
                        size: 50,
                      ),
                    ),
                    if (controles.isEmpty && !_creandoControl)
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          'Todavía no hay controles de peso',
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

  Widget _construirControlEditable() {
    return Builder(
      builder: (context) {
        final double anchoPantalla = MediaQuery.of(context).size.width;

        final double margenHorizontal =
            anchoPantalla > 600 ? anchoPantalla * 0.33 : 40;

        return Container(
          width: double.infinity,
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
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
                        hintText: 'Agregar título',
                        border: InputBorder.none,
                      ),
                      onSubmitted: (_) {
                        _guardarControl();
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Fecha:',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 5),
                        TextButton(
                          onPressed: _seleccionarFecha,
                          child: Text(
                            _formatearFecha(_fechaSeleccionada),
                            style: const TextStyle(
                              fontSize: 17,
                              color: Color(0XFF12372A),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: _guardarControl,
                      child: const Text(
                        'Guardar',
                        style: TextStyle(
                          color: Color(0XFF12372A),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -5,
                right: -5,
                child: GestureDetector(
                  onTap: _cancelarCreacion,
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
    );
  }

  Widget _construirControlGuardado(
    ControlesPesajeData control,
  ) {
    return Builder(
      builder: (context) {
        final double anchoPantalla = MediaQuery.of(context).size.width;

        final double margenHorizontal =
            anchoPantalla > 600 ? anchoPantalla * 0.33 : 40;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PesajepageContenido(
                  controlPesajeId: control.id,
                  folderName: control.titulo,
                  folderDate: control.fecha,
                ),
              ),
            );
          },
          child: Container(
            width: double.infinity,
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        control.titulo,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _formatearFecha(control.fecha),
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
                      _mostrarEliminarControl(control);
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
