import 'package:cliniqara/core/presentation/widgets/cliniqara_chip.dart';
import 'package:flutter/material.dart';
import 'systemic_review_constants.dart';

class RelatedSystemSymptomsSection extends StatefulWidget {
  final List<String> initialRelatedSystems;
  final Map<String, List<String>> initialDetails;
  final Function(List<String> relatedSystems, Map<String, List<String>> details)
  onChanged;

  const RelatedSystemSymptomsSection({
    super.key,
    required this.initialRelatedSystems,
    required this.initialDetails,
    required this.onChanged,
  });

  @override
  State<RelatedSystemSymptomsSection> createState() =>
      _RelatedSystemSymptomsSectionState();
}

class _RelatedSystemSymptomsSectionState
    extends State<RelatedSystemSymptomsSection> {
  late final List<String> _relatedSystems = List.from(
    widget.initialRelatedSystems,
  );
  late final Map<String, List<String>> _details = Map.from(
    widget.initialDetails,
  );

  final Map<String, bool> _expandedSystems = {};

  @override
  void initState() {
    super.initState();
    for (final sys in availableSystems) {
      _expandedSystems[sys] = _relatedSystems.contains(sys);
    }
  }

  void _notifyChanged() {
    widget.onChanged(_relatedSystems, _details);
  }

  Widget _buildSystemAccordion(String systemName) {
    final isExpanded = _expandedSystems[systemName] ?? false;
    final options = systemicReviewOptions[systemName];
    if (options == null) return const SizedBox.shrink();

    final selectedSymptoms = _details[systemName] ?? [];
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _expandedSystems[systemName] = !isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    systemName.toUpperCase(),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: theme.colorScheme.outline,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.all(16).copyWith(top: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...options.entries.map((entry) {
                    final categoryName = entry.key;
                    final symptoms = entry.value;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categoryName,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.outline,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: symptoms.map((symptom) {
                              final isSelected = selectedSymptoms.contains(
                                symptom,
                              );
                              return CliniqaraChip(
                                label: symptom,
                                isSelected: isSelected,
                                onTap: () {
                                  setState(() {
                                    final newList = List<String>.from(
                                      selectedSymptoms,
                                    );
                                    if (isSelected) {
                                      newList.remove(symptom);
                                    } else {
                                      newList.add(symptom);
                                    }
                                    _details[systemName] = newList;
                                    _notifyChanged();
                                  });
                                },
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        const Text(
          '4. Related System Symptoms',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Related Systems',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.outline,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: availableSystems.map((sys) {
                  final isSelected = _relatedSystems.contains(sys);
                  return CliniqaraChip(
                    label: sys,
                    isSelected: isSelected,
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _relatedSystems.remove(sys);
                          _expandedSystems[sys] = false;
                        } else {
                          _relatedSystems.add(sys);
                          _expandedSystems[sys] = true;
                        }
                        _notifyChanged();
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              if (_relatedSystems.isNotEmpty) ...[
                const SizedBox(height: 8),
                ..._relatedSystems.map((sys) => _buildSystemAccordion(sys)),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
