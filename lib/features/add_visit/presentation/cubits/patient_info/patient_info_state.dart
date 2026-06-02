import 'package:equatable/equatable.dart';
import '../../../../registration/domain/entities/patient.dart';

abstract class PatientInfoState extends Equatable {
  const PatientInfoState();

  @override
  List<Object?> get props => [];
}

class PatientInfoInitial extends PatientInfoState {}

class PatientInfoLoading extends PatientInfoState {}

class PatientInfoLoaded extends PatientInfoState {
  final Patient patient;

  const PatientInfoLoaded(this.patient);

  @override
  List<Object?> get props => [patient];
}

class PatientInfoError extends PatientInfoState {
  final String message;

  const PatientInfoError(this.message);

  @override
  List<Object?> get props => [message];
}
