import 'package:drift/drift.dart';

import 'patients_table.dart';

/// Drift table for immunization records.
///
/// Linked to [Patients] (not visits) because vaccination history belongs
/// to the patient's lifetime record, not a single visit.
@DataClassName('ImmunizationRecord')
class Immunizations extends Table {
  TextColumn get id => text()(); // UUID
  TextColumn get patientId => text().references(Patients, #id)();
  TextColumn get vaccineName => text()();
  TextColumn get status => text()(); // 'Taken', 'Not Taken', 'Unknown'
  DateTimeColumn get dateGiven => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
