import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class ControlesPesaje extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get titulo => text()();

  DateTimeColumn get fecha => dateTime()();

  DateTimeColumn get creadoEn => dateTime().withDefault(
        currentDateAndTime,
      )();
}

class CategoriasPesaje extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get controlPesajeId => integer().references(
        ControlesPesaje,
        #id,
        onDelete: KeyAction.cascade,
      )();

  TextColumn get nombre => text()();

  RealColumn get porcentajeDestare => real().withDefault(
        const Constant(0),
      )();

  DateTimeColumn get creadoEn => dateTime().withDefault(
        currentDateAndTime,
      )();
}

class AnimalesPesaje extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get categoriaPesajeId => integer().references(
        CategoriasPesaje,
        #id,
        onDelete: KeyAction.cascade,
      )();

  TextColumn get identificativo => text()();

  RealColumn get peso => real()();

  DateTimeColumn get creadoEn => dateTime().withDefault(
        currentDateAndTime,
      )();
}

@DataClassName('StockAnimalData')
class StockAnimales extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get tipo => text()();

  IntColumn get cantidad => integer()();

  DateTimeColumn get creadoEn => dateTime().withDefault(
        currentDateAndTime,
      )();
}

@DataClassName('CarpetaControlData')
class CarpetasControl extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get titulo => text()();

  DateTimeColumn get creadoEn => dateTime().withDefault(
        currentDateAndTime,
      )();
}

@DataClassName('ActividadControlData')
class ActividadesControl extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get carpetaControlId => integer().references(
        CarpetasControl,
        #id,
        onDelete: KeyAction.cascade,
      )();

  TextColumn get titulo => text()();

  DateTimeColumn get fecha => dateTime()();

  DateTimeColumn get creadoEn => dateTime().withDefault(
        currentDateAndTime,
      )();
}

@DataClassName('TarjaControlData')
class TarjasControl extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get actividadControlId => integer().references(
        ActividadesControl,
        #id,
        onDelete: KeyAction.cascade,
      )();

  TextColumn get tipo => text()();

  IntColumn get cantidad => integer()();

  DateTimeColumn get creadoEn => dateTime().withDefault(
        currentDateAndTime,
      )();
}

@DriftDatabase(
  tables: [
    ControlesPesaje,
    CategoriasPesaje,
    AnimalesPesaje,
    StockAnimales,
    CarpetasControl,
    ActividadesControl,
    TarjasControl
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator migrator) async {
        await migrator.createAll();
      },
      onUpgrade: (
        Migrator migrator,
        int from,
        int to,
      ) async {
        if (from < 2) {
          await migrator.createTable(stockAnimales);
        }

        if (from < 3) {
          await migrator.createTable(carpetasControl);
        }

        if (from < 4) {
          await migrator.createTable(actividadesControl);
        }
        if (from < 5) {
          await migrator.createTable(tarjasControl);
        }
      },
    );
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'agenda_ganadera',
    );
  }
}
