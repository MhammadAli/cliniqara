import 'package:get_it/get_it.dart';

/// Global service locator instance.
/// Access via [getIt<T>()] throughout the app.
final GetIt getIt = GetIt.instance;

/// Initializes all dependencies in the service locator.
///
/// Call this once in [main] before [runApp].
/// Register dependencies in dependency order (data layer first, then domain,
/// then presentation).
Future<void> initDependencies() async {
  // ─── Database ──────────────────────────────────────────────────────────────
  // TODO(phase-2): Register AppDatabase singleton here.
  // Example:
  // getIt.registerSingleton<AppDatabase>(AppDatabase());

  // ─── Repositories ──────────────────────────────────────────────────────────
  // TODO(phase-2): Register repository implementations here.

  // ─── Use Cases ─────────────────────────────────────────────────────────────
  // TODO(phase-2): Register use cases here.

  // ─── Cubits / Blocs ────────────────────────────────────────────────────────
  // TODO(phase-2): Register Cubits as factories here.
  // Cubits should be registered as factories (not singletons) so each
  // navigation push gets a fresh instance.
  // Example:
  // getIt.registerFactory<OsceFormCubit>(
  //   () => OsceFormCubit(getIt<SaveVisitUseCase>()),
  // );
}
