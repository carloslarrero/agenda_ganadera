import 'dart:math';
import 'package:agenda_ganadera/barril.dart';
import 'package:intl/intl.dart';

class Principalpage extends StatefulWidget {
  const Principalpage({super.key});

  @override
  State<Principalpage> createState() => _PrincipalpageState();
}

class _PrincipalpageState extends State<Principalpage> {
  List<Map<String, dynamic>> recordatorios = [];
  final colorin = const Color(0xFFFBFADA);
  int indiceConsejo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFADA),
      appBar: const Appbarstyle(title: 'Agenda Ganadera', buttonBack: false),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Builder(builder: (context) {
                final double anchoPantalla = MediaQuery.of(context).size.width;
                final double margenHorizontal =
                    anchoPantalla > 600 ? anchoPantalla * 0.25 : 60.0;

                return Container(
                  height: 180,
                  width: double.infinity,
                  margin: EdgeInsets.only(
                      top: 40, left: margenHorizontal, right: margenHorizontal),
                  decoration: BoxDecoration(
                      color: const Color(0XFFADBC9F),
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Clima',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 1),
                        const Divider(
                          color: Color(0xFF12372A),
                          thickness: 1.0,
                        ),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: const Column(
                                children: [
                                  Text(
                                    'Clima Actual',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    '24 °C',
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF12372A)),
                                  ),
                                  Text(
                                    'Soleado',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: const Column(
                                children: [
                                  Text(
                                    'Pronóstico',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Mañana: 26 °C',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    'Jueves: 22 °C',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    'Viernes: 20 °C',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                );
              }),
              Builder(builder: (context) {
                final double anchoPantalla = MediaQuery.of(context).size.width;
                final double margenHorizontal =
                    anchoPantalla > 600 ? anchoPantalla * 0.25 : 60.0;

                return Container(
                  height: 180,
                  width: double.infinity,
                  margin: EdgeInsets.only(
                      top: 40, left: margenHorizontal, right: margenHorizontal),
                  decoration: BoxDecoration(
                      color: const Color(0XFFADBC9F),
                      borderRadius: BorderRadius.circular(30)),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => RecordatorioMessage(
                          onSave: (nombre, fecha) {
                            setState(() {
                              recordatorios.add({
                                'nombre': nombre,
                                'fecha': fecha,
                              });
                            });
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Recordatorios',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.notification_add,
                                size: 27,
                              )
                            ],
                          ),
                          const SizedBox(height: 1),
                          const Divider(
                            color: Color(0xFF12372A),
                            thickness: 1.0,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          if (recordatorios.isNotEmpty)
                            Expanded(
                              child: ClipRRect(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: recordatorios
                                        .map((recordatorio) => Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween, // Espacio entre el nombre y la fecha
                                                    children: [
                                                      Text(
                                                        recordatorio['nombre'],
                                                        style: const TextStyle(
                                                            fontSize: 18),
                                                      ),
                                                      Text(
                                                        DateFormat('dd/MM/yyyy')
                                                            .format(
                                                                recordatorio[
                                                                    'fecha']),
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Divider(
                                                  color: Colors.black26,
                                                  thickness: 1.0,
                                                  height: 1.0,
                                                ),
                                              ],
                                            ))
                                        .toList(),
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                );
              }),
              Builder(builder: (context) {
                final double anchoPantalla = MediaQuery.of(context).size.width;
                final double margenHorizontal =
                    anchoPantalla > 600 ? anchoPantalla * 0.25 : 60.0;

                return Container(
                  height: 145,
                  width: double.infinity,
                  margin: EdgeInsets.only(
                      top: 50, left: margenHorizontal, right: margenHorizontal),
                  decoration: BoxDecoration(
                      color: const Color(0XFFADBC9F),
                      borderRadius: BorderRadius.circular(30)),
                  // AQUÍ ESTÁ EL CAMBIO: Envolvemos en Padding
                  child: const Padding(
                    padding: EdgeInsets.all(20.0), // Escudo invisible de 20px
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Centramos todo verticalmente
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Stock de Animales',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 1),
                        Divider(
                          color: Color(0xFF12372A),
                          thickness: 1.0,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          '1231',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Total',
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                );
              }),
              Builder(builder: (context) {
                final double anchoPantalla = MediaQuery.of(context).size.width;
                final double margenHorizontal =
                    anchoPantalla > 600 ? anchoPantalla * 0.25 : 60.0;

                return Container(
                  height: 180,
                  width: double.infinity,
                  margin: EdgeInsets.only(
                      top: 40, left: margenHorizontal, right: margenHorizontal),
                  decoration: BoxDecoration(
                      color: const Color(0XFFADBC9F),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Stock de Almacén',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 1),
                        Divider(
                          color: Color(0xFF12372A),
                          thickness: 1.0,
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Aquí va el contenido',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  // Método para construir los botones con ícono y texto
  Widget _buildNavItem(IconData icon, String label, VoidCallback onTapAction) {
    return GestureDetector(
      onTap: onTapAction,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 35, color: colorin),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(color: colorin, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
