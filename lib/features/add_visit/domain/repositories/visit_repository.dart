import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/visit.dart';

abstract class VisitRepository {
  Future<Either<Failure, void>> addVisit(Visit visit);
  Future<Either<Failure, List<Visit>>> getVisitsForPatient(String patientId);
}
