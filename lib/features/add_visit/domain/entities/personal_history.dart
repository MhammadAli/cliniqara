import 'package:equatable/equatable.dart';

class PersonalHistory extends Equatable {
  final String? occupation;
  final String? maritalStatus;
  final int? numberOfChildren;
  final String? residence;
  final String? smokingStatus;
  final int? cigarettesPerDay;
  final int? yearsSmoked;
  final String? alcoholStatus;
  final String? alcoholFrequency;
  final String? informant;
  final String? historyReliability;
  final List<String> specialHabits;
  final String? typeOfDrug;
  final String? otherHabitDescription;

  const PersonalHistory({
    this.occupation,
    this.maritalStatus,
    this.numberOfChildren,
    this.residence,
    this.smokingStatus,
    this.cigarettesPerDay,
    this.yearsSmoked,
    this.alcoholStatus,
    this.alcoholFrequency,
    this.informant,
    this.historyReliability,
    this.specialHabits = const [],
    this.typeOfDrug,
    this.otherHabitDescription,
  });

  PersonalHistory copyWith({
    String? occupation,
    String? maritalStatus,
    int? numberOfChildren,
    String? residence,
    String? smokingStatus,
    int? cigarettesPerDay,
    int? yearsSmoked,
    String? alcoholStatus,
    String? alcoholFrequency,
    String? informant,
    String? historyReliability,
    List<String>? specialHabits,
    String? typeOfDrug,
    String? otherHabitDescription,
  }) {
    return PersonalHistory(
      occupation: occupation ?? this.occupation,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      numberOfChildren: numberOfChildren ?? this.numberOfChildren,
      residence: residence ?? this.residence,
      smokingStatus: smokingStatus ?? this.smokingStatus,
      cigarettesPerDay: cigarettesPerDay ?? this.cigarettesPerDay,
      yearsSmoked: yearsSmoked ?? this.yearsSmoked,
      alcoholStatus: alcoholStatus ?? this.alcoholStatus,
      alcoholFrequency: alcoholFrequency ?? this.alcoholFrequency,
      informant: informant ?? this.informant,
      historyReliability: historyReliability ?? this.historyReliability,
      specialHabits: specialHabits ?? this.specialHabits,
      typeOfDrug: typeOfDrug ?? this.typeOfDrug,
      otherHabitDescription: otherHabitDescription ?? this.otherHabitDescription,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'occupation': occupation,
      'maritalStatus': maritalStatus,
      'numberOfChildren': numberOfChildren,
      'residence': residence,
      'smokingStatus': smokingStatus,
      'cigarettesPerDay': cigarettesPerDay,
      'yearsSmoked': yearsSmoked,
      'alcoholStatus': alcoholStatus,
      'alcoholFrequency': alcoholFrequency,
      'informant': informant,
      'historyReliability': historyReliability,
      'specialHabits': specialHabits,
      'typeOfDrug': typeOfDrug,
      'otherHabitDescription': otherHabitDescription,
    };
  }

  factory PersonalHistory.fromJson(Map<String, dynamic> json) {
    return PersonalHistory(
      occupation: json['occupation'] as String?,
      maritalStatus: json['maritalStatus'] as String?,
      numberOfChildren: json['numberOfChildren'] as int?,
      residence: json['residence'] as String?,
      smokingStatus: json['smokingStatus'] as String?,
      cigarettesPerDay: json['cigarettesPerDay'] as int?,
      yearsSmoked: json['yearsSmoked'] as int?,
      alcoholStatus: json['alcoholStatus'] as String?,
      alcoholFrequency: json['alcoholFrequency'] as String?,
      informant: json['informant'] as String?,
      historyReliability: json['historyReliability'] as String?,
      specialHabits: (json['specialHabits'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      typeOfDrug: json['typeOfDrug'] as String?,
      otherHabitDescription: json['otherHabitDescription'] as String?,
    );
  }

  @override
  List<Object?> get props => [
        occupation,
        maritalStatus,
        numberOfChildren,
        residence,
        smokingStatus,
        cigarettesPerDay,
        yearsSmoked,
        alcoholStatus,
        alcoholFrequency,
        informant,
        historyReliability,
        specialHabits,
        typeOfDrug,
        otherHabitDescription,
      ];
}
