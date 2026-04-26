import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ─── Patient Data Model (Presentation-layer only) ─────────────────────────────
/// Lightweight value object holding display-ready patient info.
///
/// This is intentionally a **presentation-layer** data holder — it is NOT
/// a Domain Entity. It carries no business logic and imports nothing from
/// the data or domain layers, satisfying the Clean Architecture boundary rule.
///
/// The OSCE form Cubit will map the Domain [PatientEntity] → [PatientHeaderData]
/// before handing it to [StickyPatientHeader].
class PatientHeaderData {
  const PatientHeaderData({
    required this.name,
    required this.ageLabel,
    required this.gender,
  });

  /// Full patient name, e.g. "Ahmad Al-Rashidi".
  final String name;

  /// Pre-formatted age string, e.g. "34 yrs" or "8 m".
  final String ageLabel;

  /// Gender string, e.g. "Male" / "Female" / "Other".
  final String gender;

  /// Dummy data used during development and widget tests.
  static const PatientHeaderData dummy = PatientHeaderData(
    name: 'Ahmad Al-Rashidi',
    ageLabel: '34 yrs',
    gender: 'Male',
  );
}

// ─── Delegate ─────────────────────────────────────────────────────────────────
/// [SliverPersistentHeaderDelegate] that renders a solid Teal patient info bar.
///
/// Pin this delegate in a [CustomScrollView] so it sticks below the [SliverAppBar]
/// and remains visible as the form sections scroll underneath.
///
/// Sizing:
/// * Collapsed height: 52.h  — enough for the one-row summary.
/// * Expanded height:  64.h  — slightly taller when at the top of the scroll.
///
/// Usage:
/// ```dart
/// CustomScrollView(
///   slivers: [
///     SliverPersistentHeader(
///       pinned: true,
///       delegate: StickyPatientHeaderDelegate(data: PatientHeaderData.dummy),
///     ),
///     // ... form slivers
///   ],
/// )
/// ```
class StickyPatientHeaderDelegate extends SliverPersistentHeaderDelegate {
  const StickyPatientHeaderDelegate({required this.data});

  /// Patient display data.
  final PatientHeaderData data;

  // ── Size contracts ──────────────────────────────────────────────────────────
  @override
  double get minExtent => 52.h;

  @override
  double get maxExtent => 64.h;

  // ── Build ───────────────────────────────────────────────────────────────────
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // Interpolation factor: 0.0 = fully expanded, 1.0 = fully collapsed.
    final double t = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

    return Material(
      // Solid teal — matches AppTheme primary (`#2C7A7B`).
      color: const Color(0xFF2C7A7B),
      elevation: overlapsContent ? 4 : 0,
      shadowColor: Colors.black26,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        child: Row(
          children: [
            // ── Avatar initial ─────────────────────────────────────────────
            CircleAvatar(
              radius: Tween<double>(begin: 22, end: 17)
                      .transform(t)
                      .r,
              backgroundColor: Colors.white24,
              child: Text(
                data.name.isNotEmpty ? data.name[0].toUpperCase() : '?',
                style: TextStyle(
                  fontSize: Tween<double>(begin: 16, end: 13)
                      .transform(t)
                      .sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(width: 12.w),

            // ── Name + meta row ────────────────────────────────────────────
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Tween<double>(begin: 15, end: 13)
                          .transform(t)
                          .sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.2,
                    ),
                  ),
                  // Hide meta row when fully collapsed to keep it compact.
                  if (t < 0.9)
                    SizedBox(height: 2.h),
                  if (t < 0.9)
                    Row(
                      children: [
                        _MetaChip(label: data.ageLabel),
                        SizedBox(width: 6.w),
                        _MetaChip(label: data.gender),
                      ],
                    ),
                ],
              ),
            ),

            // ── OSCE indicator badge ────────────────────────────────────────
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                'OSCE',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Rebuild policy ──────────────────────────────────────────────────────────
  @override
  bool shouldRebuild(StickyPatientHeaderDelegate oldDelegate) =>
      oldDelegate.data.name != data.name ||
      oldDelegate.data.ageLabel != data.ageLabel ||
      oldDelegate.data.gender != data.gender;
}

// ─── Private helpers ──────────────────────────────────────────────────────────
/// A small pill chip used in the patient header meta row.
class _MetaChip extends StatelessWidget {
  const _MetaChip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white70,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}
