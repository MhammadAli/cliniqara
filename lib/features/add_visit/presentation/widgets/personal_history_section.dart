import 'package:flutter/material.dart';
import '../../../../core/presentation/widgets/collapsible_section.dart';
import '../../../../core/presentation/widgets/cliniqara_text_field.dart';
import '../../../../core/presentation/widgets/cliniqara_dropdown.dart';
import '../../../../core/presentation/widgets/cliniqara_segmented_control.dart';
import 'special_habits_widget.dart';
class PersonalHistorySection extends StatefulWidget {
  const PersonalHistorySection({super.key});

  @override
  State<PersonalHistorySection> createState() => _PersonalHistorySectionState();
}

class _PersonalHistorySectionState extends State<PersonalHistorySection> {
  String? _selectedOccupation;
  String? _maritalStatus = 'Single';
  String? _smokingStatus = 'No';
  String? _alcoholStatus = 'No';
  String? _alcoholFrequency;
  String? _informant = 'Patient';
  String? _historyReliability = 'Reliable';
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
          const SpecialHabitsWidget(),
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
        onChanged: (val) => setState(() => _selectedOccupation = val),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CliniqaraSegmentedControl<String>(
            label: 'Marital Status',
            items: const ['Single', 'Married', 'Divorced', 'Widowed'],
            selectedValue: _maritalStatus,
            itemLabelBuilder: (item) => item,
            onChanged: (val) => setState(() => _maritalStatus = val),
          ),
          if (_maritalStatus != 'Single' && _maritalStatus != null) ...[
            const SizedBox(height: 12),
            const CliniqaraTextField(
              label: 'Number of Children',
              hintText: 'Enter number',
              keyboardType: TextInputType.number,
            ),
          ],
        ],
      ),
      const CliniqaraTextField(
        label: 'Residence',
        hintText: 'Enter city or residence',
        prefixIcon: Icon(Icons.search, size: 20),
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
            onChanged: (val) => setState(() => _smokingStatus = val),
          ),
          if (_smokingStatus == 'Yes') ...[
            const SizedBox(height: 12),
            const CliniqaraTextField(
              label: 'Cigarettes per day',
              hintText: 'e.g. 20',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            const CliniqaraTextField(
              label: 'Years smoked',
              hintText: 'e.g. 10',
              keyboardType: TextInputType.number,
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
            },
          ),
          if (_alcoholStatus == 'Current' || _alcoholStatus == 'Former') ...[
            const SizedBox(height: 12),
            CliniqaraSegmentedControl<String>(
              label: 'Frequency',
              items: const ['Occasional', 'Weekly', 'Daily'],
              selectedValue: _alcoholFrequency,
              itemLabelBuilder: (item) => item,
              onChanged: (val) => setState(() => _alcoholFrequency = val),
            ),
          ],
        ],
      ),
      CliniqaraSegmentedControl<String>(
        label: 'Informant',
        items: const ['Patient', 'Relative', 'Caregiver', 'Record'],
        selectedValue: _informant,
        itemLabelBuilder: (item) => item,
        onChanged: (val) => setState(() => _informant = val),
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
        onChanged: (val) => setState(() => _historyReliability = val),
      ),
      const SizedBox.shrink(),
      const SizedBox.shrink(),
    ]);
  }

}
