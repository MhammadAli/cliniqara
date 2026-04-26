import 'package:drift/drift.dart';

/// Drift table definition for patients.
///
/// All IDs are UUIDs (text) to support future cloud synchronisation.
/// The [primaryKey] override is used instead of `autoIncrement()` because
/// UUIDs are assigned in Dart before insertion.
@DataClassName('Patient')
class Patients extends Table {
  TextColumn get id => text()(); // UUID
  TextColumn get name => text()();
  DateTimeColumn get dateOfBirth => dateTime()();
  TextColumn get gender => text()();
  TextColumn get occupation => text().nullable()();
  TextColumn get maritalStatus => text().nullable()();
  IntColumn get numberOfChildren => integer().nullable()();
  TextColumn get createdBy =>
      text().withDefault(const Constant('local_doctor'))();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
