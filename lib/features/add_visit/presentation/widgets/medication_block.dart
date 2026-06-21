import 'package:flutter/material.dart';
import '../../../../core/presentation/widgets/cliniqara_text_field.dart';
import '../../../../core/presentation/widgets/cliniqara_dropdown.dart';
import '../../../../core/presentation/widgets/cliniqara_chip.dart';

class MedicationBlock extends StatelessWidget {
  final int index;
  final VoidCallback onRemove;

  const MedicationBlock({
    super.key,
    required this.index,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border.all(color: theme.colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Medication ${index + 1}',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete_outline, color: theme.colorScheme.error),
                onPressed: onRemove,
                tooltip: 'Remove Medication',
              ),
            ],
          ),
          const SizedBox(height: 12),
          const CliniqaraTextField(
            label: 'Drug Name',
            hintText: 'e.g. Paracetamol',
            prefixIcon: Icon(Icons.medication),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Expanded(
                flex: 2,
                child: CliniqaraTextField(
                  label: 'Dose',
                  hintText: 'e.g. 500',
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 1,
                child: CliniqaraDropdown<String>(
                  label: 'Unit',
                  hintText: 'mg',
                  items: const [
                    DropdownMenuItem(value: 'mg', child: Text('mg')),
                    DropdownMenuItem(value: 'g', child: Text('g')),
                    DropdownMenuItem(value: 'ml', child: Text('ml')),
                  ],
                  onChanged: (val) {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Frequency',
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.outline,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              CliniqaraChip(label: 'Once Daily', isSelected: false, onTap: () {}),
              CliniqaraChip(label: 'Twice Daily', isSelected: true, onTap: () {}),
              CliniqaraChip(label: 'Three Times Daily', isSelected: false, onTap: () {}),
              CliniqaraChip(label: 'As Needed', isSelected: false, onTap: () {}),
            ],
          ),
          const SizedBox(height: 16),
          const CliniqaraTextField(
            label: 'Instructions / Notes',
            hintText: 'e.g. Take after meals',
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
