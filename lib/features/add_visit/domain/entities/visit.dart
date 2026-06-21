import 'package:equatable/equatable.dart';

class Visit extends Equatable {
  final String id;
  final String patientId;
  final DateTime visitDate;
  final Map<String, dynamic> extraData; // For prescriptions, chief complaint, etc.

  const Visit({
    required this.id,
    required this.patientId,
    required this.visitDate,
    this.extraData = const {},
  });

  Visit copyWith({
    String? id,
    String? patientId,
    DateTime? visitDate,
    Map<String, dynamic>? extraData,
  }) {
    return Visit(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      visitDate: visitDate ?? this.visitDate,
      extraData: extraData ?? Map.from(this.extraData),
    );
  }

  @override
  List<Object?> get props => [id, patientId, visitDate, extraData];
}
