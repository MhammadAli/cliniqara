import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/patient_info_header_card.dart';

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
    // In a real scenario, this would be wrapped in a BlocBuilder to get patient details
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PatientInfoHeaderCard(
                    patientName: 'Ahmed Mohamed',
                    age: 28,
                    gender: 'Male',
                    activeSection: _activeSection,
                    onSectionChanged: (section) {
                      setState(() {
                        _activeSection = section;
                      });
                    },
                  ),
                  const SizedBox(height: 24),

                  // Content for the active section will go here
                  // e.g. if (_activeSection == 'Personal') PersonalHistoryForm()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
