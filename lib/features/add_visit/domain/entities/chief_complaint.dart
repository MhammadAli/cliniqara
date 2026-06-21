import 'package:equatable/equatable.dart';

class ChiefComplaint extends Equatable {
  final String? mainComplaint;
  final int? duration;
  final String? durationUnit;
  final List<String> selectedComplaints;

  const ChiefComplaint({
    this.mainComplaint,
    this.duration,
    this.durationUnit,
    this.selectedComplaints = const [],
  });

  ChiefComplaint copyWith({
    String? mainComplaint,
    int? duration,
    String? durationUnit,
    List<String>? selectedComplaints,
  }) {
    return ChiefComplaint(
      mainComplaint: mainComplaint ?? this.mainComplaint,
      duration: duration ?? this.duration,
      durationUnit: durationUnit ?? this.durationUnit,
      selectedComplaints: selectedComplaints ?? this.selectedComplaints,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mainComplaint': mainComplaint,
      'duration': duration,
      'durationUnit': durationUnit,
      'selectedComplaints': selectedComplaints,
    };
  }

  factory ChiefComplaint.fromJson(Map<String, dynamic> json) {
    return ChiefComplaint(
      mainComplaint: json['mainComplaint'] as String?,
      duration: json['duration'] as int?,
      durationUnit: json['durationUnit'] as String?,
      selectedComplaints: (json['selectedComplaints'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
    );
  }

  @override
  List<Object?> get props => [mainComplaint, duration, durationUnit, selectedComplaints];
}
