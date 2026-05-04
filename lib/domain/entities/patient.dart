import 'package:equatable/equatable.dart';

enum AgeUnit { years, months, days }

enum Gender { male, female }

class PatientAge extends Equatable {
  final int value;
  final AgeUnit unit;

  const PatientAge({required this.value, required this.unit});

  @override
  List<Object?> get props => [value, unit];
}

class Patient extends Equatable {
  final String id;
  final String fullName;
  final PatientAge age;
  final Gender gender;
  final String? phoneNumber;
  final Map<String, dynamic> extraData;

  const Patient({
    required this.id,
    required this.fullName,
    required this.age,
    required this.gender,
    this.phoneNumber,
    this.extraData = const {},
  });

  Patient copyWith({
    String? id,
    String? fullName,
    PatientAge? age,
    Gender? gender,
    String? phoneNumber,
    Map<String, dynamic>? extraData,
  }) {
    return Patient(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      // Create a new map if it was updated to ensure value distinctness
      extraData: extraData ?? Map.from(this.extraData),
    );
  }

  @override
  List<Object?> get props => [
    id,
    fullName,
    age,
    gender,
    phoneNumber,
    extraData,
  ];
}
