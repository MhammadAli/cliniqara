import 'package:equatable/equatable.dart';
import 'personal_history.dart';
import 'chief_complaint.dart';

class VisitDraft extends Equatable {
  final PersonalHistory? personalHistory;
  final ChiefComplaint? chiefComplaint;

  const VisitDraft({
    this.personalHistory,
    this.chiefComplaint,
  });

  // Validation Logic
  // Assuming a draft can only be submitted if it has at least the chief complaint
  bool get canSubmit {
    return chiefComplaint != null && chiefComplaint!.selectedComplaints.isNotEmpty;
  }

  VisitDraft copyWith({
    PersonalHistory? personalHistory,
    ChiefComplaint? chiefComplaint,
  }) {
    return VisitDraft(
      personalHistory: personalHistory ?? this.personalHistory,
      chiefComplaint: chiefComplaint ?? this.chiefComplaint,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'personalHistory': personalHistory?.toJson(),
      'chiefComplaint': chiefComplaint?.toJson(),
    };
  }

  factory VisitDraft.fromJson(Map<String, dynamic> json) {
    return VisitDraft(
      personalHistory: json['personalHistory'] != null 
          ? PersonalHistory.fromJson(json['personalHistory']) 
          : null,
      chiefComplaint: json['chiefComplaint'] != null 
          ? ChiefComplaint.fromJson(json['chiefComplaint']) 
          : null,
    );
  }

  @override
  List<Object?> get props => [personalHistory, chiefComplaint];
}
