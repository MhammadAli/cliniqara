import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/cubits/patient_registration/patient_registration_cubit.dart';
import '../../presentation/screens/patient_registration_screen.dart';
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
  ],
);
