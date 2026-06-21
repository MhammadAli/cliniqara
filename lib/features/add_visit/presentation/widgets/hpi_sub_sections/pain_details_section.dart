import 'package:cliniqara/core/presentation/widgets/cliniqara_chip.dart';
import 'package:cliniqara/core/presentation/widgets/cliniqara_text_field.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/hpi.dart';

class PainDetailsSection extends StatefulWidget {
  final PainDetails? initialData;
  final ValueChanged<PainDetails> onChanged;

  const PainDetailsSection({
    super.key,
    this.initialData,
    required this.onChanged,
  });

  @override
  State<PainDetailsSection> createState() => _PainDetailsSectionState();
}

class _PainDetailsSectionState extends State<PainDetailsSection> {
  late final TextEditingController _locationController = TextEditingController(
    text: widget.initialData?.location ?? '',
  );
  late final List<String> _character = List.from(
    widget.initialData?.character ?? [],
  );
  late final TextEditingController _radiationController = TextEditingController(
    text: widget.initialData?.radiation ?? '',
  );
  late double _severity = widget.initialData?.severity?.toDouble() ?? 0.0;
  late final List<String> _timing = List.from(widget.initialData?.timing ?? []);
  late final List<String> _postural = List.from(
    widget.initialData?.postural ?? [],
  );
  late final List<String> _diurnal = List.from(
    widget.initialData?.diurnal ?? [],
  );

  final TextEditingController _otherCharacterController =
      TextEditingController();
  final TextEditingController _otherTimingController = TextEditingController();
  final TextEditingController _otherPosturalController =
      TextEditingController();
  final TextEditingController _otherDiurnalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _locationController.addListener(_notifyChanged);
    _radiationController.addListener(_notifyChanged);
  }

  @override
  void dispose() {
    _locationController.dispose();
    _radiationController.dispose();
    _otherCharacterController.dispose();
    _otherTimingController.dispose();
    _otherPosturalController.dispose();
    _otherDiurnalController.dispose();
    super.dispose();
  }

  void _notifyChanged() {
    widget.onChanged(
      PainDetails(
        location: _locationController.text.isNotEmpty
            ? _locationController.text
            : null,
        character: List.from(_character),
        radiation: _radiationController.text.isNotEmpty
            ? _radiationController.text
            : null,
        severity: _severity > 0 ? _severity.toInt() : null,
        timing: List.from(_timing),
        postural: List.from(_postural),
        diurnal: List.from(_diurnal),
      ),
    );
  }

  Widget _buildChipGroup(
    String title,
    List<String> options,
    List<String> selectedList,
    TextEditingController otherController,
  ) {
    final theme = Theme.of(context);
    final isOtherSelected = selectedList.contains('Other');

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
            final isSelected = selectedList.contains(option);
            return CliniqaraChip(
              label: option,
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedList.remove(option);
                  } else {
                    selectedList.add(option);
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
        CliniqaraTextField(
          label: 'Location',
          hintText: 'Describe pain location',
          controller: _locationController,
        ),
        const SizedBox(height: 16),
        _buildChipGroup(
          'Character',
          [
            'Sharp',
            'Dull',
            'Burning',
            'Colicky',
            'Throbbing',
            'Stabbing',
            'Cramping',
            'Aching',
            'Pressure',
            'Heavy',
            'Other',
          ],
          _character,
          _otherCharacterController,
        ),
        const SizedBox(height: 16),
        CliniqaraTextField(
          label: 'Radiation',
          hintText: 'Describe where pain radiates',
          controller: _radiationController,
        ),
        const SizedBox(height: 16),
        Text(
          'Severity (${_severity.toInt()}/10)',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Theme.of(context).colorScheme.outline,
            fontWeight: FontWeight.bold,
          ),
        ),
        Slider(
          value: _severity,
          min: 0,
          max: 10,
          divisions: 10,
          label: _severity.round().toString(),
          onChanged: (double value) {
            setState(() {
              _severity = value;
            });
            _notifyChanged();
          },
        ),
        const SizedBox(height: 16),
        _buildChipGroup(
          'Timing',
          [
            'Continuous',
            'Intermittent',
            'Colicky',
            'Episodic',
            'Progressive',
            'Sudden attacks',
            'Other',
          ],
          _timing,
          _otherTimingController,
        ),
        const SizedBox(height: 16),
        _buildChipGroup(
          'Postural',
          [
            'Worse standing',
            'Worse sitting',
            'Worse lying flat',
            'Worse bending',
            'Worse walking',
            'Relieved by rest',
            'Relieved by position change',
            'Other',
          ],
          _postural,
          _otherPosturalController,
        ),
        const SizedBox(height: 16),
        _buildChipGroup(
          'Diurnal',
          [
            'Morning',
            'Afternoon',
            'Evening',
            'Night',
            'Worse on waking',
            'Nocturnal',
            'Seasonal',
            'No diurnal variation',
            'Other',
          ],
          _diurnal,
          _otherDiurnalController,
        ),
      ],
    );
  }
}
