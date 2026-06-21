import 'package:equatable/equatable.dart';
import '../../../domain/entities/visit_draft.dart';

class AddVisitFormState extends Equatable {
  final VisitDraft draft;

  const AddVisitFormState({
    this.draft = const VisitDraft(),
  });

  AddVisitFormState copyWith({
    VisitDraft? draft,
  }) {
    return AddVisitFormState(
      draft: draft ?? this.draft,
    );
  }

  @override
  List<Object?> get props => [draft];
}
