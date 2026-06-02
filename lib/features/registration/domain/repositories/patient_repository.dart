import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/patient.dart';

abstract class PatientRepository {
  Future<Either<Failure, Unit>> registerPatient(Patient patient);
  Future<Either<Failure, Patient>> getPatientById(String id);
  Future<Either<Failure, List<Patient>>> getAllPatients();
  Future<Either<Failure, Unit>> updatePatient(Patient patient);
  Future<Either<Failure, Unit>> deletePatient(String id);
}
