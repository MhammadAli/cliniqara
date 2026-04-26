import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cliniqara/core/presentation/collapsible_section_card.dart';
import 'package:cliniqara/core/presentation/reactive_custom_text_field.dart';
import 'package:cliniqara/features/osce_form/presentation/osce_form_cubit.dart';

class VitalsCard extends StatelessWidget {
  const VitalsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CollapsibleSectionCard(
      title: 'Vitals',
      initiallyExpanded: false,
      children: [
        Row(
          children: [
            Expanded(
              child: ReactiveCustomTextField<int>(
                formControlName: '${OsceFormKeys.vitals}.${OsceFormKeys.bpSystolic}',
                labelText: 'BP Systolic',
                keyboardType: TextInputType.number,
                suffixIcon: _buildUnit('mmHg'),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: ReactiveCustomTextField<int>(
                formControlName: '${OsceFormKeys.vitals}.${OsceFormKeys.bpDiastolic}',
                labelText: 'BP Diastolic',
                keyboardType: TextInputType.number,
                suffixIcon: _buildUnit('mmHg'),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ReactiveCustomTextField<int>(
                formControlName: '${OsceFormKeys.vitals}.${OsceFormKeys.heartRate}',
                labelText: 'Heart Rate',
                keyboardType: TextInputType.number,
                suffixIcon: _buildUnit('bpm'),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: ReactiveCustomTextField<double>(
                formControlName: '${OsceFormKeys.vitals}.${OsceFormKeys.temperature}',
                labelText: 'Temperature',
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                suffixIcon: _buildUnit('°C'),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ReactiveCustomTextField<int>(
                formControlName: '${OsceFormKeys.vitals}.${OsceFormKeys.respiratoryRate}',
                labelText: 'Resp Rate',
                keyboardType: TextInputType.number,
                suffixIcon: _buildUnit('bpm'),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: ReactiveCustomTextField<int>(
                formControlName: '${OsceFormKeys.vitals}.${OsceFormKeys.spo2}',
                labelText: 'SpO2',
                keyboardType: TextInputType.number,
                suffixIcon: _buildUnit('%'),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ReactiveCustomTextField<double>(
                formControlName: '${OsceFormKeys.vitals}.${OsceFormKeys.bloodGlucose}',
                labelText: 'Blood Glucose',
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                suffixIcon: _buildUnit('mmol/L'),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: ReactiveCustomTextField<double>(
                formControlName: '${OsceFormKeys.vitals}.${OsceFormKeys.weight}',
                labelText: 'Weight',
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                suffixIcon: _buildUnit('kg'),
              ),
            ),
          ],
        ),
        ReactiveCustomTextField<double>(
          formControlName: '${OsceFormKeys.vitals}.${OsceFormKeys.height}',
          labelText: 'Height',
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          suffixIcon: _buildUnit('cm'),
        ),
      ],
    );
  }

  Widget _buildUnit(String unit) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            unit,
            style: TextStyle(
              color: const Color(0xFF6B7280),
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
