import 'package:agenda_ganadera/barril.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Stockpage extends StatefulWidget {
  const Stockpage({super.key});

  @override
  State<Stockpage> createState() => _StockpageState();
}

class _StockpageState extends State<Stockpage> {
  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => StockMessage(
        onSave: (tipo, cantidad) {
          final int cantidadConvertida = int.tryParse(cantidad.trim()) ?? 0;

          context.read<StockCubit>().agregarAnimal(
                tipo: tipo,
                cantidad: cantidadConvertida,
              );
        },
      ),
    );
  }

  void _showEditDialog(StockAnimalData animal) {
    showDialog(
      context: context,
      builder: (dialogContext) => EditMessage(
        currentName: animal.tipo,
        currentCount: animal.cantidad,
        onSave: (newName, newCount) {
          context.read<StockCubit>().actualizarAnimal(
                id: animal.id,
                tipo: newName,
                cantidad: newCount,
              );
        },
        onDelete: () {
          context.read<StockCubit>().eliminarAnimal(
                animal.id,
              );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFBFADA),
      appBar: const Appbarstyle(
        title: 'Stock',
        buttonBack: false,
      ),
      body: BlocListener<StockCubit, StockState>(
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

          context.read<StockCubit>().limpiarError();
        },
        child: BlocBuilder<StockCubit, StockState>(
          builder: (context, state) {
            if (state.estaCargando && state.animales.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0XFF12372A),
                ),
              );
            }

            return Column(
              children: [
                const SizedBox(height: 25),
                const Text(
                  'Stock de Animales',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _showAddDialog,
                      icon: const Icon(
                        Icons.add,
                        size: 45,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 30,
                      top: 10,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0XFF12372A),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0XFF12372A),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: const Color(0xFFFBFADA),
                          width: 2,
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          Expanded(
                            child: state.animales.isEmpty
                                ? const Center(
                                    child: Text(
                                      'Todavía no hay animales en el stock',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                      left: 2,
                                      right: 2,
                                    ),
                                    child: ListView.builder(
                                      padding: const EdgeInsets.all(10),
                                      itemCount: state.animales.length,
                                      itemBuilder: (context, index) {
                                        final StockAnimalData animal =
                                            state.animales[index];

                                        return _buildAnimalItem(animal);
                                      },
                                    ),
                                  ),
                          ),
                          _buildTotalWidget(state.total),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildAnimalItem(StockAnimalData animal) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: const BoxDecoration(
            color: Color(0XFF12372A),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: ListTile(
            title: Text(
              animal.tipo,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  animal.cantidad.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () {
                    _showEditDialog(animal);
                  },
                  child: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          color: Color(0xFFFBFADA),
          thickness: 1.5,
          height: 1,
        ),
      ],
    );
  }

  Widget _buildTotalWidget(int total) {
    return Column(
      children: [
        const Divider(
          color: Color(0xFFFBFADA),
          thickness: 1.5,
          height: 1,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Total:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                total.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
