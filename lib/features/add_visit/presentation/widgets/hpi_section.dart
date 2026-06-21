import 'package:flutter/material.dart';
import '../../domain/entities/hpi.dart';
import '../../../../core/presentation/widgets/collapsible_section.dart';

import 'hpi_sub_sections/analysis_of_complaint_section.dart';
import 'hpi_sub_sections/associated_symptoms_section.dart';
import 'hpi_sub_sections/complaint_type_section.dart';
import 'hpi_sub_sections/related_system_symptoms_section.dart';
import 'hpi_sub_sections/systemic_review_accordion_section.dart';

class HpiSection extends StatelessWidget {
  final Hpi? initialData;
  final ValueChanged<Hpi> onChanged;

  const HpiSection({
    super.key,
    this.initialData,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final currentHpi = initialData ?? const Hpi();

    return CollapsibleSection(
      title: 'HPI (History of Present Illness)',
      stepNumber: 3,
      icon: Icons.history,
      initiallyExpanded: false,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnalysisOfComplaintSection(
            initialData: currentHpi.analysis,
            onChanged: (analysis) {
              onChanged(currentHpi.copyWith(analysis: analysis));
            },
          ),
          AssociatedSymptomsSection(
            initialData: currentHpi,
            onChanged: (hpi) {
              // The AssociatedSymptomsSection passes back the whole Hpi, but only updates its fields
              onChanged(currentHpi.copyWith(
                associatedSymptoms: hpi.associatedSymptoms,
                aggravatingFactors: hpi.aggravatingFactors,
                relievingFactors: hpi.relievingFactors,
                effectOfTreatment: hpi.effectOfTreatment,
              ));
            },
          ),
          ComplaintTypeSection(
            initialData: currentHpi.complaintTypeDetails,
            onChanged: (details) {
              onChanged(currentHpi.copyWith(complaintTypeDetails: details));
            },
          ),
          RelatedSystemSymptomsSection(
            initialRelatedSystems: currentHpi.relatedSystemSymptoms,
            initialDetails: currentHpi.relatedSystemSymptomsDetails,
            onChanged: (systems, details) {
              onChanged(currentHpi.copyWith(
                relatedSystemSymptoms: systems,
                relatedSystemSymptomsDetails: details,
              ));
            },
          ),
          SystemicReviewAccordionSection(
            initialSystemicReview: currentHpi.systemicReview,
            disabledSystems: currentHpi.relatedSystemSymptoms,
            onChanged: (review) {
              onChanged(currentHpi.copyWith(
                systemicReview: review,
              ));
            },
          ),
        ],
      ),
    );
  }
}
