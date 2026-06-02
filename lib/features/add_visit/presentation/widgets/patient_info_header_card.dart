import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

class PatientInfoHeaderCard extends StatelessWidget {
  final String patientName;
  final int age;
  final String ageUnit;
  final String gender;
  final String activeSection;
  final ValueChanged<String> onSectionChanged;

  const PatientInfoHeaderCard({
    super.key,
    required this.patientName,
    required this.age,
    this.ageUnit = 'Years',
    required this.gender,
    required this.activeSection,
    required this.onSectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopRow(theme),
          const SizedBox(height: 16),
          const Divider(color: AppColors.border, height: 1),
          const SizedBox(height: 16),
          _buildBottomRow(theme),
        ],
      ),
    );
  }

  Widget _buildTopRow(ThemeData theme) {
    return Row(
      children: [
        // Avatar
        Container(
          width: 56,
          height: 56,
          decoration: const BoxDecoration(
            color: AppColors.primaryLight,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.person, color: AppColors.primary, size: 32),
        ),
        const SizedBox(width: 16),

        // Name
        Expanded(
          child: Text(
            patientName,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              height: 1.2,
            ),
          ),
        ),
        const SizedBox(width: 16),

        // Age Info
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Age',
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              age.toString(),
              style: theme.textTheme.titleMedium?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              ageUnit,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(width: 24),

        // Gender Info
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Gender',
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              gender,
              style: theme.textTheme.titleMedium?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16), // to align baseline roughly with age
          ],
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildBottomRow(ThemeData theme) {
    return Row(
      children: [
        Text(
          'Jump to:',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _JumpToChip(
                label: 'Personal',
                icon: Icons.person_outline,
                isActive: activeSection == 'Personal',
                onTap: () => onSectionChanged('Personal'),
              ),
              _JumpToChip(
                label: 'HPI',
                icon: Icons.description_outlined,
                isActive: activeSection == 'HPI',
                onTap: () => onSectionChanged('HPI'),
              ),
              _JumpToChip(
                label: 'Exam',
                icon: Icons.favorite_border,
                isActive: activeSection == 'Exam',
                onTap: () => onSectionChanged('Exam'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _JumpToChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _JumpToChip({
    required this.label,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = isActive ? AppColors.primary : AppColors.textSecondary;
    final borderColor = isActive ? AppColors.primary : AppColors.border;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: borderColor),
            color: isActive
                ? AppColors.primary.withAlpha(10)
                : AppColors.surface, // slight tint for active
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18, color: color),
              const SizedBox(width: 6),
              Text(
                label,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: color,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
