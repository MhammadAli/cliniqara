import 'package:equatable/equatable.dart';

/// Pure domain entity for a clinical visit.
///
/// No Drift dependency — safe to import in any layer.
/// [clinicalPayloadJson] holds the full OSCE form data as a JSON string
/// (the hybrid storage strategy). Serialise with `jsonEncode(map)` in the
/// Cubit before calling [PatientRepository.createVisitWithPayload].
class VisitEntity extends Equatable {
  const VisitEntity({
    required this.id,
    required this.patientId,
    required this.visitDate,
    this.mainComplaint,
    this.clinicalPayloadJson,
    this.createdBy = 'local_doctor',
  });

  // ─── Fields ─────────────────────────────────────────────────────────────────

  /// UUID v4 string.
  final String id;

  /// UUID of the associated [PatientEntity].
  final String patientId;
  final DateTime visitDate;
  final String? mainComplaint;

  /// JSON-encoded OSCE payload (HPI, Systems Review, Physical Exam, etc.).
  /// Null until the form is first saved.
  final String? clinicalPayloadJson;
  final String createdBy;

  // ─── Factory ─────────────────────────────────────────────────────────────────

  factory VisitEntity.create({
    required String id,
    required String patientId,
    String? mainComplaint,
    String? clinicalPayloadJson,
    String createdBy = 'local_doctor',
  }) {
    return VisitEntity(
      id: id,
      patientId: patientId,
      visitDate: DateTime.now(),
      mainComplaint: mainComplaint,
      clinicalPayloadJson: clinicalPayloadJson,
      createdBy: createdBy,
    );
  }

  // ─── CopyWith ────────────────────────────────────────────────────────────────

  VisitEntity copyWith({
    String? mainComplaint,
    String? clinicalPayloadJson,
  }) {
    return VisitEntity(
      id: id,
      patientId: patientId,
      visitDate: visitDate,
      mainComplaint: mainComplaint ?? this.mainComplaint,
      clinicalPayloadJson: clinicalPayloadJson ?? this.clinicalPayloadJson,
      createdBy: createdBy,
    );
  }

  @override
  List<Object?> get props => [
        id,
        patientId,
        visitDate,
        mainComplaint,
        clinicalPayloadJson,
        createdBy,
      ];
}
