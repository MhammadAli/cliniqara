import 'package:cliniqara/features/patients/domain/entities/patient_entity.dart';
import 'package:cliniqara/features/patients/domain/entities/visit_entity.dart';

/// Domain contract for all patient and visit data operations.
///
/// The domain layer depends only on this interface and the pure entity classes
/// — never on Drift or SQLite. Swap the implementation in [di.dart] without
/// touching any feature or use-case code.
abstract interface class PatientRepository {
  // ─── Patients ──────────────────────────────────────────────────────────────

  /// Returns all patients, ordered by name.
  Future<List<PatientEntity>> getAllPatients();

  /// Watches all patients reactively. Emits on every insert/update/delete.
  Stream<List<PatientEntity>> watchAllPatients();

  /// Returns a single patient by UUID, or `null` if not found.
  Future<PatientEntity?> getPatientById(String id);

  /// Persists a new patient. [patient.id] must be a pre-generated UUID.
  Future<void> createPatient(PatientEntity patient);

  /// Replaces an existing patient row.
  Future<void> updatePatient(PatientEntity patient);

  /// Permanently removes a patient and all their visits.
  Future<void> deletePatient(String id);

  // ─── Visits ────────────────────────────────────────────────────────────────

  /// Returns all visits for [patientId], newest first.
  Future<List<VisitEntity>> getVisitsForPatient(String patientId);

  /// Watches visits for [patientId] reactively.
  Stream<List<VisitEntity>> watchVisitsForPatient(String patientId);

  /// Atomically saves a complete visit record.
  ///
  /// [visit.clinicalPayloadJson] must already be a JSON-encoded string.
  /// Use `jsonEncode(payloadMap)` in the Cubit before calling this method.
  ///
  /// On duplicate UUID (e.g., auto-save retry), the existing row is replaced.
  Future<void> createVisitWithPayload(VisitEntity visit);

  /// Updates the JSON payload of an existing visit (e.g., auto-save draft).
  Future<void> updateVisit(VisitEntity visit);

  /// Deletes a visit and its associated vitals.
  Future<void> deleteVisit(String visitId);
}
