import 'package:agenda_ganadera/barril.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tarjapage extends StatefulWidget {
  final String activityTitle;
  final DateTime activityDate;
  final int actividadControlId;

  const Tarjapage({
    super.key,
    required this.activityTitle,
    required this.activityDate,
    required this.actividadControlId,
  });

  @override
  State<Tarjapage> createState() => _TarjapageState();
}

class _TarjapageState extends State<Tarjapage> {
  void _showActivityDialog(BuildContext pageContext) {
    showDialog(
      context: pageContext,
      builder: (dialogContext) => AnimalesMessage(
        onSave: (String title) {
          pageContext.read<TarjasControlCubit>().crearTarja(
                tipo: title,
              );
        },
      ),
    );
  }

  void _showEditDialog(
    BuildContext pageContext,
    TarjaControlData tarja,
  ) {
    showDialog(
      context: pageContext,
      barrierDismissible: false,
      builder: (dialogContext) => EditMessage(
        currentName: tarja.tipo,
        currentCount: tarja.cantidad,
        onSave: (newName, newCount) {
          pageContext.read<TarjasControlCubit>().actualizarTarja(
                id: tarja.id,
                tipo: newName,
                cantidad: newCount,
              );
        },
        onDelete: () {
          pageContext.read<TarjasControlCubit>().eliminarTarja(
                tarja.id,
              );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TarjasControlCubit(
        repository: context.read<ControlRepository>(),
        actividadControlId: widget.actividadControlId,
      )..observarTarjas(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: const Color(0XFFADBC9F),
            appBar: const Appbarstyle(
              title: 'Tarja',
              buttonBack: true,
            ),
            body: BlocBuilder<TarjasControlCubit, TarjasControlState>(
              builder: (context, state) {
                if (state.estaCargando && state.tarjas.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0XFF12372A),
                    ),
                  );
                }

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        widget.activityTitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        '${widget.activityDate.day}/${widget.activityDate.month}/${widget.activityDate.year}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(
                        color: Color(0XFF12372A),
                        thickness: 3.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          _showActivityDialog(context);
                        },
                        child: const Icon(
                          Icons.add,
                          size: 50,
                        ),
                      ),
                      if (state.tarjas.isEmpty)
                        const Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: Text(
                            'Todavía no hay animales registrados',
                            style: TextStyle(
                              fontSize: 17,
                              color: Color(0XFF12372A),
                            ),
                          ),
                        ),
                      ...state.tarjas.map(
                        (tarja) => Container(
                          height: 75,
                          width: 350,
                          margin: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0XFF12372A),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                ),
                                child: Text(
                                  tarja.tipo,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<TarjasControlCubit>()
                                      .sumar(tarja);
                                },
                                child: const Icon(
                                  Icons.add_circle_outline_outlined,
                                  size: 33,
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                tarja.cantidad.toString(),
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<TarjasControlCubit>()
                                      .restar(tarja);
                                },
                                child: const Icon(
                                  Icons.remove_circle_outline,
                                  size: 33,
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 5,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    _showEditDialog(
                                      context,
                                      tarja,
                                    );
                                  },
                                  child: const Icon(
                                    Icons.settings,
                                    size: 30,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
