import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/visits_table.dart';
import '../tables/vitals_table.dart';

part 'visits_dao.g.dart';

/// Data Access Object for [Visits] and [Vitals] table operations.
///
/// Visits and Vitals are always created/queried together, so they share
/// a single DAO to keep the transaction logic co-located.
@DriftAccessor(tables: [Visits, Vitals])
class VisitsDao extends DatabaseAccessor<AppDatabase> with _$VisitsDaoMixin {
  VisitsDao(super.db);

  // ─── Read ───────────────────────────────────────────────────────────────────

  /// Returns all visits for a given [patientId], most recent first.
  Future<List<Visit>> getVisitsForPatient(String patientId) =>
      (select(visits)
            ..where((v) => v.patientId.equals(patientId))
            ..orderBy([(v) => OrderingTerm.desc(v.visitDate)]))
          .get();

  /// Watches visits for a patient in real-time.
  Stream<List<Visit>> watchVisitsForPatient(String patientId) =>
      (select(visits)
            ..where((v) => v.patientId.equals(patientId))
            ..orderBy([(v) => OrderingTerm.desc(v.visitDate)]))
          .watch();

  /// Returns a single visit by [id], or `null` if not found.
  Future<Visit?> getVisitById(String id) =>
      (select(visits)..where((v) => v.id.equals(id))).getSingleOrNull();

  /// Returns the vitals record for a given [visitId], or `null`.
  Future<VitalSign?> getVitalsForVisit(String visitId) =>
      (select(vitals)..where((v) => v.visitId.equals(visitId)))
          .getSingleOrNull();

  // ─── Write ──────────────────────────────────────────────────────────────────

  /// Atomically inserts a visit and its associated vitals.
  ///
  /// Both inserts are wrapped in a [transaction] so that a failure in either
  /// leaves the database in a consistent state.
  Future<void> insertVisitWithVitals({
    required VisitsCompanion visitCompanion,
    VitalsCompanion? vitalsCompanion,
  }) =>
      transaction(() async {
        await into(visits).insert(visitCompanion);
        if (vitalsCompanion != null) {
          await into(vitals).insert(vitalsCompanion);
        }
      });

  /// Updates an existing visit row (e.g., to patch the JSON payload).
  Future<bool> updateVisit(VisitsCompanion companion) =>
      update(visits).replace(companion);

  /// Deletes a visit and its vitals (cascade via FK, but explicit for safety).
  Future<void> deleteVisit(String visitId) => transaction(() async {
        await (delete(vitals)..where((v) => v.visitId.equals(visitId))).go();
        await (delete(visits)..where((v) => v.id.equals(visitId))).go();
      });
}
