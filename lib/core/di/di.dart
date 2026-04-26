import 'package:cliniqara/core/database/app_database.dart';
import 'package:cliniqara/features/patients/data/repositories/patient_repository_impl.dart';
import 'package:cliniqara/features/patients/domain/repositories/patient_repository.dart';
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
  // TODO(phase-3): Register use cases here.
  // Example:
  // getIt.registerLazySingleton<CreatePatientUseCase>(
  //   () => CreatePatientUseCase(getIt<PatientRepository>()),
  // );

  // ─── Cubits / Blocs ────────────────────────────────────────────────────────
  // TODO(phase-3): Register Cubits as factories here.
  // Cubits MUST be factories (not singletons) so each route push gets a
  // fresh instance with a clean state.
  // Example:
  // getIt.registerFactory<OsceFormCubit>(
  //   () => OsceFormCubit(getIt<PatientRepository>()),
  // );
}
