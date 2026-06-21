import 'package:flutter/material.dart';
import '../../domain/entities/personal_history.dart';
import '../../../../core/presentation/widgets/collapsible_section.dart';
import '../../../../core/presentation/widgets/cliniqara_text_field.dart';
import '../../../../core/presentation/widgets/cliniqara_dropdown.dart';
import '../../../../core/presentation/widgets/cliniqara_segmented_control.dart';
import 'special_habits_widget.dart';

class PersonalHistorySection extends StatefulWidget {
  final PersonalHistory? initialData;
  final ValueChanged<PersonalHistory>? onChanged;

  const PersonalHistorySection({
    super.key,
    this.initialData,
    this.onChanged,
  });

  @override
  State<PersonalHistorySection> createState() => _PersonalHistorySectionState();
}

class _PersonalHistorySectionState extends State<PersonalHistorySection> {
  late String? _selectedOccupation = widget.initialData?.occupation;
  late String? _maritalStatus = widget.initialData?.maritalStatus ?? 'Single';
  late String? _smokingStatus = widget.initialData?.smokingStatus ?? 'No';
  late String? _alcoholStatus = widget.initialData?.alcoholStatus ?? 'No';
  late String? _alcoholFrequency = widget.initialData?.alcoholFrequency;
  late String? _informant = widget.initialData?.informant ?? 'Patient';
  late String? _historyReliability = widget.initialData?.historyReliability ?? 'Reliable';
  
  late final TextEditingController _childrenController = TextEditingController(text: widget.initialData?.numberOfChildren?.toString() ?? '');
  late final TextEditingController _residenceController = TextEditingController(text: widget.initialData?.residence ?? '');
  late final TextEditingController _cigarettesController = TextEditingController(text: widget.initialData?.cigarettesPerDay?.toString() ?? '');
  late final TextEditingController _yearsSmokedController = TextEditingController(text: widget.initialData?.yearsSmoked?.toString() ?? '');

  List<String> _specialHabits = [];
  String? _typeOfDrug;
  String? _otherHabitDescription;

  @override
  void initState() {
    super.initState();
    _specialHabits = widget.initialData?.specialHabits ?? [];
    _typeOfDrug = widget.initialData?.typeOfDrug;
    _otherHabitDescription = widget.initialData?.otherHabitDescription;

    _childrenController.addListener(_notifyChanged);
    _residenceController.addListener(_notifyChanged);
    _cigarettesController.addListener(_notifyChanged);
    _yearsSmokedController.addListener(_notifyChanged);
  }

  @override
  void dispose() {
    _childrenController.dispose();
    _residenceController.dispose();
    _cigarettesController.dispose();
    _yearsSmokedController.dispose();
    super.dispose();
  }

  void _notifyChanged() {
    widget.onChanged?.call(PersonalHistory(
      occupation: _selectedOccupation,
      maritalStatus: _maritalStatus,
      numberOfChildren: int.tryParse(_childrenController.text),
      residence: _residenceController.text.isNotEmpty ? _residenceController.text : null,
      smokingStatus: _smokingStatus,
      cigarettesPerDay: int.tryParse(_cigarettesController.text),
      yearsSmoked: int.tryParse(_yearsSmokedController.text),
      alcoholStatus: _alcoholStatus,
      alcoholFrequency: _alcoholFrequency,
      informant: _informant,
      historyReliability: _historyReliability,
      specialHabits: _specialHabits,
      typeOfDrug: _typeOfDrug,
      otherHabitDescription: _otherHabitDescription,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return CollapsibleSection(
      title: 'Personal History',
      stepNumber: 1,
      icon: Icons.person_outline,
      initiallyExpanded: true,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRow1(context),
          const SizedBox(height: 16),
          _buildRow2(context),
          const SizedBox(height: 16),
          _buildRow3(context),
          const SizedBox(height: 16),
          SpecialHabitsWidget(
            initialHabits: _specialHabits,
            initialDrug: _typeOfDrug,
            initialOther: _otherHabitDescription,
            onChanged: (habits, drug, other) {
              _specialHabits = habits;
              _typeOfDrug = drug;
              _otherHabitDescription = other;
              _notifyChanged();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveRow(BuildContext context, List<Widget> children) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children.map((child) => Padding(
          padding: EdgeInsets.only(bottom: child == children.last ? 0 : 16.0),
          child: child,
        )).toList(),
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children.map((child) {
          if (child is SizedBox && child.width == 0 && child.height == 0) {
             return Expanded(child: child);
          }
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: child == children.last ? 0 : 16.0),
              child: child,
            ),
          );
        }).toList(),
      );
    }
  }

