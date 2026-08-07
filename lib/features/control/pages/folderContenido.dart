import 'package:agenda_ganadera/barril.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Foldercontenido extends StatefulWidget {
  final String folderName;
  final int carpetaControlId;

  const Foldercontenido({
    super.key,
    required this.folderName,
    required this.carpetaControlId,
  });

  @override
  State<Foldercontenido> createState() => _FoldercontenidoState();
}

class _FoldercontenidoState extends State<Foldercontenido> {
  void _showActivityDialog(BuildContext pageContext) {
    showDialog(
      context: pageContext,
      builder: (dialogContext) => ActivityMessage(
        onSave: (title, date) {
          pageContext.read<ActividadesControlCubit>().crearActividad(
                titulo: title,
                fecha: date,
              );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActividadesControlCubit(
        repository: context.read<ControlRepository>(),
        carpetaControlId: widget.carpetaControlId,
      )..observarActividades(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color(0XFFADBC9F),
            appBar: const Appbarstyle(
              title: 'Actividades',
              buttonBack: true,
            ),
            body: BlocBuilder<ActividadesControlCubit, ActividadesControlState>(
              builder: (context, state) {
                if (state.estaCargando && state.actividades.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0XFF12372A),
                    ),
                  );
                }

                return Column(
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      widget.folderName,
                      style: const TextStyle(
                        fontSize: 25,
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
                            width: 2.0,
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
                                  onTap: () {
                                    _showActivityDialog(context);
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    size: 50,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                if (state.actividades.isEmpty)
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 20,
                                    ),
                                    child: Text(
                                      'Todavía no hay actividades',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Color(0XFF12372A),
                                      ),
                                    ),
                                  ),
                                ...state.actividades.map(
                                  (activity) => GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Tarjapage(
                                            activityTitle: activity.titulo,
                                            activityDate: activity.fecha,
                                            actividadControlId: activity.id,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            activity.titulo,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            '${activity.fecha.day}/${activity.fecha.month}/${activity.fecha.year}',
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
                );
              },
            ),
          );
        },
      ),
    );
  }
}
