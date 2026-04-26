import 'package:flutter/material.dart';
import 'package:cliniqara/core/presentation/collapsible_section_card.dart';
import 'package:cliniqara/core/presentation/reactive_custom_dropdown.dart';
import 'package:cliniqara/features/osce_form/presentation/osce_form_cubit.dart';

class ChiefComplaintCard extends StatelessWidget {
  const ChiefComplaintCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CollapsibleSectionCard(
      title: 'Chief Complaint',
      initiallyExpanded: true,
      children: [
        ReactiveCustomDropdown<String>(
          formControlName: OsceFormKeys.chiefComplaint,
          labelText: 'Complaint',
          hintText: 'Select the main presenting complaint',
          items: const [
            'Pain',
            'Fever',
            'Cough',
            'Fatigue',
            'Nausea',
            'Dizziness',
            'Shortness of Breath',
            'Other',
          ],
        ),
      ],
    );
  }
}
