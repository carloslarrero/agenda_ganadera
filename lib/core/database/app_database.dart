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

@DriftDatabase(
  tables: [
    ControlesPesaje,
    CategoriasPesaje,
    AnimalesPesaje,
    StockAnimales,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// Antes era 1.
  /// Ahora es 2 porque agregamos la tabla StockAnimales.
  @override
  int get schemaVersion => 2;

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
      },
    );
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'agenda_ganadera',
    );
  }
}
