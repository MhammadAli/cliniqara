import 'package:drift/drift.dart';

part 'app_database.g.dart';

@DataClassName('PatientModel')
class Patients extends Table {
  TextColumn get id => text()();
  TextColumn get fullName => text()();
  IntColumn get ageValue => integer()();
  TextColumn get ageUnit => text()();
  TextColumn get gender => text()();
  TextColumn get phoneNumber => text().nullable()();
  TextColumn get extraData => text().withDefault(const Constant('{}'))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('VisitModel')
class Visits extends Table {
  TextColumn get id => text()();
  TextColumn get patientId => text().references(Patients, #id)();
  DateTimeColumn get visitDate => dateTime()();
  TextColumn get extraData => text().withDefault(const Constant('{}'))();

  @override
  Set<Column> get primaryKey => {id};
}


@DriftDatabase(tables: [Patients, Visits])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) => m.createAll(),
        onUpgrade: (Migrator m, int from, int to) async {
          if (from < 2) {
            await m.createTable(visits);
          }
        },
      );
}
