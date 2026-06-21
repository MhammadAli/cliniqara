// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PatientsTable extends Patients
    with TableInfo<$PatientsTable, PatientModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PatientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ageValueMeta = const VerificationMeta(
    'ageValue',
  );
  @override
  late final GeneratedColumn<int> ageValue = GeneratedColumn<int>(
    'age_value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ageUnitMeta = const VerificationMeta(
    'ageUnit',
  );
  @override
  late final GeneratedColumn<String> ageUnit = GeneratedColumn<String>(
    'age_unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _extraDataMeta = const VerificationMeta(
    'extraData',
  );
  @override
  late final GeneratedColumn<String> extraData = GeneratedColumn<String>(
    'extra_data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('{}'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    fullName,
    ageValue,
    ageUnit,
    gender,
    phoneNumber,
    extraData,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'patients';
  @override
  VerificationContext validateIntegrity(
    Insertable<PatientModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('age_value')) {
      context.handle(
        _ageValueMeta,
        ageValue.isAcceptableOrUnknown(data['age_value']!, _ageValueMeta),
      );
    } else if (isInserting) {
      context.missing(_ageValueMeta);
    }
    if (data.containsKey('age_unit')) {
      context.handle(
        _ageUnitMeta,
        ageUnit.isAcceptableOrUnknown(data['age_unit']!, _ageUnitMeta),
      );
    } else if (isInserting) {
      context.missing(_ageUnitMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    }
    if (data.containsKey('extra_data')) {
      context.handle(
        _extraDataMeta,
        extraData.isAcceptableOrUnknown(data['extra_data']!, _extraDataMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PatientModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PatientModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      ageValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age_value'],
      )!,
      ageUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}age_unit'],
      )!,
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      )!,
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      ),
      extraData: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}extra_data'],
      )!,
    );
  }

  @override
  $PatientsTable createAlias(String alias) {
    return $PatientsTable(attachedDatabase, alias);
  }
}

