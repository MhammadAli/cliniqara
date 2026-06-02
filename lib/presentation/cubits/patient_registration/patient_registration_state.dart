import 'package:equatable/equatable.dart';
import '../../../domain/entities/patient.dart';

abstract class PatientRegistrationState extends Equatable {
  const PatientRegistrationState();

  @override
  List<Object?> get props => [];
}

class PatientRegistrationInitial extends PatientRegistrationState {
  const PatientRegistrationInitial({
    this.selectedAgeUnit = AgeUnit.years,
    this.selectedGender,
  });

  final AgeUnit selectedAgeUnit;
  final Gender? selectedGender;

  PatientRegistrationInitial copyWith({
    AgeUnit? selectedAgeUnit,
    Gender? selectedGender,
  }) => PatientRegistrationInitial(
    selectedAgeUnit: selectedAgeUnit ?? this.selectedAgeUnit,
    selectedGender: selectedGender ?? this.selectedGender,
  );

  @override
  List<Object?> get props => [selectedAgeUnit, selectedGender];
}

class PatientRegistrationLoading extends PatientRegistrationState {
  const PatientRegistrationLoading();
}

class PatientRegistrationSuccess extends PatientRegistrationState {
  const PatientRegistrationSuccess();
}

class PatientRegistrationError extends PatientRegistrationState {
  const PatientRegistrationError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
