import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// A [ReactiveTextField] wrapper that enforces the Cliniqara design system.
///
/// Presentation-layer only — imports only `flutter`, `flutter_screenutil`,
/// and `reactive_forms`. No domain or data imports.
///
/// Usage:
/// ```dart
/// ReactiveCustomTextField(
///   formControlName: 'chiefComplaint',
///   labelText: 'Chief Complaint',
///   hintText: 'Describe the main presenting complaint...',
///   maxLines: 3,
/// )
/// ```
class ReactiveCustomTextField<T> extends StatelessWidget {
  const ReactiveCustomTextField({
    super.key,
    required this.formControlName,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.maxLines = 1,
    this.minLines,
    this.validationMessages,
    this.readOnly = false,
    this.onChanged,
  });

  /// The key of the control in the nearest [ReactiveForm].
  final String formControlName;

  /// Label floating above the field when focused.
  final String? labelText;

  /// Placeholder shown when the field is empty.
  final String? hintText;

  /// Optional icon at the start of the field.
  final IconData? prefixIcon;

  /// Optional widget at the end of the field (e.g., unit label).
  final Widget? suffixIcon;

  /// Keyboard type (default: text).
  final TextInputType? keyboardType;

  /// Max lines for multiline fields (default: 1).
  final int maxLines;

  /// Min lines for multiline fields.
  final int? minLines;

  /// Map of validation keys → human-readable messages.
  final Map<String, String Function(Object)>? validationMessages;

  /// Prevents editing when `true`.
  final bool readOnly;

  /// Optional callback when the value changes.
  final void Function(FormControl<T>)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: ReactiveTextField<T>(
        formControlName: formControlName,
        keyboardType: keyboardType,
        maxLines: maxLines,
        minLines: minLines,
        readOnly: readOnly,
        onChanged: onChanged,
        validationMessages: validationMessages,
        style: TextStyle(
          fontSize: 14.sp,
          color: const Color(0xFF1A202C),
        ),
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          // ScreenUtil-scaled icons
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, size: 18.sp, color: const Color(0xFF6B7280))
              : null,
          suffixIcon: suffixIcon,
          // Inherit border/fill from the global InputDecorationTheme defined
          // in AppTheme — no override needed here to stay consistent.
        ),
      ),
    );
  }
}
