import 'package:equatable/equatable.dart';
import 'personal_history.dart';
import 'chief_complaint.dart';
import 'hpi.dart';

class VisitDraft extends Equatable {
  final PersonalHistory? personalHistory;
  final ChiefComplaint? chiefComplaint;
  final Hpi? hpi;

  const VisitDraft({
    this.personalHistory,
    this.chiefComplaint,
    this.hpi,
  });

  // Validation Logic
  // Assuming a draft can only be submitted if it has at least the chief complaint
  bool get canSubmit {
    return chiefComplaint != null && chiefComplaint!.selectedComplaints.isNotEmpty;
  }

  VisitDraft copyWith({
    PersonalHistory? personalHistory,
    ChiefComplaint? chiefComplaint,
    Hpi? hpi,
  }) {
    return VisitDraft(
      personalHistory: personalHistory ?? this.personalHistory,
      chiefComplaint: chiefComplaint ?? this.chiefComplaint,
      hpi: hpi ?? this.hpi,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'personalHistory': personalHistory?.toJson(),
      'chiefComplaint': chiefComplaint?.toJson(),
      'hpi': hpi?.toJson(),
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
      hpi: json['hpi'] != null 
          ? Hpi.fromJson(json['hpi']) 
          : null,
    );
  }

  @override
  List<Object?> get props => [personalHistory, chiefComplaint, hpi];
}
