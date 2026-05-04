import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/patient.dart';
import '../../domain/repositories/patient_repository.dart';
import '../datasources/local/app_database.dart';
import '../mappers/patient_mapper.dart';

class PatientRepositoryImpl implements PatientRepository {
  final AppDatabase database;

  PatientRepositoryImpl({required this.database});

  @override
  Future<Either<Failure, Unit>> registerPatient(Patient patient) async {
    try {
      await database.into(database.patients).insert(patient.toCompanion());
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Patient>> getPatientById(String id) async {
    try {
      final query = database.select(database.patients)
        ..where((tbl) => tbl.id.equals(id));
      final result = await query.getSingle();
      return Right(result.toDomain());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Patient>>> getAllPatients() async {
    try {
      final result = await database.select(database.patients).get();
      return Right(result.map((e) => e.toDomain()).toList());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePatient(Patient patient) async {
    try {
      await database.update(database.patients).replace(patient.toCompanion());
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePatient(String id) async {
    try {
      await (database.delete(
        database.patients,
      )..where((tbl) => tbl.id.equals(id))).go();
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
