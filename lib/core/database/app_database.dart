import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'daos/patients_dao.dart';
import 'daos/visits_dao.dart';
import 'tables/immunizations_table.dart';
import 'tables/patients_table.dart';
import 'tables/visits_table.dart';
import 'tables/vitals_table.dart';

part 'app_database.g.dart';

/// The single Drift [GeneratedDatabase] for Cliniqara.
///
/// Registered as a singleton in GetIt ([di.dart]). Always access it via DI,
/// never construct it directly in feature code.
///
/// Schema version history:
///   v1 — Initial schema: Patients, Visits, Vitals, Immunizations.
@DriftDatabase(
  tables: [Patients, Visits, Vitals, Immunizations],
  daos: [PatientsDao, VisitsDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// Bump this when you add or change a table. Add a migration in
  /// [migration] below.
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          // Add future ALTER TABLE statements here as schemaVersion grows.
        },
      );
}

/// Opens (or creates) the SQLite database file in the app's documents dir.
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final File file = File(p.join(dir.path, 'cliniqara.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
