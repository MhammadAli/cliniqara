import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A collapsible form section styled to sit flush on the off-white scaffold.
///
/// Wraps [ExpansionTile] with:
/// * Pure white surface (`Colors.white`) — zero elevation, no shadow.
/// * Rounded corners and a subtle border that blends with `#F3F4F6` background.
/// * Teal-accented leading icon and header text matching the design system.
/// * ScreenUtil-scaled sizing throughout.
///
/// Usage:
/// ```dart
/// CollapsibleSectionCard(
///   title: 'Chief Complaint',
///   leadingIcon: Icons.report_problem_outlined,
///   children: [ ... ],
/// )
/// ```
class CollapsibleSectionCard extends StatelessWidget {
  const CollapsibleSectionCard({
    super.key,
    required this.title,
    required this.children,
    this.leadingIcon,
    this.initiallyExpanded = false,
    this.onExpansionChanged,
  });

  /// Section header text displayed in the tile.
  final String title;

  /// Child widgets rendered inside the expanded body.
  final List<Widget> children;

  /// Optional icon shown to the left of [title].
  final IconData? leadingIcon;

  /// Whether the section starts expanded. Defaults to `false`.
  final bool initiallyExpanded;

  /// Callback fired when the expansion state changes.
  final ValueChanged<bool>? onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFE5E7EB), // outlineVariant from theme
          width: 1,
        ),
        // Explicit zero elevation — no BoxShadow list means no shadow.
      ),
      // ClipRRect ensures children respect the rounded corners.
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Theme(
          // Override the ambient theme's ExpansionTile divider colour so the
          // internal divider is invisible and blends with the white surface.
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
          ),
          child: ExpansionTile(
            key: key,
            initiallyExpanded: initiallyExpanded,
            onExpansionChanged: onExpansionChanged,
            tilePadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            childrenPadding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            backgroundColor: Colors.white,
            collapsedBackgroundColor: Colors.white,
            iconColor: colors.primary,
            collapsedIconColor: const Color(0xFF6B7280), // textSecondary

            // ── Leading icon ────────────────────────────────────────────────
            leading: leadingIcon != null
                ? Icon(
                    leadingIcon,
                    size: 20.sp,
                    color: colors.primary,
                  )
                : null,

            // ── Header title ────────────────────────────────────────────────
            title: Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1A202C), // textPrimary
                letterSpacing: 0.1,
              ),
            ),

            // ── Expanded children ───────────────────────────────────────────
            children: children,
          ),
        ),
      ),
    );
  }
}