  Widget _buildRow1(BuildContext context) {
    return _buildResponsiveRow(context, [
      CliniqaraDropdown<String>(
        label: 'Occupation',
        hintText: 'Select occupation',
        value: _selectedOccupation,
        items: const [
          DropdownMenuItem(value: 'Student', child: Text('Student')),
          DropdownMenuItem(value: 'Office Worker', child: Text('Office Worker')),
          DropdownMenuItem(value: 'Manual Worker', child: Text('Manual Worker')),
          DropdownMenuItem(value: 'Retired', child: Text('Retired')),
          DropdownMenuItem(value: 'Other', child: Text('Other')),
        ],
        onChanged: (val) {
          setState(() => _selectedOccupation = val);
          _notifyChanged();
        },
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CliniqaraSegmentedControl<String>(
            label: 'Marital Status',
            items: const ['Single', 'Married', 'Divorced', 'Widowed'],
            selectedValue: _maritalStatus,
            itemLabelBuilder: (item) => item,
            onChanged: (val) {
              setState(() => _maritalStatus = val);
              _notifyChanged();
            },
          ),
          if (_maritalStatus != 'Single' && _maritalStatus != null) ...[
            const SizedBox(height: 12),
            CliniqaraTextField(
              label: 'Number of Children',
              hintText: 'Enter number',
              keyboardType: TextInputType.number,
              controller: _childrenController,
            ),
          ],
        ],
      ),
      CliniqaraTextField(
        label: 'Residence',
        hintText: 'Enter city or residence',
        prefixIcon: const Icon(Icons.search, size: 20),
        controller: _residenceController,
      ),
    ]);
  }

  Widget _buildRow2(BuildContext context) {
    return _buildResponsiveRow(context, [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CliniqaraSegmentedControl<String>(
            label: 'Smoking',
            items: const ['No', 'Yes'],
            selectedValue: _smokingStatus,
            itemLabelBuilder: (item) => item,
            onChanged: (val) {
              setState(() => _smokingStatus = val);
              _notifyChanged();
            },
          ),
          if (_smokingStatus == 'Yes') ...[
            const SizedBox(height: 12),
            CliniqaraTextField(
              label: 'Cigarettes per day',
              hintText: 'e.g. 20',
              keyboardType: TextInputType.number,
              controller: _cigarettesController,
            ),
            const SizedBox(height: 12),
            CliniqaraTextField(
              label: 'Years smoked',
              hintText: 'e.g. 10',
              keyboardType: TextInputType.number,
              controller: _yearsSmokedController,
            ),
          ],
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CliniqaraSegmentedControl<String>(
            label: 'Alcohol',
            items: const ['No', 'Current', 'Former'],
            selectedValue: _alcoholStatus,
            itemLabelBuilder: (item) => item,
            onChanged: (val) {
              setState(() {
                _alcoholStatus = val;
                if (val == 'No') _alcoholFrequency = null;
              });
              _notifyChanged();
            },
          ),
          if (_alcoholStatus == 'Current' || _alcoholStatus == 'Former') ...[
            const SizedBox(height: 12),
            CliniqaraSegmentedControl<String>(
              label: 'Frequency',
              items: const ['Occasional', 'Weekly', 'Daily'],
              selectedValue: _alcoholFrequency,
              itemLabelBuilder: (item) => item,
              onChanged: (val) {
                setState(() => _alcoholFrequency = val);
                _notifyChanged();
              },
            ),
          ],
        ],
      ),
      CliniqaraSegmentedControl<String>(
        label: 'Informant',
        items: const ['Patient', 'Relative', 'Caregiver', 'Record'],
        selectedValue: _informant,
        itemLabelBuilder: (item) => item,
        onChanged: (val) {
          setState(() => _informant = val);
          _notifyChanged();
        },
      ),
    ]);
  }

  Widget _buildRow3(BuildContext context) {
    return _buildResponsiveRow(context, [
      CliniqaraSegmentedControl<String>(
        label: 'History Reliability',
        items: const ['Reliable', 'Partial', 'Poor'],
        selectedValue: _historyReliability,
        itemLabelBuilder: (item) => item,
        onChanged: (val) {
          setState(() => _historyReliability = val);
          _notifyChanged();
        },
      ),
      const SizedBox.shrink(),
      const SizedBox.shrink(),
    ]);
  }
}
