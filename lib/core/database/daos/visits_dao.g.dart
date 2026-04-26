// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visits_dao.dart';

// ignore_for_file: type=lint
mixin _$VisitsDaoMixin on DatabaseAccessor<AppDatabase> {
  $PatientsTable get patients => attachedDatabase.patients;
  $VisitsTable get visits => attachedDatabase.visits;
  $VitalsTable get vitals => attachedDatabase.vitals;
  VisitsDaoManager get managers => VisitsDaoManager(this);
}

class VisitsDaoManager {
  final _$VisitsDaoMixin _db;
  VisitsDaoManager(this._db);
  $$PatientsTableTableManager get patients =>
      $$PatientsTableTableManager(_db.attachedDatabase, _db.patients);
  $$VisitsTableTableManager get visits =>
      $$VisitsTableTableManager(_db.attachedDatabase, _db.visits);
  $$VitalsTableTableManager get vitals =>
      $$VitalsTableTableManager(_db.attachedDatabase, _db.vitals);
}
