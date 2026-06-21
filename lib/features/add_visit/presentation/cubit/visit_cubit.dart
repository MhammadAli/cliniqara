import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/visit.dart';
import '../../domain/repositories/visit_repository.dart';
import 'visit_state.dart';

class VisitCubit extends Cubit<VisitState> {
  final VisitRepository repository;

  VisitCubit({required this.repository}) : super(VisitInitial());

  Future<void> fetchVisits(String patientId) async {
    emit(VisitLoading());
    final result = await repository.getVisitsForPatient(patientId);
    result.fold(
      (failure) => emit(const VisitError(message: 'Failed to fetch visits')),
      (visits) => emit(VisitLoaded(visits: visits)),
    );
  }

  Future<void> addVisit(Visit visit) async {
    emit(VisitLoading());
    final result = await repository.addVisit(visit);
    result.fold(
      (failure) => emit(const VisitError(message: 'Failed to add visit')),
      (_) {
        emit(VisitActionSuccess());
        // Reload visits for the patient
        fetchVisits(visit.patientId);
      },
    );
  }
}
