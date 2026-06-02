import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.isRequired = false,
  });

  final String title;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        if (isRequired)
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(
              '*',
              style: theme.textTheme.titleMedium?.copyWith(
                color: AppColors.error,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
