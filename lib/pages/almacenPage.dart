import 'package:agenda_ganadera/barril.dart';

class AlmacenPage extends StatefulWidget {
  const AlmacenPage({super.key});

  @override
  State<AlmacenPage> createState() => _AlmacenPageState();
}

class _AlmacenPageState extends State<AlmacenPage> {
  int seccionActual = 0;

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
                _alimentacion(),
                _herramientas(),
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
            onTap: () {},
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
            onTap: () {},
            child: const Icon(Icons.add, size: 50, color: Color(0XFF12372A)),
          ),
        ],
      ),
    );
  }

  Widget _herramientas() {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.add, size: 50, color: Color(0XFF12372A)),
          ),
        ],
      ),
    );
  }
}
