import 'package:flutter/material.dart';
import '../../../../core/presentation/widgets/collapsible_section.dart';
import 'medication_block.dart';

class PrescriptionSection extends StatefulWidget {
  const PrescriptionSection({super.key});

  @override
  State<PrescriptionSection> createState() => _PrescriptionSectionState();
}

class _PrescriptionSectionState extends State<PrescriptionSection> {
  // Dumb UI state for demonstration, logic should ideally be in Cubit
  int medicationCount = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return CollapsibleSection(
      title: 'Prescription Section',
      stepNumber: 4,
      icon: Icons.receipt_long,
      initiallyExpanded: true,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: medicationCount,
            itemBuilder: (context, index) {
              return MedicationBlock(
                index: index,
                onRemove: () {
                  setState(() {
                    if (medicationCount > 1) {
                      medicationCount--;
                    }
                  });
                },
              );
            },
          ),
          const SizedBox(height: 8),
          Center(
            child: TextButton.icon(
              onPressed: () {
                setState(() {
                  medicationCount++;
                });
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Medication'),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: theme.colorScheme.primary),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
