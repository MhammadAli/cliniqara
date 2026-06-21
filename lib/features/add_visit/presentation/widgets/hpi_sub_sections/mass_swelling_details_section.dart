import 'package:cliniqara/core/presentation/widgets/cliniqara_chip.dart';
import 'package:cliniqara/core/presentation/widgets/cliniqara_text_field.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/hpi.dart';

class MassSwellingDetailsSection extends StatefulWidget {
  final MassSwellingDetails? initialData;
  final ValueChanged<MassSwellingDetails> onChanged;

  const MassSwellingDetailsSection({
    super.key,
    this.initialData,
    required this.onChanged,
  });

  @override
  State<MassSwellingDetailsSection> createState() =>
      _MassSwellingDetailsSectionState();
}

class _MassSwellingDetailsSectionState
    extends State<MassSwellingDetailsSection> {
  late String? _siteCharacteristics = widget.initialData?.siteCharacteristics;
  late final TextEditingController _specificSiteController =
      TextEditingController(
        text: widget.initialData?.specificAnatomicalSite ?? '',
      );
  late String? _side = widget.initialData?.side;
  late final List<String> _distribution = List.from(
    widget.initialData?.distribution ?? [],
  );
  late final List<String> _relationToStructures = List.from(
    widget.initialData?.relationToStructures ?? [],
  );
  late String? _number = widget.initialData?.number;
  late String? _pain = widget.initialData?.pain;
  late String? _sizeChange = widget.initialData?.sizeChange;
  late String? _trauma = widget.initialData?.trauma;
  late String? _infection = widget.initialData?.infection;
  late String? _effectOnFunction = widget.initialData?.effectOnFunction;

  final TextEditingController _otherSideController = TextEditingController();
  final TextEditingController _otherDistributionController =
      TextEditingController();
  final TextEditingController _otherRelationController =
      TextEditingController();
  final TextEditingController _otherNumberController = TextEditingController();
  final TextEditingController _otherPainController = TextEditingController();
  final TextEditingController _otherSizeChangeController =
      TextEditingController();
  final TextEditingController _otherEffectController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _specificSiteController.addListener(_notifyChanged);
  }

  @override
  void dispose() {
    _specificSiteController.dispose();
    _otherSideController.dispose();
    _otherDistributionController.dispose();
    _otherRelationController.dispose();
    _otherNumberController.dispose();
    _otherPainController.dispose();
    _otherSizeChangeController.dispose();
    _otherEffectController.dispose();
    super.dispose();
  }

  void _notifyChanged() {
    widget.onChanged(
      MassSwellingDetails(
        siteCharacteristics: _siteCharacteristics,
        specificAnatomicalSite: _specificSiteController.text.isNotEmpty
            ? _specificSiteController.text
            : null,
        side: _side,
        distribution: List.from(_distribution),
        relationToStructures: List.from(_relationToStructures),
        number: _number,
        pain: _pain,
        sizeChange: _sizeChange,
        trauma: _trauma,
        infection: _infection,
        effectOnFunction: _effectOnFunction,
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
        const Text(
          '1. Site',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildChipGroup(
          'Site Characteristics',
          [
            'Localized',
            'Diffuse',
            'Superficial',
            'Deep',
            'Fixed location',
            'Migratory',
          ],
          _siteCharacteristics,
          (val) => _siteCharacteristics = val,
          TextEditingController(),
        ),
        const SizedBox(height: 16),
        CliniqaraTextField(
          label: 'Specific anatomical site',
          hintText: 'Enter anatomical site',
          controller: _specificSiteController,
        ),
        const SizedBox(height: 16),
        _buildChipGroup(
          'Side',
          ['Right', 'Left', 'Bilateral', 'Other'],
          _side,
          (val) => _side = val,
          _otherSideController,
        ),
        const SizedBox(height: 16),
        _buildChipGroup(
          'Additional distribution options',
          ['Unilateral', 'Crossing midline', 'Multiple regions', 'Other'],
          _distribution,
          (_) {},
          _otherDistributionController,
          isMulti: true,
        ),
        const SizedBox(height: 16),
        _buildChipGroup(
          'Relation to surrounding structures',
          ['Skin', 'Subcutaneous', 'Muscle', 'Bone', 'Organ-related', 'Other'],
          _relationToStructures,
          (_) {},
          _otherRelationController,
          isMulti: true,
        ),
        const Divider(height: 32),
        const Text(
          '2. Number',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildChipGroup(
          'Number',
          ['Single', 'Multiple', 'Diffuse', 'Other'],
          _number,
          (val) => _number = val,
          _otherNumberController,
        ),
        const Divider(height: 32),
        const Text(
          '3. Pain',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildChipGroup(
          'Pain',
          ['Painful', 'Painless', 'Intermittent', 'Constant', 'Other'],
          _pain,
          (val) => _pain = val,
          _otherPainController,
        ),
        const Divider(height: 32),
        const Text(
          '4. Size Change',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildChipGroup(
          'Size Change',
          ['Increasing', 'Decreasing', 'Fluctuating', 'Stable', 'Other'],
          _sizeChange,
          (val) => _sizeChange = val,
          _otherSizeChangeController,
        ),
        const Divider(height: 32),
        const Text(
          '5. Trauma',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildChipGroup(
          'Trauma',
          ['Present', 'Absent', 'Unknown'],
          _trauma,
          (val) => _trauma = val,
          TextEditingController(),
        ),
        const Divider(height: 32),
        const Text(
          '6. Infection',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildChipGroup(
          'Infection',
          ['Present', 'Absent', 'Unknown'],
          _infection,
          (val) => _infection = val,
          TextEditingController(),
        ),
        const Divider(height: 32),
        const Text(
          '7. Effect on Function',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildChipGroup(
          'Effect on Function',
          [
            'None',
            'Mild limitation',
            'Moderate limitation',
            'Severe limitation',
            'Other',
          ],
          _effectOnFunction,
          (val) => _effectOnFunction = val,
          _otherEffectController,
        ),
      ],
    );
  }
}
