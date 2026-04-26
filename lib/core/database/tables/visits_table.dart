import 'package:drift/drift.dart';

import 'package:cliniqara/core/database/tables/patients_table.dart';

/// Drift table definition for clinical visits.
///
/// HYBRID STORAGE: The massive dynamic OSCE data (HPI, Systems Review,
/// Physical Exam findings) is stored as a JSON string in [clinicalPayloadJson]
/// to avoid a 200+ column table. Structured, queryable fields (vitals) live
/// in the separate [Vitals] table.
@DataClassName('Visit')
class Visits extends Table {
  TextColumn get id => text()(); // UUID
  TextColumn get patientId => text().references(Patients, #id)();
  DateTimeColumn get visitDate => dateTime().withDefault(currentDateAndTime)();
  TextColumn get mainComplaint => text().nullable()();
  TextColumn get createdBy =>
      text().withDefault(const Constant('local_doctor'))();

  /// JSON blob containing all dynamic OSCE section data.
  TextColumn get clinicalPayloadJson => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
