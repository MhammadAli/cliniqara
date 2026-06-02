import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/patient.dart';
import '../cubits/patient_registration/patient_registration_cubit.dart';
import '../cubits/patient_registration/patient_registration_state.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/age_input_row.dart';
import '../widgets/gender_selection_row.dart';
import '../../core/theme/app_colors.dart';

class PatientRegistrationScreen extends StatefulWidget {
  const PatientRegistrationScreen({super.key});

  @override
  State<PatientRegistrationScreen> createState() =>
      _PatientRegistrationScreenState();
}

class _PatientRegistrationScreenState extends State<PatientRegistrationScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneController = TextEditingController();

  AgeUnit _selectedAgeUnit = AgeUnit.years;
  Gender? _selectedGender;

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    if (_nameController.text.trim().isEmpty) {
      _showSnackBar(context, 'Please enter the patient name.', isError: true);
      return;
    }

    if (_ageController.text.trim().isEmpty) {
      _showSnackBar(context, 'Please enter the patient age.', isError: true);
      return;
    }

    if (_selectedGender == null) {
      _showSnackBar(context, 'Please select a gender.', isError: true);
      return;
    }

    final ageValue = int.tryParse(_ageController.text.trim());
    if (ageValue == null) {
      _showSnackBar(context, 'Please enter a valid age number.', isError: true);
      return;
    }

    context.read<PatientRegistrationCubit>().submitRegistration(
      fullName: _nameController.text.trim(),
      ageValue: ageValue,
      ageUnit: _selectedAgeUnit,
      gender: _selectedGender!,
      phoneNumber: _phoneController.text.trim().isEmpty
          ? null
          : _phoneController.text.trim(),
    );
  }

  void _showSnackBar(
    BuildContext context,
    String message, {
    bool isError = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError
            ? AppColors.error
            : AppColors
                  .secondary /* Using the secondary teal color for success states */,
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
            /* TODO: Navigate away (e.g. context.go('/dashboard')) */
          }
        },
        builder: (context, state) {
          final isLoading = state is PatientRegistrationLoading;

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

                        /* Name */
                        _buildSectionHeader(
                          theme,
                          'Patient Name',
                          isRequired: true,
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: _nameController,
                          hintText: 'Enter full name',
                        ),
                        const SizedBox(height: 24),

                        /* Age */
                        _buildSectionHeader(theme, 'Age', isRequired: true),
                        const SizedBox(height: 8),
                        AgeInputRow(
                          controller: _ageController,
                          selectedUnit: _selectedAgeUnit,
                          onUnitChanged: isLoading
                              ? (unit) {}
                              : (unit) =>
                                    setState(() => _selectedAgeUnit = unit),
                        ),
                        const SizedBox(height: 24),

                        /* Gender */
                        _buildSectionHeader(theme, 'Gender', isRequired: true),
                        const SizedBox(height: 8),
                        GenderSelectionRow(
                          selectedGender: _selectedGender,
                          onGenderChanged: isLoading
                              ? (gender) {}
                              : (gender) =>
                                    setState(() => _selectedGender = gender),
                        ),
                        const SizedBox(height: 24),

                        /* Phone Number */
                        _buildSectionHeader(theme, 'Phone Number (Optional)'),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: _phoneController,
                          hintText: 'e.g. +20 123 456 7890',
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 48),

                        /* Next Button */
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: FilledButton(
                            onPressed: isLoading
                                ? null
                                : () => _submit(context),
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: isLoading
                                ? const SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
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

  Widget _buildSectionHeader(
    ThemeData theme,
    String title, {
    bool isRequired = false,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        if (isRequired)
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(
              '*',
              style: theme.textTheme.titleMedium?.copyWith(
                color: AppColors.error,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
