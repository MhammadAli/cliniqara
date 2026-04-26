import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// A [ReactiveDropdownField] wrapper that enforces the Cliniqara design system.
///
/// Presentation-layer only — imports only `flutter`, `flutter_screenutil`,
/// and `reactive_forms`. No domain or data imports.
///
/// [T] is the value type of each [DropdownMenuItem] (typically [String]).
///
/// Usage:
/// ```dart
/// ReactiveCustomDropdown<String>(
///   formControlName: 'gender',
///   labelText: 'Gender',
///   items: const ['Male', 'Female', 'Other'],
/// )
/// ```
class ReactiveCustomDropdown<T> extends StatelessWidget {
  const ReactiveCustomDropdown({
    super.key,
    required this.formControlName,
    required this.items,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.validationMessages,
    this.itemLabelBuilder,
  });

  /// The key of the control in the nearest [ReactiveForm].
  final String formControlName;

  /// The list of values to show as dropdown options.
  final List<T> items;

  /// Label floating above the dropdown when focused.
  final String? labelText;

  /// Placeholder shown when no item is selected.
  final String? hintText;

  /// Optional icon at the start of the dropdown field.
  final IconData? prefixIcon;

  /// Map of validation keys → human-readable messages.
  final Map<String, String Function(Object)>? validationMessages;

  /// Optional function to convert [T] into a display string.
  /// Falls back to `value.toString()` if not provided.
  final String Function(T value)? itemLabelBuilder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: ReactiveDropdownField<T>(
        formControlName: formControlName,
        validationMessages: validationMessages,
        style: TextStyle(
          fontSize: 14.sp,
          color: const Color(0xFF1A202C),
        ),
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, size: 18.sp, color: const Color(0xFF6B7280))
              : null,
          // Border/fill come from the global InputDecorationTheme in AppTheme.
        ),
        items: items
            .map(
              (value) => DropdownMenuItem<T>(
                value: value,
                child: Text(
                  itemLabelBuilder?.call(value) ?? value.toString(),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF1A202C),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
