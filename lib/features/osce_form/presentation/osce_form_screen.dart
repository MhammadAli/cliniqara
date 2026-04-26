import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:cliniqara/core/presentation/sticky_patient_header.dart';
import 'package:cliniqara/features/osce_form/presentation/osce_form_cubit.dart';
import 'package:cliniqara/features/osce_form/presentation/widgets/chief_complaint_card.dart';
import 'package:cliniqara/features/osce_form/presentation/widgets/general_inspection_card.dart';
import 'package:cliniqara/features/osce_form/presentation/widgets/hpi_analysis_card.dart';
import 'package:cliniqara/features/osce_form/presentation/widgets/vitals_card.dart';

class OsceFormScreen extends StatelessWidget {
  const OsceFormScreen({
    super.key,
    this.patientHeaderData = PatientHeaderData.dummy,
  });

  final PatientHeaderData patientHeaderData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text('OSCE Form'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              context.read<OsceFormCubit>().saveForm();
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyPatientHeaderDelegate(data: patientHeaderData),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16.w),
            sliver: SliverList.list(
              children: [
                ReactiveFormBuilder(
                  form: () => context.read<OsceFormCubit>().form,
                  builder: (context, form, child) {
                    return Column(
                      children: [
                        const ChiefComplaintCard(),
                        SizedBox(height: 16.h),
                        const HpiAnalysisCard(),
                        SizedBox(height: 16.h),
                        const VitalsCard(),
                        SizedBox(height: 16.h),
                        const GeneralInspectionCard(),
                        SizedBox(height: 40.h),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
