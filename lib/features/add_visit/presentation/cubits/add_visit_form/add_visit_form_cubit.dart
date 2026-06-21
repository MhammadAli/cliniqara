import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/personal_history.dart';
import '../../../domain/entities/chief_complaint.dart';
import '../../../domain/entities/hpi.dart';
import 'add_visit_form_state.dart';

class AddVisitFormCubit extends Cubit<AddVisitFormState> {
  AddVisitFormCubit() : super(const AddVisitFormState());

  void updatePersonalHistory(PersonalHistory history) {
    emit(
      state.copyWith(
        draft: state.draft.copyWith(
          personalHistory: history,
        ),
      ),
    );
  }

  void updateChiefComplaint(ChiefComplaint complaint) {
    emit(
      state.copyWith(
        draft: state.draft.copyWith(
          chiefComplaint: complaint,
        ),
      ),
    );
  }

  void updateHpi(Hpi hpi) {
    emit(
      state.copyWith(
        draft: state.draft.copyWith(
          hpi: hpi,
        ),
      ),
    );
  }
}
