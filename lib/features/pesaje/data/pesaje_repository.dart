import 'package:drift/drift.dart';
import 'package:agenda_ganadera/core/database/app_database.dart';

class PesajeRepository {
  final AppDatabase database;

  PesajeRepository(this.database);

  // =========================================================
  // CONTROLES DE PESAJE
  // =========================================================

  Future<int> crearControlPesaje({
    required String titulo,
    required DateTime fecha,
  }) {
    return database.into(database.controlesPesaje).insert(
          ControlesPesajeCompanion.insert(
            titulo: titulo,
            fecha: fecha,
          ),
        );
  }

  Stream<List<ControlesPesajeData>> observarControlesPesaje() {
    final consulta = database.select(database.controlesPesaje)
      ..orderBy([
        (tabla) => OrderingTerm.desc(tabla.fecha),
      ]);

    return consulta.watch();
  }

  Future<List<ControlesPesajeData>> obtenerControlesPesaje() {
    final consulta = database.select(database.controlesPesaje)
      ..orderBy([
        (tabla) => OrderingTerm.desc(tabla.fecha),
      ]);

    return consulta.get();
  }

  Future<void> actualizarControlPesaje({
    required int id,
    required String titulo,
    required DateTime fecha,
  }) async {
    await (database.update(database.controlesPesaje)
          ..where((tabla) => tabla.id.equals(id)))
        .write(
      ControlesPesajeCompanion(
        titulo: Value(titulo),
        fecha: Value(fecha),
      ),
    );
  }

  Future<void> eliminarControlPesaje(int id) async {
    await (database.delete(database.controlesPesaje)
          ..where((tabla) => tabla.id.equals(id)))
        .go();
  }

  // =========================================================
  // CATEGORÍAS DE PESAJE
  // =========================================================

  Future<int> crearCategoria({
    required int controlPesajeId,
    required String nombre,
  }) {
    return database.into(database.categoriasPesaje).insert(
          CategoriasPesajeCompanion.insert(
            controlPesajeId: controlPesajeId,
            nombre: nombre,
          ),
        );
  }

  Stream<List<CategoriasPesajeData>> observarCategorias(
    int controlPesajeId,
  ) {
    final consulta = database.select(database.categoriasPesaje)
      ..where(
        (tabla) => tabla.controlPesajeId.equals(controlPesajeId),
      )
      ..orderBy([
        (tabla) => OrderingTerm.asc(tabla.creadoEn),
      ]);

    return consulta.watch();
  }

  Future<List<CategoriasPesajeData>> obtenerCategorias(
    int controlPesajeId,
  ) {
    final consulta = database.select(database.categoriasPesaje)
      ..where(
        (tabla) => tabla.controlPesajeId.equals(controlPesajeId),
      )
      ..orderBy([
        (tabla) => OrderingTerm.asc(tabla.creadoEn),
      ]);

    return consulta.get();
  }

  Future<void> actualizarNombreCategoria({
    required int categoriaId,
    required String nombre,
  }) async {
    await (database.update(database.categoriasPesaje)
          ..where((tabla) => tabla.id.equals(categoriaId)))
        .write(
      CategoriasPesajeCompanion(
        nombre: Value(nombre),
      ),
    );
  }

  Future<void> actualizarDestare({
    required int categoriaId,
    required double porcentaje,
  }) async {
    double porcentajeCorregido = porcentaje;

    if (porcentajeCorregido < 0) {
      porcentajeCorregido = 0;
    }

    if (porcentajeCorregido > 100) {
      porcentajeCorregido = 100;
    }

    await (database.update(database.categoriasPesaje)
          ..where((tabla) => tabla.id.equals(categoriaId)))
        .write(
      CategoriasPesajeCompanion(
        porcentajeDestare: Value(porcentajeCorregido),
      ),
    );
  }

  Future<void> eliminarCategoria(int categoriaId) async {
    await (database.delete(database.categoriasPesaje)
          ..where((tabla) => tabla.id.equals(categoriaId)))
        .go();
  }

  // =========================================================
  // ANIMALES PESADOS
  // =========================================================

  Future<int> agregarAnimal({
    required int categoriaPesajeId,
    required String identificativo,
    required double peso,
  }) {
    return database.into(database.animalesPesaje).insert(
          AnimalesPesajeCompanion.insert(
            categoriaPesajeId: categoriaPesajeId,
            identificativo: identificativo,
            peso: peso,
          ),
        );
  }

  Stream<List<AnimalesPesajeData>> observarAnimales(
    int categoriaPesajeId,
  ) {
    final consulta = database.select(database.animalesPesaje)
      ..where(
        (tabla) => tabla.categoriaPesajeId.equals(categoriaPesajeId),
      )
      ..orderBy([
        (tabla) => OrderingTerm.asc(tabla.creadoEn),
      ]);

    return consulta.watch();
  }

  Future<List<AnimalesPesajeData>> obtenerAnimales(
    int categoriaPesajeId,
  ) {
    final consulta = database.select(database.animalesPesaje)
      ..where(
        (tabla) => tabla.categoriaPesajeId.equals(categoriaPesajeId),
      )
      ..orderBy([
        (tabla) => OrderingTerm.asc(tabla.creadoEn),
      ]);

    return consulta.get();
  }

  Future<void> actualizarAnimal({
    required int animalId,
    required String identificativo,
    required double peso,
  }) async {
    await (database.update(database.animalesPesaje)
          ..where((tabla) => tabla.id.equals(animalId)))
        .write(
      AnimalesPesajeCompanion(
        identificativo: Value(identificativo),
        peso: Value(peso),
      ),
    );
  }

  Future<void> eliminarAnimal(int animalId) async {
    await (database.delete(database.animalesPesaje)
          ..where((tabla) => tabla.id.equals(animalId)))
        .go();
  }

  // =========================================================
  // CÁLCULOS
  // =========================================================

  Future<double> calcularTotalCategoria(
    int categoriaPesajeId,
  ) async {
    final animales = await obtenerAnimales(categoriaPesajeId);

    return animales.fold<double>(
      0,
      (suma, animal) => suma + animal.peso,
    );
  }

  Future<double> calcularPromedioCategoria(
    int categoriaPesajeId,
  ) async {
    final animales = await obtenerAnimales(categoriaPesajeId);

    if (animales.isEmpty) {
      return 0;
    }

    final total = animales.fold<double>(
      0,
      (suma, animal) => suma + animal.peso,
    );

    return total / animales.length;
  }
}
