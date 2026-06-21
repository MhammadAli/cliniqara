import 'package:equatable/equatable.dart';

class Hpi extends Equatable {
  final ComplaintAnalysis? analysis;
  final List<String> associatedSymptoms;
  final String? aggravatingFactors;
  final String? relievingFactors;
  final EffectOfTreatment? effectOfTreatment;
  final ComplaintTypeDetails? complaintTypeDetails;
  final List<String> relatedSystemSymptoms;
  final Map<String, List<String>> relatedSystemSymptomsDetails;
  final Map<String, SystemReview> systemicReview;

  const Hpi({
    this.analysis,
    this.associatedSymptoms = const [],
    this.aggravatingFactors,
    this.relievingFactors,
    this.effectOfTreatment,
    this.complaintTypeDetails,
    this.relatedSystemSymptoms = const [],
    this.relatedSystemSymptomsDetails = const {},
    this.systemicReview = const {},
  });

  Hpi copyWith({
    ComplaintAnalysis? analysis,
    List<String>? associatedSymptoms,
    String? aggravatingFactors,
    String? relievingFactors,
    EffectOfTreatment? effectOfTreatment,
    ComplaintTypeDetails? complaintTypeDetails,
    List<String>? relatedSystemSymptoms,
    Map<String, List<String>>? relatedSystemSymptomsDetails,
    Map<String, SystemReview>? systemicReview,
  }) {
    return Hpi(
      analysis: analysis ?? this.analysis,
      associatedSymptoms: associatedSymptoms ?? this.associatedSymptoms,
      aggravatingFactors: aggravatingFactors ?? this.aggravatingFactors,
      relievingFactors: relievingFactors ?? this.relievingFactors,
      effectOfTreatment: effectOfTreatment ?? this.effectOfTreatment,
      complaintTypeDetails: complaintTypeDetails ?? this.complaintTypeDetails,
      relatedSystemSymptoms: relatedSystemSymptoms ?? this.relatedSystemSymptoms,
      relatedSystemSymptomsDetails: relatedSystemSymptomsDetails ?? this.relatedSystemSymptomsDetails,
      systemicReview: systemicReview ?? this.systemicReview,
    );
  }

  Map<String, dynamic> toJson() => {
        'analysis': analysis?.toJson(),
        'associatedSymptoms': associatedSymptoms,
        'aggravatingFactors': aggravatingFactors,
        'relievingFactors': relievingFactors,
        'effectOfTreatment': effectOfTreatment?.name,
        'complaintTypeDetails': complaintTypeDetails?.toJson(),
        'relatedSystemSymptoms': relatedSystemSymptoms,
        'relatedSystemSymptomsDetails': relatedSystemSymptomsDetails,
        'systemicReview': systemicReview.map((k, v) => MapEntry(k, v.toJson())),
      };

