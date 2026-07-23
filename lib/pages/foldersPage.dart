import 'package:agenda_ganadera/barril.dart';

class Folderspage extends StatefulWidget {
  const Folderspage({super.key});

  @override
  State<Folderspage> createState() => _FolderspageState();
}

class _FolderspageState extends State<Folderspage> {
  List<Map<String, dynamic>> containers = [];
  final List<FocusNode> _focusNodes = [];

  void createFolder() {
    setState(() {
      containers.add({
        'title': '',
        'isEditable': true,
      });
      _focusNodes.add(FocusNode());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFADA),
      appBar: const Appbarstyle(title: 'Administración', buttonBack: false),
      body: SingleChildScrollView(
        child: Center(
          child: containers.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: createFolder,
                      child: const Icon(
                        FontAwesomeIcons.folderPlus,
                        color: Color(0xFF12372A),
                        size: 50,
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    const SizedBox(height: 30),
                    ...containers.asMap().entries.map((entry) {
                      final index = entry.key;
                      final container = entry.value;
                      return GestureDetector(
                        onTap: () {
                          if (!container['isEditable'] &&
                              container['title'].isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Foldercontenido(
                                  folderName: container['title'],
                                ),
                              ),
                            );
                          }
                        },
                        child: Column(
                          children: [
                            Builder(builder: (context) {
                              final double anchoPantalla =
                                  MediaQuery.of(context).size.width;
                              final double margenHorizontal =
                                  anchoPantalla > 600
                                      ? anchoPantalla * 0.33
                                      : 80.0;

                              return Container(
                                decoration: BoxDecoration(
                                  color: const Color(0XFFADBC9F),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                height: 450,
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                    bottom: 30,
                                    left: margenHorizontal,
                                    right: margenHorizontal),
                                padding: const EdgeInsets.all(20),
                                child: container['isEditable']
                                    ? TextField(
                                        focusNode: _focusNodes[index],
                                        onSubmitted: (value) {
                                          if (value.trim().isNotEmpty) {
                                            setState(() {
                                              containers[index]['title'] =
                                                  value;
                                              containers[index]['isEditable'] =
                                                  false;
                                            });
                                          }
                                        },
                                        onEditingComplete: () {
                                          if (_focusNodes[index]
                                              .hasPrimaryFocus) {
                                            _focusNodes[index].unfocus();
                                          }
                                        },
                                        decoration: const InputDecoration(
                                          hintText: 'Agregar Título',
                                          border: InputBorder.none,
                                        ),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                        autofocus: true,
                                      )
                                    : Column(
                                        children: [
                                          Text(
                                            container['title'],
                                            style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                              );
                            }),
                          ],
                        ),
                      );
                    }),
                    GestureDetector(
                      onTap: createFolder,
                      child: const Icon(
                        FontAwesomeIcons.folderPlus,
                        color: Color(0xFF12372A),
                        size: 50,
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }
}
