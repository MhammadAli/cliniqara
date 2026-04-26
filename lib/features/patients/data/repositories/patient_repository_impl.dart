import 'dart:convert';

import 'package:cliniqara/core/database/app_database.dart';
import 'package:cliniqara/features/patients/domain/entities/patient_entity.dart';
import 'package:cliniqara/features/patients/domain/entities/visit_entity.dart';
import 'package:cliniqara/features/patients/domain/repositories/patient_repository.dart';
import 'package:drift/drift.dart';

/// Concrete SQLite-backed implementation of [PatientRepository].
///
/// Mapping responsibility lives here: Drift-generated models ↔ domain entities.
/// All database access goes through the DAOs on [AppDatabase]; this class
/// never writes raw SQL.
class PatientRepositoryImpl implements PatientRepository {
  const PatientRepositoryImpl(this._db);

  final AppDatabase _db;

  // ─── Patients ──────────────────────────────────────────────────────────────

  @override
  Future<List<PatientEntity>> getAllPatients() async {
    final rows = await _db.patientsDao.getAllPatients();
    return rows.map(_mapPatient).toList();
  }

  @override
  Stream<List<PatientEntity>> watchAllPatients() =>
      _db.patientsDao.watchAllPatients().map(
            (rows) => rows.map(_mapPatient).toList(),
          );

  @override
  Future<PatientEntity?> getPatientById(String id) async {
    final row = await _db.patientsDao.getPatientById(id);
    return row == null ? null : _mapPatient(row);
  }

  @override
  Future<void> createPatient(PatientEntity patient) =>
      _db.patientsDao.insertPatient(
        PatientsCompanion(
          id: Value(patient.id),
          name: Value(patient.name),
          dateOfBirth: Value(patient.dateOfBirth),
          gender: Value(patient.gender),
          occupation: Value(patient.occupation),
          maritalStatus: Value(patient.maritalStatus),
          numberOfChildren: Value(patient.numberOfChildren),
          createdBy: Value(patient.createdBy),
          createdAt: Value(patient.createdAt),
        ),
      );

  @override
  Future<void> updatePatient(PatientEntity patient) =>
      _db.patientsDao.updatePatient(
        PatientsCompanion(
          id: Value(patient.id),
          name: Value(patient.name),
          dateOfBirth: Value(patient.dateOfBirth),
          gender: Value(patient.gender),
          occupation: Value(patient.occupation),
          maritalStatus: Value(patient.maritalStatus),
          numberOfChildren: Value(patient.numberOfChildren),
          createdBy: Value(patient.createdBy),
          createdAt: Value(patient.createdAt),
        ),
      );

  @override
  Future<void> deletePatient(String id) => _db.patientsDao.deletePatient(id);

  // ─── Visits ────────────────────────────────────────────────────────────────

  @override
  Future<List<VisitEntity>> getVisitsForPatient(String patientId) async {
    final rows = await _db.visitsDao.getVisitsForPatient(patientId);
    return rows.map(_mapVisit).toList();
  }

  @override
  Stream<List<VisitEntity>> watchVisitsForPatient(String patientId) =>
      _db.visitsDao.watchVisitsForPatient(patientId).map(
            (rows) => rows.map(_mapVisit).toList(),
          );

  /// Saves a complete visit, including the pre-serialised JSON payload.
  ///
  /// [visit.clinicalPayloadJson] must be valid JSON produced via
  /// `jsonEncode(payloadMap)` in the calling Cubit. An [ArgumentError] is
  /// thrown early if the string cannot be decoded, keeping invalid data out
  /// of the database.
  @override
  Future<void> createVisitWithPayload(VisitEntity visit) async {
    if (visit.clinicalPayloadJson != null) {
      try {
        jsonDecode(visit.clinicalPayloadJson!);
      } catch (_) {
        throw ArgumentError(
          'createVisitWithPayload: clinicalPayloadJson must be valid JSON. '
          'Use jsonEncode(map) before calling this method.',
        );
      }
    }

    await _db.visitsDao.insertVisitWithVitals(
      visitCompanion: VisitsCompanion.insert(
        id: visit.id,
        patientId: visit.patientId,
        visitDate: Value(visit.visitDate),
        mainComplaint: Value(visit.mainComplaint),
        createdBy: Value(visit.createdBy),
        clinicalPayloadJson: Value(visit.clinicalPayloadJson),
      ),
    );
  }

  @override
  Future<void> updateVisit(VisitEntity visit) =>
      _db.visitsDao.updateVisit(
        VisitsCompanion(
          id: Value(visit.id),
          patientId: Value(visit.patientId),
          visitDate: Value(visit.visitDate),
          mainComplaint: Value(visit.mainComplaint),
          createdBy: Value(visit.createdBy),
          clinicalPayloadJson: Value(visit.clinicalPayloadJson),
        ),
      );

  @override
  Future<void> deleteVisit(String visitId) =>
      _db.visitsDao.deleteVisit(visitId);

  // ─── Mappers ───────────────────────────────────────────────────────────────

  /// Converts a Drift-generated [Patient] row to a domain [PatientEntity].
  PatientEntity _mapPatient(Patient row) => PatientEntity(
        id: row.id,
        name: row.name,
        dateOfBirth: row.dateOfBirth,
        gender: row.gender,
        occupation: row.occupation,
        maritalStatus: row.maritalStatus,
        numberOfChildren: row.numberOfChildren,
        createdBy: row.createdBy,
        createdAt: row.createdAt,
      );

  /// Converts a Drift-generated [Visit] row to a domain [VisitEntity].
  VisitEntity _mapVisit(Visit row) => VisitEntity(
        id: row.id,
        patientId: row.patientId,
        visitDate: row.visitDate,
        mainComplaint: row.mainComplaint,
        clinicalPayloadJson: row.clinicalPayloadJson,
        createdBy: row.createdBy,
      );
}
