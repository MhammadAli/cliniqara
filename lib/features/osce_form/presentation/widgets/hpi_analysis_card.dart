import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:cliniqara/core/presentation/collapsible_section_card.dart';
import 'package:cliniqara/core/presentation/reactive_custom_dropdown.dart';
import 'package:cliniqara/features/osce_form/presentation/osce_form_cubit.dart';

class HpiAnalysisCard extends StatelessWidget {
  const HpiAnalysisCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConsumer(
      builder: (context, form, child) {
        if (!form.contains(OsceFormKeys.hpiAnalysis)) {
          return const SizedBox.shrink();
        }

        return CollapsibleSectionCard(
          title: 'HPI Analysis',
          initiallyExpanded: true,
          children: [
            ReactiveCustomDropdown<String>(
              formControlName: '${OsceFormKeys.hpiAnalysis}.${OsceFormKeys.severity}',
              labelText: 'Severity',
              hintText: 'Select severity (1-10)',
              items: List.generate(10, (i) => (i + 1).toString()),
            ),
            ReactiveCustomDropdown<String>(
              formControlName: '${OsceFormKeys.hpiAnalysis}.${OsceFormKeys.radiation}',
              labelText: 'Radiation',
              hintText: 'Does the pain radiate?',
              items: const ['None', 'Left Arm', 'Right Arm', 'Back', 'Neck', 'Jaw', 'Other'],
            ),
          ],
        );
      },
    );
  }
}
