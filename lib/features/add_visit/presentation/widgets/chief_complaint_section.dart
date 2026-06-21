import 'package:flutter/material.dart';
import '../../../../core/presentation/widgets/collapsible_section.dart';
import '../../../../core/presentation/widgets/cliniqara_text_field.dart';
import '../../../../core/presentation/widgets/cliniqara_segmented_control.dart';
import '../../../../core/presentation/widgets/cliniqara_chip.dart';

class ChiefComplaintSection extends StatefulWidget {
  const ChiefComplaintSection({super.key});

  @override
  State<ChiefComplaintSection> createState() => _ChiefComplaintSectionState();
}

class _ChiefComplaintSectionState extends State<ChiefComplaintSection> {
  String? _durationUnit = 'Days';
  final List<String> _selectedComplaints = [];

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
        crossAxisAlignment: CrossAxisAlignment.end,
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

  @override
  Widget build(BuildContext context) {
    return CollapsibleSection(
      title: 'Chief Complaint',
      stepNumber: 2,
      icon: Icons.chat_bubble_outline,
      initiallyExpanded: true,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMainComplaintRow(context),
          const SizedBox(height: 16),
          _buildSuggestedChips(context),
          const SizedBox(height: 16),
          _buildDurationRow(context),
          const SizedBox(height: 24),
          _buildSelectedComplaints(context),
        ],
      ),
    );
  }

  Widget _buildMainComplaintRow(BuildContext context) {
    return _buildResponsiveRow(context, [
      const CliniqaraTextField(
        label: 'Main Complaint',
        hintText: 'Search or enter main complaint',
        prefixIcon: Icon(Icons.search, size: 20),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24), // alignment spacer for mobile
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Add Custom'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
      const SizedBox.shrink(),
    ]);
  }

  Widget _buildSuggestedChips(BuildContext context) {
    final suggestions = ['Fever', 'Cough', 'Dyspnea', 'Chest Pain'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Suggested:',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: suggestions.map((s) {
            final isSelected = _selectedComplaints.contains(s);
            return CliniqaraChip(
              label: s,
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  if (isSelected) {
                    _selectedComplaints.remove(s);
                  } else {
                    _selectedComplaints.add(s);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDurationRow(BuildContext context) {
    return _buildResponsiveRow(context, [
      const CliniqaraTextField(
        label: 'Duration',
        hintText: 'Enter duration',
        keyboardType: TextInputType.number,
      ),
      CliniqaraSegmentedControl<String>(
        label: '',
        items: const ['Hours', 'Days', 'Months', 'Years'],
        selectedValue: _durationUnit,
        itemLabelBuilder: (item) => item,
        onChanged: (val) => setState(() => _durationUnit = val),
      ),
      const SizedBox.shrink(),
    ]);
  }

  Widget _buildSelectedComplaints(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selected Complaint(s)',
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
          child: _selectedComplaints.isEmpty
              ? Text(
                  '* The first complaint added is automatically designated as the primary complaint.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.outline,
                    fontStyle: FontStyle.italic,
                  ),
                )
              : Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _selectedComplaints.map((c) {
                    return Chip(
                      label: Text(c),
                      deleteIcon: const Icon(Icons.close, size: 16),
                      onDeleted: () {
                        setState(() {
                          _selectedComplaints.remove(c);
                        });
                      },
                    );
                  }).toList(),
                ),
        ),
      ],
    );
  }
}
