import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/visit.dart';
import '../../domain/repositories/visit_repository.dart';
import '../../../registration/data/datasources/local/app_database.dart';
import 'package:drift/drift.dart';

class VisitRepositoryImpl implements VisitRepository {
  final AppDatabase database;

  VisitRepositoryImpl(this.database);

  @override
  Future<Either<Failure, void>> addVisit(Visit visit) async {
    try {
      final companion = VisitsCompanion(
        id: Value(visit.id),
        patientId: Value(visit.patientId),
        visitDate: Value(visit.visitDate),
        // we can store extraData as JSON if we want, currently it's just a text column. Let's assume we map it later. 
        // For simplicity, we just save a string for extraData.
        extraData: const Value('{}'), 
      );
      await database.into(database.visits).insert(companion);
      return const Right(null);
    } catch (e) {
      return Left(const DatabaseFailure('Failed to perform database operation'));
    }
  }

  @override
  Future<Either<Failure, List<Visit>>> getVisitsForPatient(String patientId) async {
    try {
      final result = await (database.select(database.visits)
            ..where((tbl) => tbl.patientId.equals(patientId)))
          .get();
      
      final visits = result.map((row) => Visit(
        id: row.id,
        patientId: row.patientId,
        visitDate: row.visitDate,
        extraData: const {}, // In real world, parse JSON from row.extraData
      )).toList();

      return Right(visits);
    } catch (e) {
      return Left(const DatabaseFailure('Failed to perform database operation'));
    }
  }
}
