import 'package:get_it/get_it.dart';
import 'package:drift/native.dart';
import '../../data/datasources/local/app_database.dart';
import '../../data/repositories/patient_repository_impl.dart';
import '../../domain/repositories/patient_repository.dart';
import '../../presentation/cubits/patient_registration/patient_registration_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubits
  sl.registerFactory(() => PatientRegistrationCubit(repository: sl()));

  // Repositories
  sl.registerLazySingleton<PatientRepository>(
    () => PatientRepositoryImpl(database: sl()),
  );

  // Data sources
  // Using NativeDatabase.memory() by default for the setup as DI root schema demands a query executor
  sl.registerLazySingleton<AppDatabase>(
    () => AppDatabase(NativeDatabase.memory()),
  );
}
