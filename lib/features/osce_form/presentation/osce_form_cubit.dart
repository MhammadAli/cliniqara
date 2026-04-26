import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uuid/uuid.dart';

import 'package:cliniqara/features/patients/domain/entities/visit_entity.dart';
import 'package:cliniqara/features/patients/domain/repositories/patient_repository.dart';

import 'package:cliniqara/features/pediatric/domain/usecases/calculate_pediatric_status.dart';
import 'package:cliniqara/features/pediatric/domain/usecases/immunization_calculator.dart';

import 'package:cliniqara/features/osce_form/presentation/osce_form_state.dart';

/// Keys used as [FormControl] names throughout the OSCE form.
///
/// Centralised here so both the Cubit and the UI reference the same strings,
/// avoiding typo-induced runtime errors.
abstract final class OsceFormKeys {
  static const chiefComplaint = 'chiefComplaint';

  // ── Vitals ──────────────────────────────────────────────────────────────────
  static const vitals = 'vitals';
  static const bpSystolic = 'bpSystolic';
  static const bpDiastolic = 'bpDiastolic';
  static const heartRate = 'heartRate';
  static const temperature = 'temperature';
  static const respiratoryRate = 'respiratoryRate';
  static const spo2 = 'spo2';
  static const bloodGlucose = 'bloodGlucose';
  static const weight = 'weight';
  static const height = 'height';

  // ── General Inspection ──────────────────────────────────────────────────────
  static const generalInspection = 'generalInspection';
  static const appearance = 'appearance';
  static const consciousness = 'consciousness';
  static const distress = 'distress';
  static const nutrition = 'nutrition';
  static const hydration = 'hydration';

  // ── HPI Analysis (dynamic) ─────────────────────────────────────────────────
  static const hpiAnalysis = 'hpiAnalysis';
  static const severity = 'severity';
  static const radiation = 'radiation';

  // ── Patient Info ────────────────────────────────────────────────────────────
  static const dateOfBirth = 'dateOfBirth';

  // ── Pediatric History (dynamic) ───────────────────────────────────────────
  static const pediatricHistory = 'pediatricHistory';
  static const developmentalMilestones = 'developmentalMilestones';
  static const immunizations = 'immunizations';
}

/// Manages the reactive form state for the entire OSCE clinical form.
///
/// Architecture note — this Cubit only depends on:
///   • **Domain** entities ([VisitEntity]) and the **Domain** repository
///     interface ([PatientRepository]).
///   • **reactive_forms** for form state (presentation-layer concern).
///
/// It does **NOT** import any Drift/database models, satisfying the
/// strict Clean Architecture boundary.
class OsceFormCubit extends Cubit<OsceFormState> {
  OsceFormCubit({
    required PatientRepository repository,
    required CalculatePediatricStatus calculatePediatricStatus,
    required ImmunizationCalculator immunizationCalculator,
    required String patientId,
    String? existingVisitId,
  }) : _repository = repository,
       _calculatePediatricStatus = calculatePediatricStatus,
       _immunizationCalculator = immunizationCalculator,
       _patientId = patientId,
       _visitId = existingVisitId ?? const Uuid().v4(),
       super(OsceFormState(visitId: existingVisitId)) {
    _listenToChiefComplaint();
    _listenToDateOfBirth();
  }

  final PatientRepository _repository;
  final CalculatePediatricStatus _calculatePediatricStatus;
  final ImmunizationCalculator _immunizationCalculator;
  final String _patientId;
  final String _visitId;
  StreamSubscription<dynamic>? _chiefComplaintSub;
  StreamSubscription<dynamic>? _dobSub;

  // ─── Reactive Form ────────────────────────────────────────────────────────

  /// The single [FormGroup] that owns all clinical form controls.
  ///
  /// Exposed publicly so that `ReactiveForm` ancestor widgets in the UI
  /// can bind to it.
  late final FormGroup form = FormGroup({
    OsceFormKeys.chiefComplaint: FormControl<String>(
      validators: [Validators.required],
    ),
    OsceFormKeys.dateOfBirth: FormControl<DateTime>(),

    // ── Vitals ────────────────────────────────────────────────────────────
    OsceFormKeys.vitals: FormGroup({
      OsceFormKeys.bpSystolic: FormControl<int>(),
      OsceFormKeys.bpDiastolic: FormControl<int>(),
      OsceFormKeys.heartRate: FormControl<int>(),
      OsceFormKeys.temperature: FormControl<double>(),
      OsceFormKeys.respiratoryRate: FormControl<int>(),
      OsceFormKeys.spo2: FormControl<int>(),
      OsceFormKeys.bloodGlucose: FormControl<double>(),
      OsceFormKeys.weight: FormControl<double>(),
      OsceFormKeys.height: FormControl<double>(),
    }),

    // ── General Inspection (all default to 'Normal') ──────────────────────
    OsceFormKeys.generalInspection: FormGroup({
      OsceFormKeys.appearance: FormControl<String>(value: 'Normal'),
      OsceFormKeys.consciousness: FormControl<String>(value: 'Normal'),
      OsceFormKeys.distress: FormControl<String>(value: 'Normal'),
      OsceFormKeys.nutrition: FormControl<String>(value: 'Normal'),
      OsceFormKeys.hydration: FormControl<String>(value: 'Normal'),
    }),
  });

