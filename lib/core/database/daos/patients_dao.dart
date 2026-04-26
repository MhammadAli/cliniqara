import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/patients_table.dart';

part 'patients_dao.g.dart';

/// Data Access Object for all [Patients] table operations.
///
/// Keeps SQL logic out of repositories. Repositories call DAO methods;
/// they never access [AppDatabase] tables directly.
@DriftAccessor(tables: [Patients])
class PatientsDao extends DatabaseAccessor<AppDatabase> with _$PatientsDaoMixin {
  PatientsDao(super.db);

  // ─── Read ───────────────────────────────────────────────────────────────────

  /// Returns all patients ordered by name ascending.
  Future<List<Patient>> getAllPatients() =>
      (select(patients)..orderBy([(p) => OrderingTerm.asc(p.name)])).get();

  /// Watches all patients; emits a new list whenever a row changes.
  Stream<List<Patient>> watchAllPatients() =>
      (select(patients)..orderBy([(p) => OrderingTerm.asc(p.name)])).watch();

  /// Returns a single patient by [id], or `null` if not found.
  Future<Patient?> getPatientById(String id) =>
      (select(patients)..where((p) => p.id.equals(id))).getSingleOrNull();

  // ─── Write ──────────────────────────────────────────────────────────────────

  /// Inserts a new patient. Throws [SqliteException] on duplicate UUID.
  Future<void> insertPatient(PatientsCompanion companion) =>
      into(patients).insert(companion);

  /// Updates an existing patient row. Returns the number of rows affected.
  Future<bool> updatePatient(PatientsCompanion companion) =>
      update(patients).replace(companion);

  /// Deletes a patient by [id]. Returns rows deleted (0 or 1).
  Future<int> deletePatient(String id) =>
      (delete(patients)..where((p) => p.id.equals(id))).go();
}
