import 'package:drift/drift.dart';
import 'package:agenda_ganadera/core/database/app_database.dart';

class StockRepository {
  final AppDatabase database;

  StockRepository(this.database);

  Stream<List<StockAnimalData>> observarStock() {
    final consulta = database.select(database.stockAnimales)
      ..orderBy([
        (tabla) => OrderingTerm.asc(tabla.creadoEn),
      ]);

    return consulta.watch();
  }

  Future<int> agregarAnimal({
    required String tipo,
    required int cantidad,
  }) {
    return database.into(database.stockAnimales).insert(
          StockAnimalesCompanion.insert(
            tipo: tipo,
            cantidad: cantidad,
          ),
        );
  }

  Future<void> actualizarAnimal({
    required int id,
    required String tipo,
    required int cantidad,
  }) async {
    await (database.update(database.stockAnimales)
          ..where((tabla) => tabla.id.equals(id)))
        .write(
      StockAnimalesCompanion(
        tipo: Value(tipo),
        cantidad: Value(cantidad),
      ),
    );
  }

  Future<void> eliminarAnimal(int id) async {
    await (database.delete(database.stockAnimales)
          ..where((tabla) => tabla.id.equals(id)))
        .go();
  }
}
