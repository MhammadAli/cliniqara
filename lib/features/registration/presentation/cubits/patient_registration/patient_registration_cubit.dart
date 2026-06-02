import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../../domain/entities/patient.dart';
import '../../../domain/repositories/patient_repository.dart';
import 'patient_registration_state.dart';

class PatientRegistrationCubit extends Cubit<PatientRegistrationState> {
  PatientRegistrationCubit({required this.repository})
    : super(const PatientRegistrationInitial());

  final PatientRepository repository;

  // ── Form field mutations ──────────────────────────────────────────────────

  void ageUnitChanged(AgeUnit unit) {
    final current = state;
    if (current is PatientRegistrationInitial) {
      emit(current.copyWith(selectedAgeUnit: unit));
    }
  }

  void genderChanged(Gender gender) {
    final current = state;
    if (current is PatientRegistrationInitial) {
      emit(current.copyWith(selectedGender: gender));
    }
  }

  // ── Submission (validation lives here, not in the UI) ────────────────────

  Future<void> submitRegistration({
    required String fullName,
    required String ageRaw,
    required String phoneRaw,
  }) async {
    final current = state;
    if (current is! PatientRegistrationInitial) return;

    if (fullName.trim().isEmpty) {
      emit(const PatientRegistrationError('Please enter the patient name.'));
      emit(current); // revert so form stays editable
      return;
    }

    if (ageRaw.trim().isEmpty) {
      emit(const PatientRegistrationError('Please enter the patient age.'));
      emit(current);
      return;
    }

    final ageValue = int.tryParse(ageRaw.trim());
    if (ageValue == null) {
      emit(const PatientRegistrationError('Please enter a valid age number.'));
      emit(current);
      return;
    }

    if (current.selectedGender == null) {
      emit(const PatientRegistrationError('Please select a gender.'));
      emit(current);
      return;
    }

    emit(const PatientRegistrationLoading());

    const uuid = Uuid();
    final patient = Patient(
      id: uuid.v4(),
      fullName: fullName.trim(),
      age: PatientAge(value: ageValue, unit: current.selectedAgeUnit),
      gender: current.selectedGender!,
      phoneNumber: phoneRaw.trim().isEmpty ? null : phoneRaw.trim(),
      extraData: const {},
    );

    final result = await repository.registerPatient(patient);

    result.fold(
      (failure) => emit(PatientRegistrationError(failure.message)),
      (_) => emit(PatientRegistrationSuccess(patientId: patient.id)),
    );
  }
}
