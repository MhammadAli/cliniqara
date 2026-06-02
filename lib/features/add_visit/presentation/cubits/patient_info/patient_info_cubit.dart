import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../registration/domain/repositories/patient_repository.dart';
import 'patient_info_state.dart';

class PatientInfoCubit extends Cubit<PatientInfoState> {
  final PatientRepository repository;

  PatientInfoCubit({required this.repository}) : super(PatientInfoInitial());

  Future<void> fetchPatientInfo(String patientId) async {
    emit(PatientInfoLoading());

    final result = await repository.getPatientById(patientId);

    result.fold(
      (failure) => emit(PatientInfoError(failure.message)),
      (patient) => emit(PatientInfoLoaded(patient)),
    );
  }
}
