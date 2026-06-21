import 'package:cliniqara/core/presentation/widgets/cliniqara_segmented_control.dart';
import 'package:cliniqara/core/presentation/widgets/cliniqara_text_field.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/hpi.dart';
import 'pain_details_section.dart';
import 'excreta_details_section.dart';
import 'mass_swelling_details_section.dart';

class ComplaintTypeSection extends StatefulWidget {
  final ComplaintTypeDetails? initialData;
  final ValueChanged<ComplaintTypeDetails?> onChanged;

  const ComplaintTypeSection({
    super.key,
    this.initialData,
    required this.onChanged,
  });

  @override
  State<ComplaintTypeSection> createState() => _ComplaintTypeSectionState();
}

class _ComplaintTypeSectionState extends State<ComplaintTypeSection> {
  late String? _selectedType = widget.initialData?.type;

  // We maintain the state for each type so we don't lose it if the user switches back and forth
  late PainDetails _painDetails = widget.initialData is PainDetails
      ? widget.initialData as PainDetails
      : const PainDetails();
  late ExcretaDetails _excretaDetails = widget.initialData is ExcretaDetails
      ? widget.initialData as ExcretaDetails
      : const ExcretaDetails();
  late MassSwellingDetails _massSwellingDetails =
      widget.initialData is MassSwellingDetails
      ? widget.initialData as MassSwellingDetails
      : const MassSwellingDetails();
  late final TextEditingController _otherDetailsController =
      TextEditingController(
        text: widget.initialData is OtherComplaintDetails
            ? (widget.initialData as OtherComplaintDetails).details
            : '',
      );

  @override
  void initState() {
    super.initState();
    _otherDetailsController.addListener(_notifyChanged);
  }

  @override
  void dispose() {
    _otherDetailsController.dispose();
    super.dispose();
  }

  void _notifyChanged() {
    ComplaintTypeDetails? details;
    if (_selectedType == 'Pain') {
      details = _painDetails;
    } else if (_selectedType == 'Excreta') {
      details = _excretaDetails;
    } else if (_selectedType == 'MassSwelling') {
      details = _massSwellingDetails;
    } else if (_selectedType == 'Other') {
      details = OtherComplaintDetails(details: _otherDetailsController.text);
    }
    widget.onChanged(details);
  }

  Widget _buildDetails() {
    if (_selectedType == 'Pain') {
      return PainDetailsSection(
        initialData: _painDetails,
        onChanged: (val) {
          _painDetails = val;
          _notifyChanged();
        },
      );
    } else if (_selectedType == 'Excreta') {
      return ExcretaDetailsSection(
        initialData: _excretaDetails,
        onChanged: (val) {
          _excretaDetails = val;
          _notifyChanged();
        },
      );
    } else if (_selectedType == 'MassSwelling') {
      return MassSwellingDetailsSection(
        initialData: _massSwellingDetails,
        onChanged: (val) {
          _massSwellingDetails = val;
          _notifyChanged();
        },
      );
    } else if (_selectedType == 'Other') {
      return CliniqaraTextField(
        label: 'Other Details',
        hintText: 'Describe other complaint details',
        controller: _otherDetailsController,
        maxLines: 3,
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        const Text(
          '3. Complaint Type Details',
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
              CliniqaraSegmentedControl<String>(
                label: 'Select Complaint Type',
                items: const ['Pain', 'Excreta', 'Mass/Swelling', 'Other'],
                selectedValue: _selectedType == 'MassSwelling'
                    ? 'Mass/Swelling'
                    : _selectedType,
                itemLabelBuilder: (item) => item,
                onChanged: (val) {
                  setState(() {
                    if (val == 'Mass/Swelling') {
                      _selectedType = 'MassSwelling';
                    } else {
                      _selectedType = val;
                    }
                    _notifyChanged();
                  });
                },
              ),
              if (_selectedType != null) ...[
                const SizedBox(height: 24),
                _buildDetails(),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
