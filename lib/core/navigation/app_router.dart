import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/registration/presentation/cubits/patient_registration/patient_registration_cubit.dart';
import '../../features/registration/presentation/screens/patient_registration_screen.dart';
import '../../features/add_visit/presentation/screens/add_visit_screen.dart';
import '../../features/add_visit/presentation/cubits/patient_info/patient_info_cubit.dart';
import '../di/injection_container.dart' as di;

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BlocProvider(
        create: (_) => di.sl<PatientRegistrationCubit>(),
        child: const PatientRegistrationScreen(),
      ),
    ),
    GoRoute(
      path: '/add-visit/:patientId',
      builder: (context, state) {
        final patientId = state.pathParameters['patientId'] ?? '';
        return BlocProvider(
          create: (_) => di.sl<PatientInfoCubit>()..fetchPatientInfo(patientId),
          child: AddVisitScreen(patientId: patientId),
        );
      },
    ),
  ],
);
