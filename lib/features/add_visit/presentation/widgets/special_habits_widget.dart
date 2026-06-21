import 'package:flutter/material.dart';
import '../../../../core/presentation/widgets/cliniqara_chip.dart';
import '../../../../core/presentation/widgets/cliniqara_text_field.dart';

class SpecialHabitsWidget extends StatefulWidget {
  final List<String> initialHabits;
  final String? initialDrug;
  final String? initialOther;
  final void Function(List<String> habits, String? drug, String? other)? onChanged;

  const SpecialHabitsWidget({
    super.key,
    this.initialHabits = const [],
    this.initialDrug,
    this.initialOther,
    this.onChanged,
  });

  @override
  State<SpecialHabitsWidget> createState() => _SpecialHabitsWidgetState();
}

class _SpecialHabitsWidgetState extends State<SpecialHabitsWidget> {
  late final Set<String> _specialHabits = widget.initialHabits.toSet();
  late final TextEditingController _drugController = TextEditingController(text: widget.initialDrug);
  late final TextEditingController _otherController = TextEditingController(text: widget.initialOther);

  @override
  void initState() {
    super.initState();
    _drugController.addListener(_notifyChanged);
    _otherController.addListener(_notifyChanged);
  }

  @override
  void dispose() {
    _drugController.dispose();
    _otherController.dispose();
    super.dispose();
  }

  void _notifyChanged() {
    widget.onChanged?.call(
      _specialHabits.toList(),
      _drugController.text.isNotEmpty ? _drugController.text : null,
      _otherController.text.isNotEmpty ? _otherController.text : null,
    );
  }

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
                  _notifyChanged();
                });
              },
            );
          }).toList(),
        ),
        if (_specialHabits.contains('Drug use')) ...[
          const SizedBox(height: 12),
          SizedBox(
            width: 300,
            child: CliniqaraTextField(
              label: 'Type of drug',
              hintText: 'Specify drug...',
              controller: _drugController,
            ),
          ),
        ],
        if (_specialHabits.contains('Other')) ...[
          const SizedBox(height: 12),
          SizedBox(
            width: 300,
            child: CliniqaraTextField(
              label: 'Describe special habit',
              hintText: 'Specify habit...',
              controller: _otherController,
            ),
          ),
        ],
      ],
    );
  }
}
