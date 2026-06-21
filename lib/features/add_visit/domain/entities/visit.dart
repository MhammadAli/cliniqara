import 'package:equatable/equatable.dart';

import 'visit_draft.dart';

class Visit extends Equatable {
  final String id;
  final String patientId;
  final DateTime visitDate;
  final VisitDraft draft;

  const Visit({
    required this.id,
    required this.patientId,
    required this.visitDate,
    this.draft = const VisitDraft(),
  });

  Visit copyWith({
    String? id,
    String? patientId,
    DateTime? visitDate,
    VisitDraft? draft,
  }) {
    return Visit(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      visitDate: visitDate ?? this.visitDate,
      draft: draft ?? this.draft,
    );
  }

  @override
  List<Object?> get props => [id, patientId, visitDate, draft];
}
