import 'package:flutter/material.dart';
import 'package:cliniqara/core/presentation/collapsible_section_card.dart';
import 'package:cliniqara/core/presentation/reactive_custom_dropdown.dart';
import 'package:cliniqara/features/osce_form/presentation/osce_form_cubit.dart';

class GeneralInspectionCard extends StatelessWidget {
  const GeneralInspectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CollapsibleSectionCard(
      title: 'General Inspection',
      initiallyExpanded: false,
      children: [
        ReactiveCustomDropdown<String>(
          formControlName: '${OsceFormKeys.generalInspection}.${OsceFormKeys.appearance}',
          labelText: 'Appearance',
          items: const ['Normal', 'Ill-looking', 'Lethargic', 'Not Examined'],
        ),
        ReactiveCustomDropdown<String>(
          formControlName: '${OsceFormKeys.generalInspection}.${OsceFormKeys.consciousness}',
          labelText: 'Consciousness',
          items: const ['Normal', 'Alert', 'Confused', 'Unresponsive', 'Not Examined'],
        ),
        ReactiveCustomDropdown<String>(
          formControlName: '${OsceFormKeys.generalInspection}.${OsceFormKeys.distress}',
          labelText: 'Distress',
          items: const ['Normal', 'None', 'Mild', 'Moderate', 'Severe', 'Not Examined'],
        ),
        ReactiveCustomDropdown<String>(
          formControlName: '${OsceFormKeys.generalInspection}.${OsceFormKeys.nutrition}',
          labelText: 'Nutrition',
          items: const ['Normal', 'Well Nourished', 'Undernourished', 'Obese', 'Not Examined'],
        ),
        ReactiveCustomDropdown<String>(
          formControlName: '${OsceFormKeys.generalInspection}.${OsceFormKeys.hydration}',
          labelText: 'Hydration',
          items: const ['Normal', 'Well Hydrated', 'Dehydrated', 'Not Examined'],
        ),
      ],
    );
  }
}
