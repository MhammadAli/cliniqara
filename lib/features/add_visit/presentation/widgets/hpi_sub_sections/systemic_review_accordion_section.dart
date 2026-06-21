import 'package:cliniqara/core/presentation/widgets/cliniqara_chip.dart';
import 'package:cliniqara/core/presentation/widgets/cliniqara_text_field.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/hpi.dart';
import 'systemic_review_constants.dart';

class SystemicReviewAccordionSection extends StatefulWidget {
  final Map<String, SystemReview> initialSystemicReview;
  final ValueChanged<Map<String, SystemReview>> onChanged;

  const SystemicReviewAccordionSection({
    super.key,
    required this.initialSystemicReview,
    required this.onChanged,
  });

  @override
  State<SystemicReviewAccordionSection> createState() => _SystemicReviewAccordionSectionState();
}

class _SystemicReviewAccordionSectionState extends State<SystemicReviewAccordionSection> {
  late final Map<String, SystemReview> _systemicReview = Map.from(widget.initialSystemicReview);
  final Map<String, TextEditingController> _otherControllers = {};

  final Map<String, bool> _expandedSystems = {};

  @override
  void initState() {
    super.initState();
    for (final sys in abnormalFindingsOptions.keys) {
      final review = _systemicReview[sys];
      _otherControllers[sys] = TextEditingController(text: review?.otherFindings ?? '');
      _otherControllers[sys]?.addListener(() => _notifyChanged(sys));
      _expandedSystems[sys] = false;
    }
  }

  @override
  void dispose() {
    for (final controller in _otherControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _notifyChanged([String? systemToUpdateText]) {
    if (systemToUpdateText != null) {
      final text = _otherControllers[systemToUpdateText]?.text;
      final current = _systemicReview[systemToUpdateText] ?? const SystemReview();
      _systemicReview[systemToUpdateText] = current.copyWith(
        otherFindings: text != null && text.isNotEmpty ? text : null,
      );
    }
    widget.onChanged(_systemicReview);
  }

  Widget _buildSystemAccordion(String systemName) {
    final isExpanded = _expandedSystems[systemName] ?? false;
    final options = abnormalFindingsOptions[systemName];
    if (options == null) return const SizedBox.shrink();

    final currentReview = _systemicReview[systemName] ?? const SystemReview();
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: theme.colorScheme.outlineVariant),
        ),
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
            hoverColor: theme.colorScheme.surfaceContainerLowest,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    systemName,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: theme.colorScheme.outline,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Abnormal Findings',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.outline,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: options.map((symptom) {
                      final isSelected = currentReview.selectedSymptoms.contains(symptom);
                      return CliniqaraChip(
                        label: symptom,
                        isSelected: isSelected,
                        onTap: () {
                          setState(() {
                            final newList = List<String>.from(currentReview.selectedSymptoms);
                            if (isSelected) {
                              newList.remove(symptom);
                            } else {
                              newList.add(symptom);
                            }
                            _systemicReview[systemName] = currentReview.copyWith(selectedSymptoms: newList);
                            _notifyChanged();
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  CliniqaraTextField(
                    label: 'Other Findings',
                    hintText: 'Enter other findings',
                    controller: _otherControllers[systemName],
                  ),
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
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.health_and_safety_outlined,
                          color: theme.colorScheme.primary,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Systemic Review',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Padding(
                      padding: const EdgeInsets.only(left: 26),
                      child: Text(
                        'Screen for abnormalities in other systems',
                        style: TextStyle(
                          fontSize: 11,
                          color: theme.colorScheme.outline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Accordions
              Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceBright,
                  border: Border(
                    top: BorderSide(color: theme.colorScheme.outlineVariant),
                  ),
                ),
                child: Column(
                  children: abnormalFindingsOptions.keys
                      .map((sys) => _buildSystemAccordion(sys))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
