import 'package:cliniqara/core/presentation/widgets/cliniqara_chip.dart';
import 'package:cliniqara/core/presentation/widgets/cliniqara_text_field.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/hpi.dart';

class AnalysisOfComplaintSection extends StatefulWidget {
  final ComplaintAnalysis? initialData;
  final ValueChanged<ComplaintAnalysis> onChanged;

  const AnalysisOfComplaintSection({
    super.key,
    this.initialData,
    required this.onChanged,
  });

  @override
  State<AnalysisOfComplaintSection> createState() =>
      _AnalysisOfComplaintSectionState();
}

class _AnalysisOfComplaintSectionState
    extends State<AnalysisOfComplaintSection> {
  late String? _onsetMode = widget.initialData?.onsetMode;
  late final List<String> _circumstances = List.from(
    widget.initialData?.circumstancesAtOnset ?? [],
  );
  late final List<String> _triggers = List.from(
    widget.initialData?.triggerAtOnset ?? [],
  );
  late String? _course = widget.initialData?.course;

  final TextEditingController _otherOnsetModeController =
      TextEditingController();
  final TextEditingController _otherCircumstanceController =
      TextEditingController();
  final TextEditingController _otherTriggerController = TextEditingController();
  final TextEditingController _otherCourseController = TextEditingController();

  @override
  void dispose() {
    _otherOnsetModeController.dispose();
    _otherCircumstanceController.dispose();
    _otherTriggerController.dispose();
    _otherCourseController.dispose();
    super.dispose();
  }

  void _notifyChanged() {
    widget.onChanged(
      ComplaintAnalysis(
        onsetMode: _onsetMode,
        circumstancesAtOnset: _circumstances,
        triggerAtOnset: _triggers,
        course: _course,
      ),
    );
  }

  Widget _buildChipGroup(
    String title,
    List<String> options,
    String? selected,
    ValueChanged<String?> onSelected,
    TextEditingController otherController, {
    bool isMulti = false,
    List<String>? selectedList,
  }) {
    final theme = Theme.of(context);
    final isOtherSelected = isMulti
        ? selectedList!.contains('Other')
        : selected == 'Other';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.outline,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: options.map((option) {
            final isSelected = isMulti
                ? selectedList!.contains(option)
                : selected == option;
            return CliniqaraChip(
              label: option,
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  if (isMulti) {
                    if (isSelected) {
                      selectedList!.remove(option);
                    } else {
                      selectedList!.add(option);
                    }
                  } else {
                    onSelected(isSelected ? null : option);
                  }
                  _notifyChanged();
                });
              },
            );
          }).toList(),
        ),
        if (isOtherSelected) ...[
          const SizedBox(height: 8),
          CliniqaraTextField(
            label: 'Other $title',
            hintText: 'Describe other ${title.toLowerCase()}',
            controller: otherController,
            onChanged: (val) {
              // We could store the custom value directly or keep it in the string if we want,
              // but for now we just rely on 'Other' being selected and we can append the text
              // when saving, or just let 'Other' be the selected and the text is separate.
              // We will just update the state to trigger a rebuild or capture it.
              _notifyChanged();
            },
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '1. Analysis of Complaint',
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
              _buildChipGroup(
                'Onset Mode',
                ['Sudden', 'Gradual', 'Acute', 'Insidious', 'Other'],
                _onsetMode,
                (val) => _onsetMode = val,
                _otherOnsetModeController,
              ),
              const SizedBox(height: 16),
              _buildChipGroup(
                'Circumstances at Onset',
                [
                  'At rest',
                  'During exertion',
                  'After meal',
                  'After trauma',
                  'After infection',
                  'During sleep',
                  'On waking',
                ],
                null,
                (_) {},
                _otherCircumstanceController,
                isMulti: true,
                selectedList: _circumstances,
              ),
              const SizedBox(height: 16),
              _buildChipGroup(
                'Trigger at Onset',
                [
                  'Spontaneous',
                  'Activity',
                  'Posture',
                  'Food',
                  'Medication',
                  'Stress',
                ],
                null,
                (_) {},
                _otherTriggerController,
                isMulti: true,
                selectedList: _triggers,
              ),
              const SizedBox(height: 16),
              _buildChipGroup(
                'Course',
                [
                  'Progressive',
                  'Static',
                  'Intermittent',
                  'Recurrent',
                  'Continuous',
                  'Improving',
                  'Worsening',
                  'Other',
                ],
                _course,
                (val) => _course = val,
                _otherCourseController,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
