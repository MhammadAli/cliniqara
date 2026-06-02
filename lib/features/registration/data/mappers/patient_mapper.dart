import 'dart:convert';
import 'package:drift/drift.dart';
import '../../domain/entities/patient.dart';
import '../datasources/local/app_database.dart';

extension PatientModelMapper on PatientModel {
  Patient toDomain() {
    return Patient(
      id: id,
      fullName: fullName,
      age: PatientAge(
        value: ageValue,
        unit: AgeUnit.values.firstWhere(
          (e) => e.name == ageUnit,
          orElse: () => AgeUnit.years,
        ),
      ),
      gender: Gender.values.firstWhere((e) => e.name == gender),
      phoneNumber: phoneNumber,
      extraData: jsonDecode(extraData) as Map<String, dynamic>,
    );
  }
}

extension PatientMapper on Patient {
  PatientsCompanion toCompanion() {
    return PatientsCompanion(
      id: Value(id),
      fullName: Value(fullName),
      ageValue: Value(age.value),
      ageUnit: Value(age.unit.name),
      gender: Value(gender.name),
      phoneNumber: Value(phoneNumber),
      extraData: Value(jsonEncode(extraData)),
    );
  }
}