  factory Hpi.fromJson(Map<String, dynamic> json) {
    return Hpi(
      analysis: json['analysis'] != null ? ComplaintAnalysis.fromJson(json['analysis']) : null,
      associatedSymptoms: (json['associatedSymptoms'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      aggravatingFactors: json['aggravatingFactors'] as String?,
      relievingFactors: json['relievingFactors'] as String?,
      effectOfTreatment: json['effectOfTreatment'] != null
          ? EffectOfTreatment.values.firstWhere((e) => e.name == json['effectOfTreatment'])
          : null,
      complaintTypeDetails: json['complaintTypeDetails'] != null ? ComplaintTypeDetails.fromJson(json['complaintTypeDetails']) : null,
      relatedSystemSymptoms: (json['relatedSystemSymptoms'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      relatedSystemSymptomsDetails: (json['relatedSystemSymptomsDetails'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as List<dynamic>).map((v) => v as String).toList()),
          ) ??
          {},
      systemicReview: (json['systemicReview'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, SystemReview.fromJson(e as Map<String, dynamic>)),
          ) ??
          {},
    );
  }

  @override
  List<Object?> get props => [
        analysis,
        associatedSymptoms,
        aggravatingFactors,
        relievingFactors,
        effectOfTreatment,
        complaintTypeDetails,
        relatedSystemSymptoms,
        relatedSystemSymptomsDetails,
        systemicReview,
      ];
}

class ComplaintAnalysis extends Equatable {
  final String? onsetMode;
  final List<String> circumstancesAtOnset;
  final List<String> triggerAtOnset;
  final String? course;

  const ComplaintAnalysis({
    this.onsetMode,
    this.circumstancesAtOnset = const [],
    this.triggerAtOnset = const [],
    this.course,
  });

  ComplaintAnalysis copyWith({
    String? onsetMode,
    List<String>? circumstancesAtOnset,
    List<String>? triggerAtOnset,
    String? course,
  }) {
    return ComplaintAnalysis(
      onsetMode: onsetMode ?? this.onsetMode,
      circumstancesAtOnset: circumstancesAtOnset ?? this.circumstancesAtOnset,
      triggerAtOnset: triggerAtOnset ?? this.triggerAtOnset,
      course: course ?? this.course,
    );
  }

  Map<String, dynamic> toJson() => {
        'onsetMode': onsetMode,
        'circumstancesAtOnset': circumstancesAtOnset,
        'triggerAtOnset': triggerAtOnset,
        'course': course,
      };

  factory ComplaintAnalysis.fromJson(Map<String, dynamic> json) {
    return ComplaintAnalysis(
      onsetMode: json['onsetMode'] as String?,
      circumstancesAtOnset: (json['circumstancesAtOnset'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      triggerAtOnset: (json['triggerAtOnset'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      course: json['course'] as String?,
    );
  }

  @override
  List<Object?> get props => [onsetMode, circumstancesAtOnset, triggerAtOnset, course];
}

enum EffectOfTreatment {
  notTreated,
  improving,
  noChange,
  worsening,
}

abstract class ComplaintTypeDetails extends Equatable {
  final String type;
  const ComplaintTypeDetails(this.type);

  Map<String, dynamic> toJson();

  factory ComplaintTypeDetails.fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String?;
    switch (type) {
      case 'Pain':
        return PainDetails.fromJson(json);
      case 'Excreta':
        return ExcretaDetails.fromJson(json);
      case 'MassSwelling':
        return MassSwellingDetails.fromJson(json);
      case 'Other':
        return OtherComplaintDetails.fromJson(json);
      default:
        throw Exception('Unknown ComplaintTypeDetails type: $type');
    }
  }
}

class PainDetails extends ComplaintTypeDetails {
  final String? location;
  final List<String> character;
  final String? radiation;
  final int? severity;
  final List<String> timing;
  final List<String> postural;
  final List<String> diurnal;

  const PainDetails({
    this.location,
    this.character = const [],
    this.radiation,
    this.severity,
    this.timing = const [],
    this.postural = const [],
    this.diurnal = const [],
  }) : super('Pain');

  PainDetails copyWith({
    String? location,
    List<String>? character,
    String? radiation,
    int? severity,
    List<String>? timing,
    List<String>? postural,
    List<String>? diurnal,
  }) {
    return PainDetails(
      location: location ?? this.location,
      character: character ?? this.character,
      radiation: radiation ?? this.radiation,
      severity: severity ?? this.severity,
      timing: timing ?? this.timing,
      postural: postural ?? this.postural,
      diurnal: diurnal ?? this.diurnal,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'location': location,
        'character': character,
        'radiation': radiation,
        'severity': severity,
        'timing': timing,
        'postural': postural,
        'diurnal': diurnal,
      };

  factory PainDetails.fromJson(Map<String, dynamic> json) {
    return PainDetails(
      location: json['location'] as String?,
      character: (json['character'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      radiation: json['radiation'] as String?,
      severity: json['severity'] as int?,
      timing: (json['timing'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      postural: (json['postural'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      diurnal: (json['diurnal'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
    );
  }

  @override
  List<Object?> get props => [location, character, radiation, severity, timing, postural, diurnal];
}

class ExcretaDetails extends ComplaintTypeDetails {
  final String? amount;
  final String? color;
  final List<String> content;
  final String? consistency;
  final String? odor;
  final String? postural;
  final String? diurnal;

  const ExcretaDetails({
    this.amount,
    this.color,
    this.content = const [],
    this.consistency,
    this.odor,
    this.postural,
    this.diurnal,
  }) : super('Excreta');

  ExcretaDetails copyWith({
    String? amount,
    String? color,
    List<String>? content,
    String? consistency,
    String? odor,
    String? postural,
    String? diurnal,
  }) {
    return ExcretaDetails(
      amount: amount ?? this.amount,
      color: color ?? this.color,
      content: content ?? this.content,
      consistency: consistency ?? this.consistency,
      odor: odor ?? this.odor,
      postural: postural ?? this.postural,
      diurnal: diurnal ?? this.diurnal,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'amount': amount,
        'color': color,
        'content': content,
        'consistency': consistency,
        'odor': odor,
        'postural': postural,
        'diurnal': diurnal,
      };

  factory ExcretaDetails.fromJson(Map<String, dynamic> json) {
    return ExcretaDetails(
      amount: json['amount'] as String?,
      color: json['color'] as String?,
      content: (json['content'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      consistency: json['consistency'] as String?,
      odor: json['odor'] as String?,
      postural: json['postural'] as String?,
      diurnal: json['diurnal'] as String?,
    );
  }

  @override
  List<Object?> get props => [amount, color, content, consistency, odor, postural, diurnal];
}

class MassSwellingDetails extends ComplaintTypeDetails {
  final String? siteCharacteristics;
  final String? specificAnatomicalSite;
  final String? side;
  final List<String> distribution;
  final List<String> relationToStructures;
  final String? number;
  final String? pain;
  final String? sizeChange;
  final String? trauma;
  final String? infection;
  final String? effectOnFunction;

  const MassSwellingDetails({
    this.siteCharacteristics,
    this.specificAnatomicalSite,
    this.side,
    this.distribution = const [],
    this.relationToStructures = const [],
    this.number,
    this.pain,
    this.sizeChange,
    this.trauma,
    this.infection,
    this.effectOnFunction,
  }) : super('MassSwelling');

  MassSwellingDetails copyWith({
    String? siteCharacteristics,
    String? specificAnatomicalSite,
    String? side,
    List<String>? distribution,
    List<String>? relationToStructures,
    String? number,
    String? pain,
    String? sizeChange,
    String? trauma,
    String? infection,
    String? effectOnFunction,
  }) {
    return MassSwellingDetails(
      siteCharacteristics: siteCharacteristics ?? this.siteCharacteristics,
      specificAnatomicalSite: specificAnatomicalSite ?? this.specificAnatomicalSite,
      side: side ?? this.side,
      distribution: distribution ?? this.distribution,
      relationToStructures: relationToStructures ?? this.relationToStructures,
      number: number ?? this.number,
      pain: pain ?? this.pain,
      sizeChange: sizeChange ?? this.sizeChange,
      trauma: trauma ?? this.trauma,
      infection: infection ?? this.infection,
      effectOnFunction: effectOnFunction ?? this.effectOnFunction,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'siteCharacteristics': siteCharacteristics,
        'specificAnatomicalSite': specificAnatomicalSite,
        'side': side,
        'distribution': distribution,
        'relationToStructures': relationToStructures,
        'number': number,
        'pain': pain,
        'sizeChange': sizeChange,
        'trauma': trauma,
        'infection': infection,
        'effectOnFunction': effectOnFunction,
      };

  factory MassSwellingDetails.fromJson(Map<String, dynamic> json) {
    return MassSwellingDetails(
      siteCharacteristics: json['siteCharacteristics'] as String?,
      specificAnatomicalSite: json['specificAnatomicalSite'] as String?,
      side: json['side'] as String?,
      distribution: (json['distribution'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      relationToStructures: (json['relationToStructures'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      number: json['number'] as String?,
      pain: json['pain'] as String?,
      sizeChange: json['sizeChange'] as String?,
      trauma: json['trauma'] as String?,
      infection: json['infection'] as String?,
      effectOnFunction: json['effectOnFunction'] as String?,
    );
  }

  @override
  List<Object?> get props => [
        siteCharacteristics,
        specificAnatomicalSite,
        side,
        distribution,
        relationToStructures,
        number,
        pain,
        sizeChange,
        trauma,
        infection,
        effectOnFunction,
      ];
}

class OtherComplaintDetails extends ComplaintTypeDetails {
  final String details;

  const OtherComplaintDetails({required this.details}) : super('Other');

  OtherComplaintDetails copyWith({String? details}) {
    return OtherComplaintDetails(details: details ?? this.details);
  }

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'details': details,
      };

  factory OtherComplaintDetails.fromJson(Map<String, dynamic> json) {
    return OtherComplaintDetails(
      details: json['details'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [details];
}

class SystemReview extends Equatable {
  final List<String> selectedSymptoms;
  final String? otherFindings;

  const SystemReview({
    this.selectedSymptoms = const [],
    this.otherFindings,
  });

  SystemReview copyWith({
    List<String>? selectedSymptoms,
    String? otherFindings,
  }) {
    return SystemReview(
      selectedSymptoms: selectedSymptoms ?? this.selectedSymptoms,
      otherFindings: otherFindings ?? this.otherFindings,
    );
  }

  Map<String, dynamic> toJson() => {
        'selectedSymptoms': selectedSymptoms,
        'otherFindings': otherFindings,
      };

  factory SystemReview.fromJson(Map<String, dynamic> json) {
    return SystemReview(
      selectedSymptoms: (json['selectedSymptoms'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      otherFindings: json['otherFindings'] as String?,
    );
  }

  @override
  List<Object?> get props => [selectedSymptoms, otherFindings];
}
