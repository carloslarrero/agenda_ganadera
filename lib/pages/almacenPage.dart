import 'package:agenda_ganadera/barril.dart';

class AlmacenPage extends StatefulWidget {
  const AlmacenPage({super.key});

  @override
  State<AlmacenPage> createState() => _AlmacenPageState();
}

class _AlmacenPageState extends State<AlmacenPage> {
  int seccionActual = 0;
  List<Map<String, dynamic>> activities = [];

  void _showActivityDialog({
    required String titulo,
    required String labelTitulo,
    bool mostrarCantidad = false,
    bool mostrarMM = false,
    bool mostrarKG = false,
    bool fechaVencimiento = false,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlmacenMessage(
        titulo: titulo,
        labelTitulo: labelTitulo,
        mostrarCantidad: mostrarCantidad,
        mostrarMM: mostrarMM,
        mostrarKG: mostrarKG,
        fechaVencimiento: fechaVencimiento,
        onSave: (title, date) {
          setState(() {
            activities.insert(0, {
              'title': title,
              'date': date,
            });
          });
        },
      ),
    );
  }

  final List<String> titulos = [
    'Medicamentos',
    'Insumos',
    'Alimentos',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFADA),
      appBar: const Appbarstyle(
        title: 'Almacen',
        buttonBack: false,
      ),
      body: Column(
        children: [
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: seccionActual > 0
                    ? () {
                        setState(() {
                          seccionActual--;
                        });
                      }
                    : null,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Color(0XFF12372A),
                ),
              ),
              Text(
                titulos[seccionActual],
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: seccionActual < titulos.length - 1
                    ? () {
                        setState(() {
                          seccionActual++;
                        });
                      }
                    : null,
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),

          const Divider(
            color: Color(0XFF12372A),
            thickness: 2,
          ),

          /// Contenido de cada sección
          Expanded(
            child: IndexedStack(
              index: seccionActual,
              children: [
                _medicamentos(),
                _insumos(),
                _alimentacion(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _medicamentos() {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => _showActivityDialog(
              titulo: "Nuevo Medicamento",
              labelTitulo: "Medicamento",
              mostrarCantidad: true,
              mostrarMM: true,
              fechaVencimiento: true,
            ),
            child: const Icon(Icons.add, size: 50, color: Color(0XFF12372A)),
          ),
        ],
      ),
    );
  }

  Widget _insumos() {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => _showActivityDialog(
              titulo: "Nuevo Insumo",
              labelTitulo: "Insumo",
              mostrarCantidad: true,
            ),
            child: const Icon(Icons.add, size: 50, color: Color(0XFF12372A)),
          ),
        ],
      ),
    );
  }

  Widget _alimentacion() {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => _showActivityDialog(
              titulo: "Nuevo Alimento",
              labelTitulo: "Alimento",
              mostrarCantidad: true,
              mostrarKG: true,
              fechaVencimiento: true,
            ),
            child: const Icon(Icons.add, size: 50, color: Color(0XFF12372A)),
          ),
        ],
      ),
    );
  }
}