  // ─── Dynamic HPI Logic ────────────────────────────────────────────────────

  /// Subscribes to [chiefComplaint] changes and dynamically adds/removes
  /// the `hpiAnalysis` sub-group based on the selected complaint.
  void _listenToChiefComplaint() {
    final control = form.control(OsceFormKeys.chiefComplaint);

    _chiefComplaintSub = control.valueChanges.listen((value) {
      final complaint = value as String?;
      _handleComplaintChanged(complaint);
    });
  }

  /// If the chief complaint is **'Pain'**, ensure the `hpiAnalysis` group
  /// exists with `severity` and `radiation` controls.  Otherwise, remove it.
  void _handleComplaintChanged(String? complaint) {
    if (complaint == 'Pain') {
      _addHpiAnalysis();
    } else {
      _removeHpiAnalysis();
    }
  }

  void _addHpiAnalysis() {
    if (form.contains(OsceFormKeys.hpiAnalysis)) return;

    form.addAll({
      OsceFormKeys.hpiAnalysis: FormGroup({
        OsceFormKeys.severity: FormControl<String>(),
        OsceFormKeys.radiation: FormControl<String>(),
      }),
    });
  }

  void _removeHpiAnalysis() {
    if (!form.contains(OsceFormKeys.hpiAnalysis)) return;
    form.removeControl(OsceFormKeys.hpiAnalysis);
  }

  // ─── Dynamic Pediatric Logic ──────────────────────────────────────────────

  void _listenToDateOfBirth() {
    final control = form.control(OsceFormKeys.dateOfBirth);
    _dobSub = control.valueChanges.listen((value) {
      if (value is DateTime) {
        _handleDateOfBirthChanged(value);
      } else {
        _removePediatricHistory();
      }
    });
  }

  void _handleDateOfBirthChanged(DateTime dob) {
    final isPediatric = _calculatePediatricStatus(dob);
    if (isPediatric) {
      _addPediatricHistory(dob);
    } else {
      _removePediatricHistory();
    }
  }

  void _addPediatricHistory(DateTime dob) {
    if (form.contains(OsceFormKeys.pediatricHistory)) {
      form.removeControl(OsceFormKeys.pediatricHistory);
    }

    final now = DateTime.now();
    int years = now.year - dob.year;
    int months = now.month - dob.month;
    int days = now.day - dob.day;
    if (days < 0) {
      final prevMonth = DateTime(now.year, now.month, 0);
      days += prevMonth.day;
      months--;
    }
    if (months < 0) {
      months += 12;
      years--;
    }

    final recommendations = _immunizationCalculator(
      years: years,
      months: months,
      days: days,
    );

    final immunizationControls = <String, FormControl<String>>{};
    for (final rec in recommendations) {
      immunizationControls[rec.vaccine] = FormControl<String>(
        value: rec.status.name,
      );
    }

    form.addAll({
      OsceFormKeys.pediatricHistory: FormGroup({
        OsceFormKeys.developmentalMilestones: FormControl<String>(),
        OsceFormKeys.immunizations: FormGroup(immunizationControls),
      }),
    });
  }

  void _removePediatricHistory() {
    if (!form.contains(OsceFormKeys.pediatricHistory)) return;
    form.removeControl(OsceFormKeys.pediatricHistory);
  }

  // ─── Persistence ──────────────────────────────────────────────────────────

  /// Serialises the current [form] value to JSON and persists it via the
  /// domain [PatientRepository].
  ///
  /// Emits [OsceFormStatus.saving] → [OsceFormStatus.saved] on success,
  /// or [OsceFormStatus.error] on failure.
  Future<void> saveForm() async {
    if (!form.valid) {
      form.markAllAsTouched();
      return;
    }

    emit(state.copyWith(status: OsceFormStatus.saving));

    try {
      final payload = jsonEncode(form.value);

      // Extract chief complaint from the form value map.
      final mainComplaint =
          form.control(OsceFormKeys.chiefComplaint).value as String?;

      final visit = VisitEntity.create(
        id: _visitId,
        patientId: _patientId,
        mainComplaint: mainComplaint,
        clinicalPayloadJson: payload,
      );

      await _repository.createVisitWithPayload(visit);

      emit(state.copyWith(status: OsceFormStatus.saved, visitId: _visitId));
    } catch (e) {
      emit(
        state.copyWith(
          status: OsceFormStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  // ─── Lifecycle ────────────────────────────────────────────────────────────

  @override
  Future<void> close() {
    _chiefComplaintSub?.cancel();
    _dobSub?.cancel();
    form.dispose();
    return super.close();
  }
}
