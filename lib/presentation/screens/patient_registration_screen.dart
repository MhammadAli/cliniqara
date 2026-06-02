import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/patient.dart';
import '../cubits/patient_registration/patient_registration_cubit.dart';
import '../cubits/patient_registration/patient_registration_state.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/age_input_row.dart';
import '../widgets/gender_selection_row.dart';
import '../widgets/section_header.dart'; // extracted widget (Fix 3)
import '../../core/theme/app_colors.dart';

class PatientRegistrationScreen extends StatefulWidget {
  const PatientRegistrationScreen({super.key});

  @override
  State<PatientRegistrationScreen> createState() =>
      _PatientRegistrationScreenState();
}

// Controllers are lifecycle-bound to the widget tree — keeping StatefulWidget
// solely for dispose() is the accepted Flutter pattern when using raw
// TextEditingControllers. All business state lives in the Cubit.
class _PatientRegistrationScreenState extends State<PatientRegistrationScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _showSnackBar(
    BuildContext context,
    String message, {
    bool isError = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? AppColors.error : AppColors.secondary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Cliniqara'),
        centerTitle: false,
        elevation: 0,
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.primary,
        titleSpacing: 24,
      ),
      body: BlocConsumer<PatientRegistrationCubit, PatientRegistrationState>(
        listener: (context, state) {
          if (state is PatientRegistrationError) {
            _showSnackBar(context, state.message, isError: true);
          } else if (state is PatientRegistrationSuccess) {
            _showSnackBar(context, 'Patient registered successfully.');
            /* TODO: context.go('/dashboard') */
          }
        },
        builder: (context, state) {
          final cubit = context.read<PatientRegistrationCubit>();
          final isLoading = state is PatientRegistrationLoading;

          // Read form field values from state; fall back to defaults when
          // state is not PatientRegistrationInitial (e.g. Loading).
          final formState = state is PatientRegistrationInitial ? state : null;
          final selectedAgeUnit = formState?.selectedAgeUnit ?? AgeUnit.years;
          final selectedGender = formState?.selectedGender;

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.border),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: .05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'New Patient Registration',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Please fill in the patient\'s basic information.',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: AppColors.textTertiary,
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Name
                        const SectionHeader(
                          title: 'Patient Name',
                          isRequired: true,
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: _nameController,
                          hintText: 'Enter full name',
                        ),
                        const SizedBox(height: 24),

                        // Age
                        const SectionHeader(title: 'Age', isRequired: true),
                        const SizedBox(height: 8),
                        AgeInputRow(
                          controller: _ageController,
                          selectedUnit: selectedAgeUnit,
                          onUnitChanged: isLoading
                              ? (_) {}
                              : cubit.ageUnitChanged,
                        ),
                        const SizedBox(height: 24),

                        // Gender
                        const SectionHeader(title: 'Gender', isRequired: true),
                        const SizedBox(height: 8),
                        GenderSelectionRow(
                          selectedGender: selectedGender,
                          onGenderChanged: isLoading
                              ? (_) {}
                              : cubit.genderChanged,
                        ),
                        const SizedBox(height: 24),

                        // Phone Number
                        const SectionHeader(title: 'Phone Number (Optional)'),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: _phoneController,
                          hintText: 'e.g. +20 123 456 7890',
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 48),

                        // Next Button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: FilledButton(
                            onPressed: isLoading
                                ? null
                                : () => cubit.submitRegistration(
                                    fullName: _nameController.text,
                                    ageRaw: _ageController.text,
                                    phoneRaw: _phoneController.text,
                                  ),
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: isLoading
                                ? SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      // Fix 2: replaced Colors.white with theme token
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        theme.colorScheme.onPrimary,
                                      ),
                                    ),
                                  )
                                : const Text(
                                    'Next',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
