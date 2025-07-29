import 'package:flutter/material.dart';
import 'package:agenda_ganadera/barril.dart';

class Stockpage extends StatefulWidget {
  const Stockpage({super.key});

  @override
  State<Stockpage> createState() => _StockpageState();
}

class _StockpageState extends State<Stockpage> {
  List<Map<String, dynamic>> animales = [];
  int total = 0;

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => StockMessage(
        onSave: (tipo, cantidad) {
          setState(() {
            animales.add({
              'tipo': tipo,
              'cantidad': int.tryParse(cantidad) ?? 0,
            });
            _calcularTotal();
          });
        },
      ),
    );
  }

  void _calcularTotal() {
    total = animales.fold(0, (sum, animal) => sum + (animal['cantidad'] as int));
  }

    void _showEditDialog(int index) {
    showDialog(
      context: context,
      builder: (context) => EditMessage(
        currentName: animales[index]['tipo'],
        currentCount: animales[index]['cantidad'],
        onSave: (newName, newCount) {
          setState(() {
            animales[index] = {
              'tipo': newName,
              'cantidad': newCount,
            };
            _calcularTotal();
          });
        },
        onDelete: () {
          setState(() {
            animales.removeAt(index);
            _calcularTotal();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //evita que el Scaffold se redimensione cuando aparece el teclado
      backgroundColor: const Color(0xFFFBFADA),
      appBar: const Appbarstyle(title: 'Stock', buttonBack: true),
      body: Column(
        children: [
          const SizedBox(height: 25),
              const Text(
                'Stock de Animales', 
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),

          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _showAddDialog, 
                icon: const Icon(Icons.add, size: 45, color: Colors.black),
              ),
              /*IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.lock_outline_rounded, size: 35, color: Colors.black),
              ),*/
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 540,
                width: 340,
                decoration: BoxDecoration(
                  color: const Color(0XFF12372A), 
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Container(
                height: 520,
                width: 320,
                decoration: BoxDecoration(
                  color: const Color(0XFF12372A), 
                  borderRadius: BorderRadius.circular(40), 
                  border: Border.all(color: const Color(0xFFFBFADA), width: 2.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,    
                          bottom: 10, 
                          left: 2,
                          right: 2,
                        ),
                        child: ListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: animales.length,
                          itemBuilder: (context, index) {
                            return _buildAnimalItem(index);
                          },
                        ),
                      ),
                    ),
                    _buildTotalWidget(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAnimalItem(int index) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: const BoxDecoration(
            color: Color(0XFF12372A),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)
            ),
          ),
          child: ListTile(
            title: Text(
              animales[index]['tipo'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  animales[index]['cantidad'].toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () => _showEditDialog(index),
                  child: const Icon(Icons.settings, color: Colors.white),
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

  Widget _buildTotalWidget() {
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