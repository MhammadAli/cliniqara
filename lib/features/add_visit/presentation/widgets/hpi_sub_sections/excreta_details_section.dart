import 'package:cliniqara/core/presentation/widgets/cliniqara_chip.dart';
import 'package:cliniqara/core/presentation/widgets/cliniqara_text_field.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/hpi.dart';

class ExcretaDetailsSection extends StatefulWidget {
  final ExcretaDetails? initialData;
  final ValueChanged<ExcretaDetails> onChanged;

  const ExcretaDetailsSection({
    super.key,
    this.initialData,
    required this.onChanged,
  });

  @override
  State<ExcretaDetailsSection> createState() => _ExcretaDetailsSectionState();
}

class _ExcretaDetailsSectionState extends State<ExcretaDetailsSection> {
  late String? _amount = widget.initialData?.amount;
  late String? _color = widget.initialData?.color;
  late final List<String> _content = List.from(
    widget.initialData?.content ?? [],
  );
  late String? _consistency = widget.initialData?.consistency;
  late String? _odor = widget.initialData?.odor;
  late String? _postural = widget.initialData?.postural;
  late String? _diurnal = widget.initialData?.diurnal;

  final TextEditingController _otherAmountController = TextEditingController();
  final TextEditingController _otherColorController = TextEditingController();
  final TextEditingController _otherContentController = TextEditingController();
  final TextEditingController _otherConsistencyController =
      TextEditingController();
  final TextEditingController _otherOdorController = TextEditingController();
  final TextEditingController _otherPosturalController =
      TextEditingController();
  final TextEditingController _otherDiurnalController = TextEditingController();

  @override
  void dispose() {
    _otherAmountController.dispose();
    _otherColorController.dispose();
    _otherContentController.dispose();
    _otherConsistencyController.dispose();
    _otherOdorController.dispose();
    _otherPosturalController.dispose();
    _otherDiurnalController.dispose();
    super.dispose();
  }

  void _notifyChanged() {
    widget.onChanged(
      ExcretaDetails(
        amount: _amount,
        color: _color,
        content: List.from(_content),
        consistency: _consistency,
        odor: _odor,
        postural: _postural,
        diurnal: _diurnal,
      ),
    );
  }

  Widget _buildChipGroup(
    String title,
    List<String> options,
    dynamic selected,
    dynamic onSelected,
    TextEditingController otherController, {
    bool isMulti = false,
  }) {
    final theme = Theme.of(context);
    final isOtherSelected = isMulti
        ? (selected as List<String>).contains('Other')
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
                ? (selected as List<String>).contains(option)
                : selected == option;
            return CliniqaraChip(
              label: option,
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  if (isMulti) {
                    if (isSelected) {
                      (selected as List<String>).remove(option);
                    } else {
                      (selected as List<String>).add(option);
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
            onChanged: (val) => _notifyChanged(),
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
        _buildChipGroup(
          'Amount',
          [
            'Scanty',
            'Moderate',
            'Large',
            'Profuse',
            'Variable',
            'Unknown',
            'Other',
          ],
          _amount,
          (val) => _amount = val,
          _otherAmountController,
        ),
        const SizedBox(height: 16),
        _buildChipGroup(
          'Color',
          [
            'Clear',
            'White',
            'Yellow',
            'Green',
            'Brown',
            'Red/Bloody',
            'Black',
            'Variable',
            'Unknown',
            'Other',
          ],
          _color,
          (val) => _color = val,
          _otherColorController,
        ),
        const SizedBox(height: 16),
        _buildChipGroup(
          'Content',
          [
            'Mucus',
            'Pus',
            'Blood',
            'Food particles',
            'Clots',
            'Worms',
            'Variable',
            'Unknown',
            'Other',
          ],
          _content,
          (_) {},
          _otherContentController,
          isMulti: true,
        ),
        const SizedBox(height: 16),
        _buildChipGroup(
          'Consistency',
          [
            'Watery',
            'Mucoid',
            'Thick',
            'Frothy',
            'Solid',
            'Variable',
            'Unknown',
            'Other',
          ],
          _consistency,
          (val) => _consistency = val,
          _otherConsistencyController,
        ),
        const SizedBox(height: 16),
        _buildChipGroup(
          'Odor',
          [
            'None',
            'Offensive',
            'Foul',
            'Sweet',
            'Variable',
            'Unknown',
            'Other',
          ],
          _odor,
          (val) => _odor = val,
          _otherOdorController,
        ),
        const SizedBox(height: 16),
        _buildChipGroup(
          'Postural',
          [
            'Worse lying flat',
            'Worse sitting',
            'Worse standing',
            'Better in certain positions',
            'No postural relation',
            'Variable',
            'Unknown',
            'Other',
          ],
          _postural,
          (val) => _postural = val,
          _otherPosturalController,
        ),
        const SizedBox(height: 16),
        _buildChipGroup(
          'Diurnal',
          [
            'Morning',
            'Daytime',
            'Night',
            'Intermittent',
            'No diurnal variation',
            'Variable',
            'Unknown',
            'Other',
          ],
          _diurnal,
          (val) => _diurnal = val,
          _otherDiurnalController,
        ),
      ],
    );
  }
}