class PatientModel extends DataClass implements Insertable<PatientModel> {
  final String id;
  final String fullName;
  final int ageValue;
  final String ageUnit;
  final String gender;
  final String? phoneNumber;
  final String extraData;
  const PatientModel({
    required this.id,
    required this.fullName,
    required this.ageValue,
    required this.ageUnit,
    required this.gender,
    this.phoneNumber,
    required this.extraData,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['full_name'] = Variable<String>(fullName);
    map['age_value'] = Variable<int>(ageValue);
    map['age_unit'] = Variable<String>(ageUnit);
    map['gender'] = Variable<String>(gender);
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    map['extra_data'] = Variable<String>(extraData);
    return map;
  }

  PatientsCompanion toCompanion(bool nullToAbsent) {
    return PatientsCompanion(
      id: Value(id),
      fullName: Value(fullName),
      ageValue: Value(ageValue),
      ageUnit: Value(ageUnit),
      gender: Value(gender),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      extraData: Value(extraData),
    );
  }

  factory PatientModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PatientModel(
      id: serializer.fromJson<String>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      ageValue: serializer.fromJson<int>(json['ageValue']),
      ageUnit: serializer.fromJson<String>(json['ageUnit']),
      gender: serializer.fromJson<String>(json['gender']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      extraData: serializer.fromJson<String>(json['extraData']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'fullName': serializer.toJson<String>(fullName),
      'ageValue': serializer.toJson<int>(ageValue),
      'ageUnit': serializer.toJson<String>(ageUnit),
      'gender': serializer.toJson<String>(gender),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'extraData': serializer.toJson<String>(extraData),
    };
  }

  PatientModel copyWith({
    String? id,
    String? fullName,
    int? ageValue,
    String? ageUnit,
    String? gender,
    Value<String?> phoneNumber = const Value.absent(),
    String? extraData,
  }) => PatientModel(
    id: id ?? this.id,
    fullName: fullName ?? this.fullName,
    ageValue: ageValue ?? this.ageValue,
    ageUnit: ageUnit ?? this.ageUnit,
    gender: gender ?? this.gender,
    phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
    extraData: extraData ?? this.extraData,
  );
  PatientModel copyWithCompanion(PatientsCompanion data) {
    return PatientModel(
      id: data.id.present ? data.id.value : this.id,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      ageValue: data.ageValue.present ? data.ageValue.value : this.ageValue,
      ageUnit: data.ageUnit.present ? data.ageUnit.value : this.ageUnit,
      gender: data.gender.present ? data.gender.value : this.gender,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
      extraData: data.extraData.present ? data.extraData.value : this.extraData,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PatientModel(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('ageValue: $ageValue, ')
          ..write('ageUnit: $ageUnit, ')
          ..write('gender: $gender, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('extraData: $extraData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    fullName,
    ageValue,
    ageUnit,
    gender,
    phoneNumber,
    extraData,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PatientModel &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.ageValue == this.ageValue &&
          other.ageUnit == this.ageUnit &&
          other.gender == this.gender &&
          other.phoneNumber == this.phoneNumber &&
          other.extraData == this.extraData);
}

class PatientsCompanion extends UpdateCompanion<PatientModel> {
  final Value<String> id;
  final Value<String> fullName;
  final Value<int> ageValue;
  final Value<String> ageUnit;
  final Value<String> gender;
  final Value<String?> phoneNumber;
  final Value<String> extraData;
  final Value<int> rowid;
  const PatientsCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.ageValue = const Value.absent(),
    this.ageUnit = const Value.absent(),
    this.gender = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.extraData = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PatientsCompanion.insert({
    required String id,
    required String fullName,
    required int ageValue,
    required String ageUnit,
    required String gender,
    this.phoneNumber = const Value.absent(),
    this.extraData = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       fullName = Value(fullName),
       ageValue = Value(ageValue),
       ageUnit = Value(ageUnit),
       gender = Value(gender);
  static Insertable<PatientModel> custom({
    Expression<String>? id,
    Expression<String>? fullName,
    Expression<int>? ageValue,
    Expression<String>? ageUnit,
    Expression<String>? gender,
    Expression<String>? phoneNumber,
    Expression<String>? extraData,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (ageValue != null) 'age_value': ageValue,
      if (ageUnit != null) 'age_unit': ageUnit,
      if (gender != null) 'gender': gender,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (extraData != null) 'extra_data': extraData,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PatientsCompanion copyWith({
    Value<String>? id,
    Value<String>? fullName,
    Value<int>? ageValue,
    Value<String>? ageUnit,
    Value<String>? gender,
    Value<String?>? phoneNumber,
    Value<String>? extraData,
    Value<int>? rowid,
  }) {
    return PatientsCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      ageValue: ageValue ?? this.ageValue,
      ageUnit: ageUnit ?? this.ageUnit,
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      extraData: extraData ?? this.extraData,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (ageValue.present) {
      map['age_value'] = Variable<int>(ageValue.value);
    }
    if (ageUnit.present) {
      map['age_unit'] = Variable<String>(ageUnit.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (extraData.present) {
      map['extra_data'] = Variable<String>(extraData.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PatientsCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('ageValue: $ageValue, ')
          ..write('ageUnit: $ageUnit, ')
          ..write('gender: $gender, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('extraData: $extraData, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VisitsTable extends Visits with TableInfo<$VisitsTable, VisitModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VisitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _patientIdMeta = const VerificationMeta(
    'patientId',
  );
  @override
  late final GeneratedColumn<String> patientId = GeneratedColumn<String>(
    'patient_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES patients (id)',
    ),
  );
  static const VerificationMeta _visitDateMeta = const VerificationMeta(
    'visitDate',
  );
  @override
  late final GeneratedColumn<DateTime> visitDate = GeneratedColumn<DateTime>(
    'visit_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _extraDataMeta = const VerificationMeta(
    'extraData',
  );
  @override
  late final GeneratedColumn<String> extraData = GeneratedColumn<String>(
    'extra_data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('{}'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, patientId, visitDate, extraData];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'visits';
  @override
  VerificationContext validateIntegrity(
    Insertable<VisitModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('patient_id')) {
      context.handle(
        _patientIdMeta,
        patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('visit_date')) {
      context.handle(
        _visitDateMeta,
        visitDate.isAcceptableOrUnknown(data['visit_date']!, _visitDateMeta),
      );
    } else if (isInserting) {
      context.missing(_visitDateMeta);
    }
    if (data.containsKey('extra_data')) {
      context.handle(
        _extraDataMeta,
        extraData.isAcceptableOrUnknown(data['extra_data']!, _extraDataMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VisitModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VisitModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      patientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}patient_id'],
      )!,
      visitDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}visit_date'],
      )!,
      extraData: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}extra_data'],
      )!,
    );
  }

  @override
  $VisitsTable createAlias(String alias) {
    return $VisitsTable(attachedDatabase, alias);
  }
}

class VisitModel extends DataClass implements Insertable<VisitModel> {
  final String id;
  final String patientId;
  final DateTime visitDate;
  final String extraData;
  const VisitModel({
    required this.id,
    required this.patientId,
    required this.visitDate,
    required this.extraData,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['patient_id'] = Variable<String>(patientId);
    map['visit_date'] = Variable<DateTime>(visitDate);
    map['extra_data'] = Variable<String>(extraData);
    return map;
  }

  VisitsCompanion toCompanion(bool nullToAbsent) {
    return VisitsCompanion(
      id: Value(id),
      patientId: Value(patientId),
      visitDate: Value(visitDate),
      extraData: Value(extraData),
    );
  }

  factory VisitModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VisitModel(
      id: serializer.fromJson<String>(json['id']),
      patientId: serializer.fromJson<String>(json['patientId']),
      visitDate: serializer.fromJson<DateTime>(json['visitDate']),
      extraData: serializer.fromJson<String>(json['extraData']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'patientId': serializer.toJson<String>(patientId),
      'visitDate': serializer.toJson<DateTime>(visitDate),
      'extraData': serializer.toJson<String>(extraData),
    };
  }

  VisitModel copyWith({
    String? id,
    String? patientId,
    DateTime? visitDate,
    String? extraData,
  }) => VisitModel(
    id: id ?? this.id,
    patientId: patientId ?? this.patientId,
    visitDate: visitDate ?? this.visitDate,
    extraData: extraData ?? this.extraData,
  );
  VisitModel copyWithCompanion(VisitsCompanion data) {
    return VisitModel(
      id: data.id.present ? data.id.value : this.id,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      visitDate: data.visitDate.present ? data.visitDate.value : this.visitDate,
      extraData: data.extraData.present ? data.extraData.value : this.extraData,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VisitModel(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('visitDate: $visitDate, ')
          ..write('extraData: $extraData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, patientId, visitDate, extraData);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VisitModel &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.visitDate == this.visitDate &&
          other.extraData == this.extraData);
}

class VisitsCompanion extends UpdateCompanion<VisitModel> {
  final Value<String> id;
  final Value<String> patientId;
  final Value<DateTime> visitDate;
  final Value<String> extraData;
  final Value<int> rowid;
  const VisitsCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.visitDate = const Value.absent(),
    this.extraData = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VisitsCompanion.insert({
    required String id,
    required String patientId,
    required DateTime visitDate,
    this.extraData = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       patientId = Value(patientId),
       visitDate = Value(visitDate);
  static Insertable<VisitModel> custom({
    Expression<String>? id,
    Expression<String>? patientId,
    Expression<DateTime>? visitDate,
    Expression<String>? extraData,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (visitDate != null) 'visit_date': visitDate,
      if (extraData != null) 'extra_data': extraData,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VisitsCompanion copyWith({
    Value<String>? id,
    Value<String>? patientId,
    Value<DateTime>? visitDate,
    Value<String>? extraData,
    Value<int>? rowid,
  }) {
    return VisitsCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      visitDate: visitDate ?? this.visitDate,
      extraData: extraData ?? this.extraData,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<String>(patientId.value);
    }
    if (visitDate.present) {
      map['visit_date'] = Variable<DateTime>(visitDate.value);
    }
    if (extraData.present) {
      map['extra_data'] = Variable<String>(extraData.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VisitsCompanion(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('visitDate: $visitDate, ')
          ..write('extraData: $extraData, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PatientsTable patients = $PatientsTable(this);
  late final $VisitsTable visits = $VisitsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [patients, visits];
}

typedef $$PatientsTableCreateCompanionBuilder =
    PatientsCompanion Function({
      required String id,
      required String fullName,
      required int ageValue,
      required String ageUnit,
      required String gender,
      Value<String?> phoneNumber,
      Value<String> extraData,
      Value<int> rowid,
    });
typedef $$PatientsTableUpdateCompanionBuilder =
    PatientsCompanion Function({
      Value<String> id,
      Value<String> fullName,
      Value<int> ageValue,
      Value<String> ageUnit,
      Value<String> gender,
      Value<String?> phoneNumber,
      Value<String> extraData,
      Value<int> rowid,
    });

final class $$PatientsTableReferences
    extends BaseReferences<_$AppDatabase, $PatientsTable, PatientModel> {
  $$PatientsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$VisitsTable, List<VisitModel>> _visitsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.visits,
    aliasName: $_aliasNameGenerator(db.patients.id, db.visits.patientId),
  );

  $$VisitsTableProcessedTableManager get visitsRefs {
    final manager = $$VisitsTableTableManager(
      $_db,
      $_db.visits,
    ).filter((f) => f.patientId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_visitsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PatientsTableFilterComposer
    extends Composer<_$AppDatabase, $PatientsTable> {
  $$PatientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ageValue => $composableBuilder(
    column: $table.ageValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ageUnit => $composableBuilder(
    column: $table.ageUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get extraData => $composableBuilder(
    column: $table.extraData,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> visitsRefs(
    Expression<bool> Function($$VisitsTableFilterComposer f) f,
  ) {
    final $$VisitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.visits,
      getReferencedColumn: (t) => t.patientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisitsTableFilterComposer(
            $db: $db,
            $table: $db.visits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PatientsTableOrderingComposer
    extends Composer<_$AppDatabase, $PatientsTable> {
  $$PatientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ageValue => $composableBuilder(
    column: $table.ageValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ageUnit => $composableBuilder(
    column: $table.ageUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get extraData => $composableBuilder(
    column: $table.extraData,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PatientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PatientsTable> {
  $$PatientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<int> get ageValue =>
      $composableBuilder(column: $table.ageValue, builder: (column) => column);

  GeneratedColumn<String> get ageUnit =>
      $composableBuilder(column: $table.ageUnit, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get extraData =>
      $composableBuilder(column: $table.extraData, builder: (column) => column);

  Expression<T> visitsRefs<T extends Object>(
    Expression<T> Function($$VisitsTableAnnotationComposer a) f,
  ) {
    final $$VisitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.visits,
      getReferencedColumn: (t) => t.patientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisitsTableAnnotationComposer(
            $db: $db,
            $table: $db.visits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PatientsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PatientsTable,
          PatientModel,
          $$PatientsTableFilterComposer,
          $$PatientsTableOrderingComposer,
          $$PatientsTableAnnotationComposer,
          $$PatientsTableCreateCompanionBuilder,
          $$PatientsTableUpdateCompanionBuilder,
          (PatientModel, $$PatientsTableReferences),
          PatientModel,
          PrefetchHooks Function({bool visitsRefs})
        > {
  $$PatientsTableTableManager(_$AppDatabase db, $PatientsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PatientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PatientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PatientsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<int> ageValue = const Value.absent(),
                Value<String> ageUnit = const Value.absent(),
                Value<String> gender = const Value.absent(),
                Value<String?> phoneNumber = const Value.absent(),
                Value<String> extraData = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PatientsCompanion(
                id: id,
                fullName: fullName,
                ageValue: ageValue,
                ageUnit: ageUnit,
                gender: gender,
                phoneNumber: phoneNumber,
                extraData: extraData,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String fullName,
                required int ageValue,
                required String ageUnit,
                required String gender,
                Value<String?> phoneNumber = const Value.absent(),
                Value<String> extraData = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PatientsCompanion.insert(
                id: id,
                fullName: fullName,
                ageValue: ageValue,
                ageUnit: ageUnit,
                gender: gender,
                phoneNumber: phoneNumber,
                extraData: extraData,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PatientsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({visitsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (visitsRefs) db.visits],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (visitsRefs)
                    await $_getPrefetchedData<
                      PatientModel,
                      $PatientsTable,
                      VisitModel
                    >(
                      currentTable: table,
                      referencedTable: $$PatientsTableReferences
                          ._visitsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$PatientsTableReferences(db, table, p0).visitsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.patientId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PatientsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PatientsTable,
      PatientModel,
      $$PatientsTableFilterComposer,
      $$PatientsTableOrderingComposer,
      $$PatientsTableAnnotationComposer,
      $$PatientsTableCreateCompanionBuilder,
      $$PatientsTableUpdateCompanionBuilder,
      (PatientModel, $$PatientsTableReferences),
      PatientModel,
      PrefetchHooks Function({bool visitsRefs})
    >;
typedef $$VisitsTableCreateCompanionBuilder =
    VisitsCompanion Function({
      required String id,
      required String patientId,
      required DateTime visitDate,
      Value<String> extraData,
      Value<int> rowid,
    });
typedef $$VisitsTableUpdateCompanionBuilder =
    VisitsCompanion Function({
      Value<String> id,
      Value<String> patientId,
      Value<DateTime> visitDate,
      Value<String> extraData,
      Value<int> rowid,
    });

final class $$VisitsTableReferences
    extends BaseReferences<_$AppDatabase, $VisitsTable, VisitModel> {
  $$VisitsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PatientsTable _patientIdTable(_$AppDatabase db) => db.patients
      .createAlias($_aliasNameGenerator(db.visits.patientId, db.patients.id));

  $$PatientsTableProcessedTableManager get patientId {
    final $_column = $_itemColumn<String>('patient_id')!;

    final manager = $$PatientsTableTableManager(
      $_db,
      $_db.patients,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$VisitsTableFilterComposer
    extends Composer<_$AppDatabase, $VisitsTable> {
  $$VisitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get visitDate => $composableBuilder(
    column: $table.visitDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get extraData => $composableBuilder(
    column: $table.extraData,
    builder: (column) => ColumnFilters(column),
  );

  $$PatientsTableFilterComposer get patientId {
    final $$PatientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientId,
      referencedTable: $db.patients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientsTableFilterComposer(
            $db: $db,
            $table: $db.patients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VisitsTableOrderingComposer
    extends Composer<_$AppDatabase, $VisitsTable> {
  $$VisitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get visitDate => $composableBuilder(
    column: $table.visitDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get extraData => $composableBuilder(
    column: $table.extraData,
    builder: (column) => ColumnOrderings(column),
  );

  $$PatientsTableOrderingComposer get patientId {
    final $$PatientsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientId,
      referencedTable: $db.patients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientsTableOrderingComposer(
            $db: $db,
            $table: $db.patients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VisitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $VisitsTable> {
  $$VisitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get visitDate =>
      $composableBuilder(column: $table.visitDate, builder: (column) => column);

  GeneratedColumn<String> get extraData =>
      $composableBuilder(column: $table.extraData, builder: (column) => column);

  $$PatientsTableAnnotationComposer get patientId {
    final $$PatientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientId,
      referencedTable: $db.patients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientsTableAnnotationComposer(
            $db: $db,
            $table: $db.patients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VisitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VisitsTable,
          VisitModel,
          $$VisitsTableFilterComposer,
          $$VisitsTableOrderingComposer,
          $$VisitsTableAnnotationComposer,
          $$VisitsTableCreateCompanionBuilder,
          $$VisitsTableUpdateCompanionBuilder,
          (VisitModel, $$VisitsTableReferences),
          VisitModel,
          PrefetchHooks Function({bool patientId})
        > {
  $$VisitsTableTableManager(_$AppDatabase db, $VisitsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VisitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VisitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VisitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> patientId = const Value.absent(),
                Value<DateTime> visitDate = const Value.absent(),
                Value<String> extraData = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VisitsCompanion(
                id: id,
                patientId: patientId,
                visitDate: visitDate,
                extraData: extraData,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String patientId,
                required DateTime visitDate,
                Value<String> extraData = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VisitsCompanion.insert(
                id: id,
                patientId: patientId,
                visitDate: visitDate,
                extraData: extraData,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$VisitsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({patientId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (patientId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.patientId,
                                referencedTable: $$VisitsTableReferences
                                    ._patientIdTable(db),
                                referencedColumn: $$VisitsTableReferences
                                    ._patientIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$VisitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VisitsTable,
      VisitModel,
      $$VisitsTableFilterComposer,
      $$VisitsTableOrderingComposer,
      $$VisitsTableAnnotationComposer,
      $$VisitsTableCreateCompanionBuilder,
      $$VisitsTableUpdateCompanionBuilder,
      (VisitModel, $$VisitsTableReferences),
      VisitModel,
      PrefetchHooks Function({bool patientId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PatientsTableTableManager get patients =>
      $$PatientsTableTableManager(_db, _db.patients);
  $$VisitsTableTableManager get visits =>
      $$VisitsTableTableManager(_db, _db.visits);
}
