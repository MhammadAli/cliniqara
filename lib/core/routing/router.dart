import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ─── Route Path Constants ──────────────────────────────────────────────────
/// Named route paths. Use these constants everywhere instead of raw strings
/// to catch typos at compile time.
abstract final class AppRoutes {
  static const String splash = '/';
  static const String osceForm = '/osce_form';
}

// ─── Router Configuration ──────────────────────────────────────────────────
/// The application's [GoRouter] instance.
///
/// Add new routes here as features are implemented. Routes are listed in the
/// same order as [AppRoutes] constants for easy cross-referencing.
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  debugLogDiagnostics: true, // Remove or set false for production.
  routes: [
    // ── Splash ──────────────────────────────────────────────────────────────
    GoRoute(
      path: AppRoutes.splash,
      name: 'splash',
      builder: (BuildContext context, GoRouterState state) {
        // TODO(phase-2): Replace with real SplashPage once implemented.
        return const _SplashPlaceholder();
      },
    ),

    // ── OSCE Form ────────────────────────────────────────────────────────────
    GoRoute(
      path: AppRoutes.osceForm,
      name: 'osceForm',
      builder: (BuildContext context, GoRouterState state) {
        // TODO(phase-2): Replace with real OsceFormPage once implemented.
        // Pass patient data via GoRouterState.extra or path params.
        return const _OsceFormPlaceholder();
      },
    ),
  ],
);

// ─── Placeholder Screens ───────────────────────────────────────────────────
// These are temporary scaffolds. Delete once real pages are created.

class _SplashPlaceholder extends StatelessWidget {
  const _SplashPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Cliniqara',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.osceForm),
              child: const Text('Go to OSCE Form (dev)'),
            ),
          ],
        ),
      ),
    );
  }
}

class _OsceFormPlaceholder extends StatelessWidget {
  const _OsceFormPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OSCE Form')),
      body: const Center(
        child: Text('OSCE Form — Coming in Phase 2'),
      ),
    );
  }
}
