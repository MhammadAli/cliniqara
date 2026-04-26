import 'package:cliniqara/core/database/app_database.dart';
import 'package:cliniqara/features/osce_form/presentation/osce_form_cubit.dart';
import 'package:cliniqara/features/patients/data/repositories/patient_repository_impl.dart';
import 'package:cliniqara/features/patients/domain/repositories/patient_repository.dart';
import 'package:cliniqara/features/pediatric/domain/usecases/calculate_pediatric_status.dart';
import 'package:cliniqara/features/pediatric/domain/usecases/immunization_calculator.dart';
import 'package:get_it/get_it.dart';

/// Global service locator instance.
/// Access via [getIt<T>()] throughout the app.
final GetIt getIt = GetIt.instance;

/// Initializes all dependencies in the service locator.
///
/// Call this once in [main] before [runApp].
/// Dependencies are registered in dependency order (data layer first, then
/// domain, then presentation).
Future<void> initDependencies() async {
  // ─── Database ──────────────────────────────────────────────────────────────
  // Singleton: only one database connection must exist for the app lifetime.
  getIt.registerSingleton<AppDatabase>(AppDatabase());

  // ─── Repositories ──────────────────────────────────────────────────────────
  // Lazy singleton: constructed once on first use; reused thereafter.
  getIt.registerLazySingleton<PatientRepository>(
    () => PatientRepositoryImpl(getIt<AppDatabase>()),
  );

  // ─── Use Cases ─────────────────────────────────────────────────────────────
  getIt.registerLazySingleton<CalculatePediatricStatus>(
    () => CalculatePediatricStatus(),
  );
  getIt.registerLazySingleton<ImmunizationCalculator>(
    () => ImmunizationCalculator(),
  );

  // ─── Cubits / Blocs ────────────────────────────────────────────────────────
  // Factory: each route push gets a fresh Cubit with clean state.
  // [param1] = patientId (required), [param2] = existing visitId (optional).
  getIt.registerFactoryParam<OsceFormCubit, String, String?>(
    (patientId, existingVisitId) => OsceFormCubit(
      repository: getIt<PatientRepository>(),
      calculatePediatricStatus: getIt<CalculatePediatricStatus>(),
      immunizationCalculator: getIt<ImmunizationCalculator>(),
      patientId: patientId,
      existingVisitId: existingVisitId,
    ),
  );
}
