import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/visit.dart';
import '../../domain/repositories/visit_repository.dart';
import 'dart:convert';
import 'package:drift/drift.dart';
import '../../../registration/data/datasources/local/app_database.dart';
import '../../domain/entities/visit_draft.dart';

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
        extraData: Value(jsonEncode(visit.draft.toJson())), 
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
      
      final visits = result.map((row) {
        VisitDraft draft = const VisitDraft();
        try {
          if (row.extraData.isNotEmpty && row.extraData != '{}') {
            draft = VisitDraft.fromJson(jsonDecode(row.extraData));
          }
        } catch (e) {
           // Fallback to empty draft if decoding fails
        }
        return Visit(
          id: row.id,
          patientId: row.patientId,
          visitDate: row.visitDate,
          draft: draft,
        );
      }).toList();

      return Right(visits);
    } catch (e) {
      return Left(const DatabaseFailure('Failed to perform database operation'));
    }
  }
}
