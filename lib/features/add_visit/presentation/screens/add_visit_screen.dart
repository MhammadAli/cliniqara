import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/patient_info_header_card.dart';
import '../cubits/patient_info/patient_info_cubit.dart';
import '../cubits/patient_info/patient_info_state.dart';

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
    return Scaffold(
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
              child: SingleChildScrollView(
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
                        // Content for the active section will go here
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
