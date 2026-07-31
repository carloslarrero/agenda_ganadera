import 'package:agenda_ganadera/barril.dart';

class AlmacenPage extends StatefulWidget {
  const AlmacenPage({super.key});

  @override
  State<AlmacenPage> createState() => _AlmacenPageState();
}

class _AlmacenPageState extends State<AlmacenPage> {
  int seccionActual = 0;

  final List<Map<String, dynamic>> medicamentos = [];
  final List<Map<String, dynamic>> insumos = [];
  final List<Map<String, dynamic>> alimentos = [];

  final List<String> titulos = [
    'Medicamentos',
    'Insumos',
    'Alimentos',
  ];

  void _showActivityDialog({
    required String titulo,
    required String labelTitulo,
    required List<Map<String, dynamic>> lista,
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
        onSave: (datos) {
          setState(() {
            lista.insert(0, datos);
          });
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
        title: 'Almacén',
        buttonBack: false,
      ),
      body: Column(
        children: [
          const SizedBox(height: 25),
          Row(
            children: [
              IconButton(
                onPressed: seccionActual > 0
                    ? () {
                        setState(() {
                          seccionActual--;
                        });
                      }
                    : null,
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color:
                      seccionActual > 0 ? const Color(0XFF12372A) : Colors.grey,
                ),
              ),
              Expanded(
                child: Text(
                  titulos[seccionActual],
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
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
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: seccionActual < titulos.length - 1
                      ? const Color(0XFF12372A)
                      : Colors.grey,
                ),
              ),
            ],
          ),
          const Divider(
            color: Color(0XFF12372A),
            thickness: 2,
          ),
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
    return _construirSeccion(
      lista: medicamentos,
      onAgregar: () {
        _showActivityDialog(
          titulo: 'Nuevo Medicamento',
          labelTitulo: 'Medicamento',
          lista: medicamentos,
          mostrarCantidad: true,
          mostrarMM: true,
          fechaVencimiento: true,
        );
      },
      mostrarML: true,
      mostrarVencimiento: true,
    );
  }

  Widget _insumos() {
    return _construirSeccion(
      lista: insumos,
      onAgregar: () {
        _showActivityDialog(
          titulo: 'Nuevo Insumo',
          labelTitulo: 'Insumo',
          lista: insumos,
          mostrarCantidad: true,
        );
      },
    );
  }

  Widget _alimentacion() {
    return _construirSeccion(
      lista: alimentos,
      onAgregar: () {
        _showActivityDialog(
          titulo: 'Nuevo Alimento',
          labelTitulo: 'Alimento',
          lista: alimentos,
          mostrarCantidad: true,
          mostrarKG: true,
          fechaVencimiento: true,
        );
      },
      mostrarKG: true,
      mostrarVencimiento: true,
    );
  }

  Widget _construirSeccion({
    required List<Map<String, dynamic>> lista,
    required VoidCallback onAgregar,
    bool mostrarML = false,
    bool mostrarKG = false,
    bool mostrarVencimiento = false,
  }) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 25,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onAgregar,
              child: const Icon(
                Icons.add,
                size: 50,
                color: Color(0XFF12372A),
              ),
            ),
            const SizedBox(height: 10),
            if (lista.isEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Todavía no hay registros',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54,
                  ),
                ),
              ),
            ...lista.map(
              (elemento) => _construirTarjeta(
                elemento: elemento,
                mostrarML: mostrarML,
                mostrarKG: mostrarKG,
                mostrarVencimiento: mostrarVencimiento,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _construirTarjeta({
    required Map<String, dynamic> elemento,
    bool mostrarML = false,
    bool mostrarKG = false,
    bool mostrarVencimiento = false,
  }) {
    final String cantidad = elemento['cantidad'] ?? '';
    final String ml = elemento['ml'] ?? '';
    final String kg = elemento['kg'] ?? '';
    final DateTime fecha = elemento['date'];
    final DateTime? vencimiento = elemento['expirationDate'];

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: const Color(0XFF12372A),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            elemento['title'],
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (cantidad.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(
              'Cantidad: $cantidad',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
          if (mostrarML && ml.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              'Mililitros: $ml ml',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
          if (mostrarKG && kg.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              'Kilogramos: $kg kg',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
          const SizedBox(height: 5),
          Text(
            'Fecha: ${_formatearFecha(fecha)}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          if (mostrarVencimiento && vencimiento != null) ...[
            const SizedBox(height: 4),
            Text(
              'Vencimiento: ${_formatearFecha(vencimiento)}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
