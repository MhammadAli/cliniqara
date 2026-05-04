import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

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
