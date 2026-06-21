import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/patient_info_header_card.dart';
import '../widgets/chief_complaint_section.dart';
import '../widgets/hpi_section.dart';
import '../cubits/patient_info/patient_info_cubit.dart';
import '../cubits/patient_info/patient_info_state.dart';
import '../widgets/personal_history_section.dart';
import '../cubit/visit_cubit.dart';
import '../cubits/add_visit_form/add_visit_form_cubit.dart';
import '../cubits/add_visit_form/add_visit_form_state.dart';
import '../../domain/entities/visit.dart';
import 'package:uuid/uuid.dart';
import 'package:go_router/go_router.dart';
import '../cubit/visit_state.dart';

class AddVisitScreen extends StatefulWidget {
  final String patientId;

  const AddVisitScreen({super.key, required this.patientId});

  @override
  State<AddVisitScreen> createState() => _AddVisitScreenState();
}

class _AddVisitScreenState extends State<AddVisitScreen> {
  String _activeSection = 'Personal';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddVisitFormCubit(),
      child: BlocListener<VisitCubit, VisitState>(
        listener: (context, state) {
          if (state is VisitActionSuccess) {
            context.go('/');
          } else if (state is VisitError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.background,
        appBar: AppBar(
        title: const Text('Add Visit'),
        centerTitle: false,
        elevation: 0,
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.primary,
        titleSpacing: 24,
      ),
      body: BlocBuilder<PatientInfoCubit, PatientInfoState>(
        builder: (context, state) {
          if (state is PatientInfoLoading || state is PatientInfoInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PatientInfoError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: AppColors.error),
              ),
            );
          } else if (state is PatientInfoLoaded) {
            final patient = state.patient;
            final genderStr =
                patient.gender.name[0].toUpperCase() +
                patient.gender.name.substring(1);
            final ageUnitStr =
                patient.age.unit.name[0].toUpperCase() +
                patient.age.unit.name.substring(1);

            return SafeArea(
              child: BlocBuilder<AddVisitFormCubit, AddVisitFormState>(
                builder: (context, formState) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 800),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PatientInfoHeaderCard(
                          patientName: patient.fullName,
                          age: patient.age.value,
                          gender: genderStr,
                          ageUnit: ageUnitStr,
                          activeSection: _activeSection,
                          onSectionChanged: (section) {
                            setState(() {
                              _activeSection = section;
                            });
                          },
                        ),
                            const SizedBox(height: 24),
                            PersonalHistorySection(
                              initialData: formState.draft.personalHistory,
                              onChanged: (data) => context.read<AddVisitFormCubit>().updatePersonalHistory(data),
                            ),
                            const SizedBox(height: 16),
                            ChiefComplaintSection(
                              initialData: formState.draft.chiefComplaint,
                              onChanged: (data) => context.read<AddVisitFormCubit>().updateChiefComplaint(data),
                            ),
                            const SizedBox(height: 16),
                            HpiSection(
                              initialData: formState.draft.hpi,
                              onChanged: (data) => context.read<AddVisitFormCubit>().updateHpi(data),
                            ),
                            // const PrescriptionSection(), // uncomment when ready
                            const SizedBox(height: 32),
                            SizedBox(
                              width: double.infinity,
                              child: FilledButton(
                                style: FilledButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                                onPressed: formState.draft.canSubmit ? () {
                                  final visit = Visit(
                                    id: const Uuid().v4(),
                                    patientId: patient.id,
                                    visitDate: DateTime.now(),
                                    draft: formState.draft,
                                  );
                                  context.read<VisitCubit>().addVisit(visit);
                                } : null,
                                child: const Text('Submit Visit', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      ),
      ),
    );
  }
}
