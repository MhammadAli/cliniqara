import 'package:cliniqara/core/presentation/widgets/cliniqara_chip.dart';
import 'package:cliniqara/core/presentation/widgets/cliniqara_segmented_control.dart';
import 'package:cliniqara/core/presentation/widgets/cliniqara_text_field.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/hpi.dart';

class AssociatedSymptomsSection extends StatefulWidget {
  final Hpi? initialData;
  final ValueChanged<Hpi> onChanged;

  const AssociatedSymptomsSection({
    super.key,
    this.initialData,
    required this.onChanged,
  });

  @override
  State<AssociatedSymptomsSection> createState() =>
      _AssociatedSymptomsSectionState();
}

class _AssociatedSymptomsSectionState extends State<AssociatedSymptomsSection> {
  late final List<String> _associatedSymptoms = List.from(
    widget.initialData?.associatedSymptoms ?? [],
  );
  late final TextEditingController _symptomController = TextEditingController();
  late final TextEditingController _aggravatingController =
      TextEditingController(text: widget.initialData?.aggravatingFactors ?? '');
  late final TextEditingController _relievingController = TextEditingController(
    text: widget.initialData?.relievingFactors ?? '',
  );
  late EffectOfTreatment? _effectOfTreatment =
      widget.initialData?.effectOfTreatment;

  @override
  void initState() {
    super.initState();
    _aggravatingController.addListener(_notifyChanged);
    _relievingController.addListener(_notifyChanged);
  }

  @override
  void dispose() {
    _symptomController.dispose();
    _aggravatingController.dispose();
    _relievingController.dispose();
    super.dispose();
  }

  void _notifyChanged() {
    widget.onChanged(
      (widget.initialData ?? const Hpi()).copyWith(
        associatedSymptoms: List.from(_associatedSymptoms),
        aggravatingFactors: _aggravatingController.text.isNotEmpty
            ? _aggravatingController.text
            : null,
        relievingFactors: _relievingController.text.isNotEmpty
            ? _relievingController.text
            : null,
        effectOfTreatment: _effectOfTreatment,
      ),
    );
  }

  Widget _buildResponsiveRow(BuildContext context, List<Widget> children) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children
            .map(
              (child) => Padding(
                padding: EdgeInsets.only(
                  bottom: child == children.last ? 0 : 16.0,
                ),
                child: child,
              ),
            )
            .toList(),
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: children.map((child) {
          if (child is SizedBox && child.width == 0 && child.height == 0) {
            return Expanded(child: child);
          }
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                right: child == children.last ? 0 : 16.0,
              ),
              child: child,
            ),
          );
        }).toList(),
      );
    }
  }

  Widget _buildSymptomInputRow(BuildContext context) {
    return CliniqaraTextField(
      label: '', // The image has no label for the text field, it's just a hint
      hintText: 'Search or enter associated symptom',
      prefixIcon: const Icon(Icons.search, size: 20),
      controller: _symptomController,
      onSubmitted: (val) {
        if (val.isNotEmpty) {
          setState(() {
            if (!_associatedSymptoms.contains(val)) {
              _associatedSymptoms.add(val);
            }
            _symptomController.clear();
            _notifyChanged();
          });
        }
      },
    );
  }

  Widget _buildSuggestedSymptoms(BuildContext context) {
    final theme = Theme.of(context);
    final suggestions = ['Fever', 'Cough', 'Dyspnea', 'Chest Pain', 'Headache', 'Vomiting'];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Suggested:',
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.outline,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: suggestions.map((symptom) {
            return CliniqaraChip(
              label: symptom,
              isSelected: false, // We don't highlight them if they are selected, or we could. The image shows them unselected.
              onTap: () {
                setState(() {
                  if (!_associatedSymptoms.contains(symptom)) {
                    _associatedSymptoms.add(symptom);
                    _notifyChanged();
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSelectedSymptoms(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selected Symptoms',
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.outline,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 80),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: theme.colorScheme.outlineVariant),
            borderRadius: BorderRadius.circular(8),
            color: theme.colorScheme.surface,
          ),
          child: _associatedSymptoms.isEmpty
              ? Text(
                  'No symptoms selected.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.outline,
                    fontStyle: FontStyle.italic,
                  ),
                )
              : Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _associatedSymptoms.map((c) {
                    return Chip(
                      label: Text(c),
                      deleteIcon: const Icon(Icons.close, size: 16),
                      onDeleted: () {
                        setState(() {
                          _associatedSymptoms.remove(c);
                          _notifyChanged();
                        });
                      },
                    );
                  }).toList(),
                ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        const Text(
          '2. Associated Symptoms & Factors',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSymptomInputRow(context),
              const SizedBox(height: 16),
              _buildSuggestedSymptoms(context),
              const SizedBox(height: 16),
              _buildSelectedSymptoms(context),
              const SizedBox(height: 24),
              _buildResponsiveRow(context, [
                CliniqaraTextField(
                  label: 'Aggravating Factors',
                  hintText: 'Enter aggravating factors',
                  controller: _aggravatingController,
                  maxLines: 3,
                ),
                CliniqaraTextField(
                  label: 'Relieving Factors',
                  hintText: 'Enter relieving factors',
                  controller: _relievingController,
                  maxLines: 3,
                ),
              ]),
              const SizedBox(height: 24),
              Text(
                'Effect of Treatment',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              CliniqaraSegmentedControl<EffectOfTreatment>(
                label: '',
                items: EffectOfTreatment.values,
                selectedValue: _effectOfTreatment,
                itemLabelBuilder: (item) {
                  switch (item) {
                    case EffectOfTreatment.notTreated:
                      return 'Not Treated';
                    case EffectOfTreatment.improving:
                      return 'Improving';
                    case EffectOfTreatment.noChange:
                      return 'No Change';
                    case EffectOfTreatment.worsening:
                      return 'Worsening';
                  }
                },
                onChanged: (val) {
                  setState(() => _effectOfTreatment = val);
                  _notifyChanged();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
