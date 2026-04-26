import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cliniqara/core/di/di.dart';
import 'package:cliniqara/features/osce_form/presentation/osce_form_screen.dart';
import 'package:cliniqara/features/osce_form/presentation/osce_form_cubit.dart';
import 'package:cliniqara/features/patients/domain/repositories/patient_repository.dart';

// ─── Route Path Constants ──────────────────────────────────────────────────
/// Named route paths. Use these constants everywhere instead of raw strings
/// to catch typos at compile time.
abstract final class AppRoutes {
  static const String osceForm = '/osce_form';
}

// ─── Router Configuration ──────────────────────────────────────────────────
/// The application's [GoRouter] instance.
///
/// Add new routes here as features are implemented. Routes are listed in the
/// same order as [AppRoutes] constants for easy cross-referencing.
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.osceForm,
  debugLogDiagnostics: true, // Remove or set false for production.
  routes: [
    // ── OSCE Form ────────────────────────────────────────────────────────────
    GoRoute(
      path: AppRoutes.osceForm,
      name: 'osceForm',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider<OsceFormCubit>(
          create: (BuildContext context) => OsceFormCubit(
            repository: getIt<PatientRepository>(),
            calculatePediatricStatus: getIt(),
            immunizationCalculator: getIt(),
            patientId: 'dummy_123',
          ),
          child: const OsceFormScreen(),
        );
      },
    ),
  ],
);
