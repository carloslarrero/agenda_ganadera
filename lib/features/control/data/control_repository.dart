import 'package:drift/drift.dart';
import 'package:agenda_ganadera/core/database/app_database.dart';

class ControlRepository {
  final AppDatabase database;

  ControlRepository(this.database);

  Stream<List<CarpetaControlData>> observarCarpetas() {
    final consulta = database.select(database.carpetasControl)
      ..orderBy([
        (tabla) => OrderingTerm.asc(tabla.creadoEn),
      ]);

    return consulta.watch();
  }

  Future<int> crearCarpeta({
    required String titulo,
  }) {
    return database.into(database.carpetasControl).insert(
          CarpetasControlCompanion.insert(
            titulo: titulo,
          ),
        );
  }

  Future<void> actualizarCarpeta({
    required int id,
    required String titulo,
  }) async {
    await (database.update(database.carpetasControl)
          ..where((tabla) => tabla.id.equals(id)))
        .write(
      CarpetasControlCompanion(
        titulo: Value(titulo),
      ),
    );
  }

  Future<void> eliminarCarpeta(int id) async {
    await (database.delete(database.carpetasControl)
          ..where((tabla) => tabla.id.equals(id)))
        .go();
  }

  Stream<List<ActividadControlData>> observarActividades(
    int carpetaControlId,
  ) {
    final consulta = database.select(database.actividadesControl)
      ..where(
        (tabla) => tabla.carpetaControlId.equals(carpetaControlId),
      )
      ..orderBy([
        (tabla) => OrderingTerm.desc(tabla.creadoEn),
      ]);

    return consulta.watch();
  }

  Future<int> crearActividad({
    required int carpetaControlId,
    required String titulo,
    required DateTime fecha,
  }) {
    return database.into(database.actividadesControl).insert(
          ActividadesControlCompanion.insert(
            carpetaControlId: carpetaControlId,
            titulo: titulo,
            fecha: fecha,
          ),
        );
  }

  Future<void> eliminarActividad(int id) async {
    await (database.delete(database.actividadesControl)
          ..where((tabla) => tabla.id.equals(id)))
        .go();
  }

  Stream<List<TarjaControlData>> observarTarjas(
    int actividadControlId,
  ) {
    final consulta = database.select(database.tarjasControl)
      ..where(
        (tabla) => tabla.actividadControlId.equals(
          actividadControlId,
        ),
      )
      ..orderBy([
        (tabla) => OrderingTerm.asc(tabla.creadoEn),
      ]);

    return consulta.watch();
  }

  Future<int> crearTarja({
    required int actividadControlId,
    required String tipo,
    required int cantidad,
  }) {
    return database.into(database.tarjasControl).insert(
          TarjasControlCompanion.insert(
            actividadControlId: actividadControlId,
            tipo: tipo,
            cantidad: cantidad,
          ),
        );
  }

  Future<void> actualizarTarja({
    required int id,
    required String tipo,
    required int cantidad,
  }) async {
    await (database.update(database.tarjasControl)
          ..where((tabla) => tabla.id.equals(id)))
        .write(
      TarjasControlCompanion(
        tipo: Value(tipo),
        cantidad: Value(cantidad),
      ),
    );
  }

  Future<void> eliminarTarja(int id) async {
    await (database.delete(database.tarjasControl)
          ..where((tabla) => tabla.id.equals(id)))
        .go();
  }
}
