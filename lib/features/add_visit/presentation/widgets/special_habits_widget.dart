import 'package:flutter/material.dart';
import '../../../../core/presentation/widgets/cliniqara_chip.dart';
import '../../../../core/presentation/widgets/cliniqara_text_field.dart';

class SpecialHabitsWidget extends StatefulWidget {
  const SpecialHabitsWidget({super.key});

  @override
  State<SpecialHabitsWidget> createState() => _SpecialHabitsWidgetState();
}

class _SpecialHabitsWidgetState extends State<SpecialHabitsWidget> {
  final Set<String> _specialHabits = {};

  @override
  Widget build(BuildContext context) {
    final habits = ['Caffeine', 'Drug use', 'Exercise', 'Sleep disturbance', 'Other'];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Special Habits',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: habits.map((habit) {
            final isSelected = _specialHabits.contains(habit);
            return CliniqaraChip(
              label: habit,
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  if (isSelected) {
                    _specialHabits.remove(habit);
                  } else {
                    _specialHabits.add(habit);
                  }
                });
              },
            );
          }).toList(),
        ),
        if (_specialHabits.contains('Drug use')) ...[
          const SizedBox(height: 12),
          const SizedBox(
            width: 300,
            child: CliniqaraTextField(
              label: 'Type of drug',
              hintText: 'Specify drug...',
            ),
          ),
        ],
        if (_specialHabits.contains('Other')) ...[
          const SizedBox(height: 12),
          const SizedBox(
            width: 300,
            child: CliniqaraTextField(
              label: 'Describe special habit',
              hintText: 'Specify habit...',
            ),
          ),
        ],
      ],
    );
  }
}
