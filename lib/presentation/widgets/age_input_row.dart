import 'package:flutter/material.dart';
import '../../domain/entities/patient.dart';
import 'custom_text_field.dart';

class AgeInputRow extends StatelessWidget {
  final TextEditingController controller;
  final AgeUnit selectedUnit;
  final ValueChanged<AgeUnit> onUnitChanged;

  const AgeInputRow({
    super.key,
    required this.controller,
    required this.selectedUnit,
    required this.onUnitChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: CustomTextField(
            controller: controller,
            hintText: '0',
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 3,
          child: SegmentedButton<AgeUnit>(
            segments: const [
              ButtonSegment<AgeUnit>(
                value: AgeUnit.years,
                label: Text('Years'),
              ),
              ButtonSegment<AgeUnit>(
                value: AgeUnit.months,
                label: Text('Months'),
              ),
              ButtonSegment<AgeUnit>(value: AgeUnit.days, label: Text('Days')),
            ],
            selected: {selectedUnit},
            onSelectionChanged: (Set<AgeUnit> newSelection) {
              onUnitChanged(newSelection.first);
            },
            style: SegmentedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
