import 'package:flutter/material.dart';
import '../../domain/entities/patient.dart';
import '../../core/theme/app_colors.dart';
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
          child: CustomTextField(
            controller: controller,
            hintText: 'Enter age',
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 4,
          child: SizedBox(
            height: 48,
            /* Matched height to text field */
            child: SegmentedButton<AgeUnit>(
              showSelectedIcon: false,
              segments: const [
                ButtonSegment<AgeUnit>(
                  value: AgeUnit.years,
                  label: Text('Years'),
                ),
                ButtonSegment<AgeUnit>(
                  value: AgeUnit.months,
                  label: Text('Months'),
                ),
                ButtonSegment<AgeUnit>(
                  value: AgeUnit.days,
                  label: Text('Days'),
                ),
              ],
              selected: {selectedUnit},
              onSelectionChanged: (Set<AgeUnit> newSelection) {
                onUnitChanged(newSelection.first);
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith<Color>((
                  Set<WidgetState> states,
                ) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColors.surface; /* White pill when selected */
                  }
                  return AppColors
                      .inputSurface; /* Grey background when unselected */
                }),
                foregroundColor: WidgetStateProperty.resolveWith<Color>((
                  Set<WidgetState> states,
                ) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColors
                        .primaryBorder; /* Blue text when selected */
                  }
                  return AppColors
                      .textSecondary; /* Grey text when unselected */
                }),
                side: WidgetStateProperty.all(
                  const BorderSide(color: AppColors.border),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      9999,
                    ) /* Fully rounded pills per Figma */,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
