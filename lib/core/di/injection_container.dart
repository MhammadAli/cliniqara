import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../../features/registration/data/datasources/local/app_database.dart';
import '../../features/registration/data/repositories/patient_repository_impl.dart';
import '../../features/registration/domain/repositories/patient_repository.dart';
import '../../features/registration/presentation/cubits/patient_registration/patient_registration_cubit.dart';
import '../../features/add_visit/presentation/cubits/patient_info/patient_info_cubit.dart';
import '../../features/add_visit/data/repositories/visit_repository_impl.dart';
import '../../features/add_visit/domain/repositories/visit_repository.dart';
import '../../features/add_visit/presentation/cubit/visit_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubits
  sl.registerFactory(() => PatientRegistrationCubit(repository: sl()));
  sl.registerFactory(() => PatientInfoCubit(repository: sl()));
  sl.registerFactory(() => VisitCubit(repository: sl()));

  // Repositories
  sl.registerLazySingleton<PatientRepository>(
    () => PatientRepositoryImpl(database: sl()),
  );
  sl.registerLazySingleton<VisitRepository>(
    () => VisitRepositoryImpl(sl()),
  );

  // Data sources
  // Initialize persistent SQLite database
  sl.registerLazySingleton<AppDatabase>(() {
    final lazyDb = LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'cliniqara.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
    return AppDatabase(lazyDb);
  });
}
