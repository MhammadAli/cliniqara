import 'package:flutter/material.dart';
import '../../domain/entities/patient.dart';

class GenderSelectionRow extends StatelessWidget {
  final Gender? selectedGender;
  final ValueChanged<Gender> onGenderChanged;

  const GenderSelectionRow({
    super.key,
    this.selectedGender,
    required this.onGenderChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: Gender.values.map((gender) {
        final isSelected = selectedGender == gender;
        final backgroundColor = isSelected
            ? theme.colorScheme.primaryContainer
            : theme.colorScheme.surface;
        final textColor = isSelected
            ? theme.colorScheme.onPrimaryContainer
            : theme.colorScheme.onSurface;
        final borderColor = isSelected
            ? theme.colorScheme.primary
            : theme.colorScheme.outline;

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: InkWell(
              onTap: () => onGenderChanged(gender),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Icon(
                      gender == Gender.male ? Icons.male : Icons.female,
                      color: textColor,
                      size: 32,
                    ),
                    Text(
                      _capitalize(gender.name),
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: textColor,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
