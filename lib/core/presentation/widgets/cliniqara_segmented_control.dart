import 'package:flutter/material.dart';

class CliniqaraSegmentedControl<T> extends StatelessWidget {
  final String label;
  final List<T> items;
  final T? selectedValue;
  final String Function(T) itemLabelBuilder;
  final void Function(T) onChanged;

  const CliniqaraSegmentedControl({
    super.key,
    required this.label,
    required this.items,
    required this.itemLabelBuilder,
    required this.onChanged,
    this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.outline,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Wrap(
            spacing: 4,
            runSpacing: 4,
            children: items.map((item) {
              final isSelected = item == selectedValue;
              return InkWell(
                onTap: () => onChanged(item),
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? theme.colorScheme.surface : Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            )
                          ]
                        : null,
                  ),
                  child: Text(
                    itemLabelBuilder(item),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isSelected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurfaceVariant,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
