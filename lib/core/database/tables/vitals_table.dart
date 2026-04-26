import 'package:drift/drift.dart';

import 'package:cliniqara/core/database/tables/visits_table.dart';

/// Drift table for vital signs.
///
/// Kept separate from [Visits] so vitals can be queried and trended
/// independently (e.g., BP history chart) without parsing JSON.
@DataClassName('VitalSign')
class Vitals extends Table {
  TextColumn get id => text()(); // UUID
  TextColumn get visitId => text().references(Visits, #id)();
  IntColumn get bpSystolic => integer().nullable()();
  IntColumn get bpDiastolic => integer().nullable()();
  IntColumn get heartRate => integer().nullable()();
  RealColumn get temperature => real().nullable()();
  IntColumn get respiratoryRate => integer().nullable()();
  IntColumn get spo2 => integer().nullable()();
  RealColumn get bloodGlucose => real().nullable()();
  TextColumn get glucoseUnit => text().nullable()(); // 'mg/dL' or 'mmol/L'
  RealColumn get weight => real().nullable()();
  RealColumn get height => real().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
