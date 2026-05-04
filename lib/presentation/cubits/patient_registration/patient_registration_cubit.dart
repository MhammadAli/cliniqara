import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../../domain/entities/patient.dart';
import '../../../domain/repositories/patient_repository.dart';
import 'patient_registration_state.dart';

class PatientRegistrationCubit extends Cubit<PatientRegistrationState> {
  final PatientRepository repository;

  PatientRegistrationCubit({required this.repository})
    : super(const PatientRegistrationInitial());

  Future<void> submitRegistration({
    required String fullName,
    required int ageValue,
    required AgeUnit ageUnit,
    required Gender gender,
    String? phoneNumber,
  }) async {
    emit(const PatientRegistrationLoading());

    const uuid = Uuid();
    final patient = Patient(
      id: uuid.v4(),
      fullName: fullName,
      age: PatientAge(value: ageValue, unit: ageUnit),
      gender: gender,
      phoneNumber: phoneNumber,
      extraData: const {},
    );

    final result = await repository.registerPatient(patient);

    result.fold(
      (failure) => emit(PatientRegistrationError(failure.message)),
      (_) => emit(const PatientRegistrationSuccess()),
    );
  }
}
