// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PatientsTable extends Patients with TableInfo<$PatientsTable, Patient> {
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateOfBirthMeta = const VerificationMeta(
    'dateOfBirth',
  );
  @override
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
    'date_of_birth',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
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
  static const VerificationMeta _occupationMeta = const VerificationMeta(
    'occupation',
  );
  @override
  late final GeneratedColumn<String> occupation = GeneratedColumn<String>(
    'occupation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _maritalStatusMeta = const VerificationMeta(
    'maritalStatus',
  );
  @override
  late final GeneratedColumn<String> maritalStatus = GeneratedColumn<String>(
    'marital_status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _numberOfChildrenMeta = const VerificationMeta(
    'numberOfChildren',
  );
  @override
  late final GeneratedColumn<int> numberOfChildren = GeneratedColumn<int>(
    'number_of_children',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdByMeta = const VerificationMeta(
    'createdBy',
  );
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
    'created_by',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local_doctor'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    dateOfBirth,
    gender,
    occupation,
    maritalStatus,
    numberOfChildren,
    createdBy,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'patients';
  @override
  VerificationContext validateIntegrity(
    Insertable<Patient> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
        _dateOfBirthMeta,
        dateOfBirth.isAcceptableOrUnknown(
          data['date_of_birth']!,
          _dateOfBirthMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dateOfBirthMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('occupation')) {
      context.handle(
        _occupationMeta,
        occupation.isAcceptableOrUnknown(data['occupation']!, _occupationMeta),
      );
    }
    if (data.containsKey('marital_status')) {
      context.handle(
        _maritalStatusMeta,
        maritalStatus.isAcceptableOrUnknown(
          data['marital_status']!,
          _maritalStatusMeta,
        ),
      );
    }
    if (data.containsKey('number_of_children')) {
      context.handle(
        _numberOfChildrenMeta,
        numberOfChildren.isAcceptableOrUnknown(
          data['number_of_children']!,
          _numberOfChildrenMeta,
        ),
      );
    }
    if (data.containsKey('created_by')) {
      context.handle(
        _createdByMeta,
        createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Patient map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Patient(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      dateOfBirth: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_of_birth'],
      )!,
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      )!,
      occupation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}occupation'],
      ),
      maritalStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}marital_status'],
      ),
      numberOfChildren: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number_of_children'],
      ),
      createdBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PatientsTable createAlias(String alias) {
    return $PatientsTable(attachedDatabase, alias);
  }
}

class Patient extends DataClass implements Insertable<Patient> {
  final String id;
  final String name;
  final DateTime dateOfBirth;
  final String gender;
  final String? occupation;
  final String? maritalStatus;
  final int? numberOfChildren;
  final String createdBy;
  final DateTime createdAt;
  const Patient({
    required this.id,
    required this.name,
    required this.dateOfBirth,
    required this.gender,
    this.occupation,
    this.maritalStatus,
    this.numberOfChildren,
    required this.createdBy,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['date_of_birth'] = Variable<DateTime>(dateOfBirth);
    map['gender'] = Variable<String>(gender);
    if (!nullToAbsent || occupation != null) {
      map['occupation'] = Variable<String>(occupation);
    }
    if (!nullToAbsent || maritalStatus != null) {
      map['marital_status'] = Variable<String>(maritalStatus);
    }
    if (!nullToAbsent || numberOfChildren != null) {
      map['number_of_children'] = Variable<int>(numberOfChildren);
    }
    map['created_by'] = Variable<String>(createdBy);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PatientsCompanion toCompanion(bool nullToAbsent) {
    return PatientsCompanion(
      id: Value(id),
      name: Value(name),
      dateOfBirth: Value(dateOfBirth),
      gender: Value(gender),
      occupation: occupation == null && nullToAbsent
          ? const Value.absent()
          : Value(occupation),
      maritalStatus: maritalStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(maritalStatus),
      numberOfChildren: numberOfChildren == null && nullToAbsent
          ? const Value.absent()
          : Value(numberOfChildren),
      createdBy: Value(createdBy),
      createdAt: Value(createdAt),
    );
  }

  factory Patient.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Patient(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      dateOfBirth: serializer.fromJson<DateTime>(json['dateOfBirth']),
      gender: serializer.fromJson<String>(json['gender']),
      occupation: serializer.fromJson<String?>(json['occupation']),
      maritalStatus: serializer.fromJson<String?>(json['maritalStatus']),
      numberOfChildren: serializer.fromJson<int?>(json['numberOfChildren']),
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'dateOfBirth': serializer.toJson<DateTime>(dateOfBirth),
      'gender': serializer.toJson<String>(gender),
      'occupation': serializer.toJson<String?>(occupation),
      'maritalStatus': serializer.toJson<String?>(maritalStatus),
      'numberOfChildren': serializer.toJson<int?>(numberOfChildren),
      'createdBy': serializer.toJson<String>(createdBy),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Patient copyWith({
    String? id,
    String? name,
    DateTime? dateOfBirth,
    String? gender,
    Value<String?> occupation = const Value.absent(),
    Value<String?> maritalStatus = const Value.absent(),
    Value<int?> numberOfChildren = const Value.absent(),
    String? createdBy,
    DateTime? createdAt,
  }) => Patient(
    id: id ?? this.id,
    name: name ?? this.name,
    dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    gender: gender ?? this.gender,
    occupation: occupation.present ? occupation.value : this.occupation,
    maritalStatus: maritalStatus.present
        ? maritalStatus.value
        : this.maritalStatus,
    numberOfChildren: numberOfChildren.present
        ? numberOfChildren.value
        : this.numberOfChildren,
    createdBy: createdBy ?? this.createdBy,
    createdAt: createdAt ?? this.createdAt,
  );
  Patient copyWithCompanion(PatientsCompanion data) {
    return Patient(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      dateOfBirth: data.dateOfBirth.present
          ? data.dateOfBirth.value
          : this.dateOfBirth,
      gender: data.gender.present ? data.gender.value : this.gender,
      occupation: data.occupation.present
          ? data.occupation.value
          : this.occupation,
      maritalStatus: data.maritalStatus.present
          ? data.maritalStatus.value
          : this.maritalStatus,
      numberOfChildren: data.numberOfChildren.present
          ? data.numberOfChildren.value
          : this.numberOfChildren,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Patient(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('gender: $gender, ')
          ..write('occupation: $occupation, ')
          ..write('maritalStatus: $maritalStatus, ')
          ..write('numberOfChildren: $numberOfChildren, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    dateOfBirth,
    gender,
    occupation,
    maritalStatus,
    numberOfChildren,
    createdBy,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Patient &&
          other.id == this.id &&
          other.name == this.name &&
          other.dateOfBirth == this.dateOfBirth &&
          other.gender == this.gender &&
          other.occupation == this.occupation &&
          other.maritalStatus == this.maritalStatus &&
          other.numberOfChildren == this.numberOfChildren &&
          other.createdBy == this.createdBy &&
          other.createdAt == this.createdAt);
}

class PatientsCompanion extends UpdateCompanion<Patient> {
  final Value<String> id;
  final Value<String> name;
  final Value<DateTime> dateOfBirth;
  final Value<String> gender;
  final Value<String?> occupation;
  final Value<String?> maritalStatus;
  final Value<int?> numberOfChildren;
  final Value<String> createdBy;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const PatientsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.gender = const Value.absent(),
    this.occupation = const Value.absent(),
    this.maritalStatus = const Value.absent(),
    this.numberOfChildren = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PatientsCompanion.insert({
    required String id,
    required String name,
    required DateTime dateOfBirth,
    required String gender,
    this.occupation = const Value.absent(),
    this.maritalStatus = const Value.absent(),
    this.numberOfChildren = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       dateOfBirth = Value(dateOfBirth),
       gender = Value(gender);
  static Insertable<Patient> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<DateTime>? dateOfBirth,
    Expression<String>? gender,
    Expression<String>? occupation,
    Expression<String>? maritalStatus,
    Expression<int>? numberOfChildren,
    Expression<String>? createdBy,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (gender != null) 'gender': gender,
      if (occupation != null) 'occupation': occupation,
      if (maritalStatus != null) 'marital_status': maritalStatus,
      if (numberOfChildren != null) 'number_of_children': numberOfChildren,
      if (createdBy != null) 'created_by': createdBy,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PatientsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<DateTime>? dateOfBirth,
    Value<String>? gender,
    Value<String?>? occupation,
    Value<String?>? maritalStatus,
    Value<int?>? numberOfChildren,
    Value<String>? createdBy,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return PatientsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      occupation: occupation ?? this.occupation,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      numberOfChildren: numberOfChildren ?? this.numberOfChildren,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (occupation.present) {
      map['occupation'] = Variable<String>(occupation.value);
    }
    if (maritalStatus.present) {
      map['marital_status'] = Variable<String>(maritalStatus.value);
    }
    if (numberOfChildren.present) {
      map['number_of_children'] = Variable<int>(numberOfChildren.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
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
          ..write('name: $name, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('gender: $gender, ')
          ..write('occupation: $occupation, ')
          ..write('maritalStatus: $maritalStatus, ')
          ..write('numberOfChildren: $numberOfChildren, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VisitsTable extends Visits with TableInfo<$VisitsTable, Visit> {
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _mainComplaintMeta = const VerificationMeta(
    'mainComplaint',
  );
  @override
  late final GeneratedColumn<String> mainComplaint = GeneratedColumn<String>(
    'main_complaint',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdByMeta = const VerificationMeta(
    'createdBy',
  );
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
    'created_by',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local_doctor'),
  );
  static const VerificationMeta _clinicalPayloadJsonMeta =
      const VerificationMeta('clinicalPayloadJson');
  @override
  late final GeneratedColumn<String> clinicalPayloadJson =
      GeneratedColumn<String>(
        'clinical_payload_json',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    patientId,
    visitDate,
    mainComplaint,
    createdBy,
    clinicalPayloadJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'visits';
  @override
  VerificationContext validateIntegrity(
    Insertable<Visit> instance, {
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
    }
    if (data.containsKey('main_complaint')) {
      context.handle(
        _mainComplaintMeta,
        mainComplaint.isAcceptableOrUnknown(
          data['main_complaint']!,
          _mainComplaintMeta,
        ),
      );
    }
    if (data.containsKey('created_by')) {
      context.handle(
        _createdByMeta,
        createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta),
      );
    }
    if (data.containsKey('clinical_payload_json')) {
      context.handle(
        _clinicalPayloadJsonMeta,
        clinicalPayloadJson.isAcceptableOrUnknown(
          data['clinical_payload_json']!,
          _clinicalPayloadJsonMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Visit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Visit(
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
      mainComplaint: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}main_complaint'],
      ),
      createdBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by'],
      )!,
      clinicalPayloadJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}clinical_payload_json'],
      ),
    );
  }

  @override
  $VisitsTable createAlias(String alias) {
    return $VisitsTable(attachedDatabase, alias);
  }
}

class Visit extends DataClass implements Insertable<Visit> {
  final String id;
  final String patientId;
  final DateTime visitDate;
  final String? mainComplaint;
  final String createdBy;

  /// JSON blob containing all dynamic OSCE section data.
  final String? clinicalPayloadJson;
  const Visit({
    required this.id,
    required this.patientId,
    required this.visitDate,
    this.mainComplaint,
    required this.createdBy,
    this.clinicalPayloadJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['patient_id'] = Variable<String>(patientId);
    map['visit_date'] = Variable<DateTime>(visitDate);
    if (!nullToAbsent || mainComplaint != null) {
      map['main_complaint'] = Variable<String>(mainComplaint);
    }
    map['created_by'] = Variable<String>(createdBy);
    if (!nullToAbsent || clinicalPayloadJson != null) {
      map['clinical_payload_json'] = Variable<String>(clinicalPayloadJson);
    }
    return map;
  }

  VisitsCompanion toCompanion(bool nullToAbsent) {
    return VisitsCompanion(
      id: Value(id),
      patientId: Value(patientId),
      visitDate: Value(visitDate),
      mainComplaint: mainComplaint == null && nullToAbsent
          ? const Value.absent()
          : Value(mainComplaint),
      createdBy: Value(createdBy),
      clinicalPayloadJson: clinicalPayloadJson == null && nullToAbsent
          ? const Value.absent()
          : Value(clinicalPayloadJson),
    );
  }

  factory Visit.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Visit(
      id: serializer.fromJson<String>(json['id']),
      patientId: serializer.fromJson<String>(json['patientId']),
      visitDate: serializer.fromJson<DateTime>(json['visitDate']),
      mainComplaint: serializer.fromJson<String?>(json['mainComplaint']),
      createdBy: serializer.fromJson<String>(json['createdBy']),
      clinicalPayloadJson: serializer.fromJson<String?>(
        json['clinicalPayloadJson'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'patientId': serializer.toJson<String>(patientId),
      'visitDate': serializer.toJson<DateTime>(visitDate),
      'mainComplaint': serializer.toJson<String?>(mainComplaint),
      'createdBy': serializer.toJson<String>(createdBy),
      'clinicalPayloadJson': serializer.toJson<String?>(clinicalPayloadJson),
    };
  }

  Visit copyWith({
    String? id,
    String? patientId,
    DateTime? visitDate,
    Value<String?> mainComplaint = const Value.absent(),
    String? createdBy,
    Value<String?> clinicalPayloadJson = const Value.absent(),
  }) => Visit(
    id: id ?? this.id,
    patientId: patientId ?? this.patientId,
    visitDate: visitDate ?? this.visitDate,
    mainComplaint: mainComplaint.present
        ? mainComplaint.value
        : this.mainComplaint,
    createdBy: createdBy ?? this.createdBy,
    clinicalPayloadJson: clinicalPayloadJson.present
        ? clinicalPayloadJson.value
        : this.clinicalPayloadJson,
  );
  Visit copyWithCompanion(VisitsCompanion data) {
    return Visit(
      id: data.id.present ? data.id.value : this.id,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      visitDate: data.visitDate.present ? data.visitDate.value : this.visitDate,
      mainComplaint: data.mainComplaint.present
          ? data.mainComplaint.value
          : this.mainComplaint,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      clinicalPayloadJson: data.clinicalPayloadJson.present
          ? data.clinicalPayloadJson.value
          : this.clinicalPayloadJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Visit(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('visitDate: $visitDate, ')
          ..write('mainComplaint: $mainComplaint, ')
          ..write('createdBy: $createdBy, ')
          ..write('clinicalPayloadJson: $clinicalPayloadJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    patientId,
    visitDate,
    mainComplaint,
    createdBy,
    clinicalPayloadJson,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Visit &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.visitDate == this.visitDate &&
          other.mainComplaint == this.mainComplaint &&
          other.createdBy == this.createdBy &&
          other.clinicalPayloadJson == this.clinicalPayloadJson);
}

class VisitsCompanion extends UpdateCompanion<Visit> {
  final Value<String> id;
  final Value<String> patientId;
  final Value<DateTime> visitDate;
  final Value<String?> mainComplaint;
  final Value<String> createdBy;
  final Value<String?> clinicalPayloadJson;
  final Value<int> rowid;
  const VisitsCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.visitDate = const Value.absent(),
    this.mainComplaint = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.clinicalPayloadJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VisitsCompanion.insert({
    required String id,
    required String patientId,
    this.visitDate = const Value.absent(),
    this.mainComplaint = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.clinicalPayloadJson = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       patientId = Value(patientId);
  static Insertable<Visit> custom({
    Expression<String>? id,
    Expression<String>? patientId,
    Expression<DateTime>? visitDate,
    Expression<String>? mainComplaint,
    Expression<String>? createdBy,
    Expression<String>? clinicalPayloadJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (visitDate != null) 'visit_date': visitDate,
      if (mainComplaint != null) 'main_complaint': mainComplaint,
      if (createdBy != null) 'created_by': createdBy,
      if (clinicalPayloadJson != null)
        'clinical_payload_json': clinicalPayloadJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VisitsCompanion copyWith({
    Value<String>? id,
    Value<String>? patientId,
    Value<DateTime>? visitDate,
    Value<String?>? mainComplaint,
    Value<String>? createdBy,
    Value<String?>? clinicalPayloadJson,
    Value<int>? rowid,
  }) {
    return VisitsCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      visitDate: visitDate ?? this.visitDate,
      mainComplaint: mainComplaint ?? this.mainComplaint,
      createdBy: createdBy ?? this.createdBy,
      clinicalPayloadJson: clinicalPayloadJson ?? this.clinicalPayloadJson,
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
    if (mainComplaint.present) {
      map['main_complaint'] = Variable<String>(mainComplaint.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (clinicalPayloadJson.present) {
      map['clinical_payload_json'] = Variable<String>(
        clinicalPayloadJson.value,
      );
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
          ..write('mainComplaint: $mainComplaint, ')
          ..write('createdBy: $createdBy, ')
          ..write('clinicalPayloadJson: $clinicalPayloadJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VitalsTable extends Vitals with TableInfo<$VitalsTable, VitalSign> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VitalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _visitIdMeta = const VerificationMeta(
    'visitId',
  );
  @override
  late final GeneratedColumn<String> visitId = GeneratedColumn<String>(
    'visit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES visits (id)',
    ),
  );
  static const VerificationMeta _bpSystolicMeta = const VerificationMeta(
    'bpSystolic',
  );
  @override
  late final GeneratedColumn<int> bpSystolic = GeneratedColumn<int>(
    'bp_systolic',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bpDiastolicMeta = const VerificationMeta(
    'bpDiastolic',
  );
  @override
  late final GeneratedColumn<int> bpDiastolic = GeneratedColumn<int>(
    'bp_diastolic',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _heartRateMeta = const VerificationMeta(
    'heartRate',
  );
  @override
  late final GeneratedColumn<int> heartRate = GeneratedColumn<int>(
    'heart_rate',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _temperatureMeta = const VerificationMeta(
    'temperature',
  );
  @override
  late final GeneratedColumn<double> temperature = GeneratedColumn<double>(
    'temperature',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _respiratoryRateMeta = const VerificationMeta(
    'respiratoryRate',
  );
  @override
  late final GeneratedColumn<int> respiratoryRate = GeneratedColumn<int>(
    'respiratory_rate',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _spo2Meta = const VerificationMeta('spo2');
  @override
  late final GeneratedColumn<int> spo2 = GeneratedColumn<int>(
    'spo2',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bloodGlucoseMeta = const VerificationMeta(
    'bloodGlucose',
  );
  @override
  late final GeneratedColumn<double> bloodGlucose = GeneratedColumn<double>(
    'blood_glucose',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _glucoseUnitMeta = const VerificationMeta(
    'glucoseUnit',
  );
  @override
  late final GeneratedColumn<String> glucoseUnit = GeneratedColumn<String>(
    'glucose_unit',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
    'height',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    visitId,
    bpSystolic,
    bpDiastolic,
    heartRate,
    temperature,
    respiratoryRate,
    spo2,
    bloodGlucose,
    glucoseUnit,
    weight,
    height,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vitals';
  @override
  VerificationContext validateIntegrity(
    Insertable<VitalSign> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('visit_id')) {
      context.handle(
        _visitIdMeta,
        visitId.isAcceptableOrUnknown(data['visit_id']!, _visitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_visitIdMeta);
    }
    if (data.containsKey('bp_systolic')) {
      context.handle(
        _bpSystolicMeta,
        bpSystolic.isAcceptableOrUnknown(data['bp_systolic']!, _bpSystolicMeta),
      );
    }
    if (data.containsKey('bp_diastolic')) {
      context.handle(
        _bpDiastolicMeta,
        bpDiastolic.isAcceptableOrUnknown(
          data['bp_diastolic']!,
          _bpDiastolicMeta,
        ),
      );
    }
    if (data.containsKey('heart_rate')) {
      context.handle(
        _heartRateMeta,
        heartRate.isAcceptableOrUnknown(data['heart_rate']!, _heartRateMeta),
      );
    }
    if (data.containsKey('temperature')) {
      context.handle(
        _temperatureMeta,
        temperature.isAcceptableOrUnknown(
          data['temperature']!,
          _temperatureMeta,
        ),
      );
    }
    if (data.containsKey('respiratory_rate')) {
      context.handle(
        _respiratoryRateMeta,
        respiratoryRate.isAcceptableOrUnknown(
          data['respiratory_rate']!,
          _respiratoryRateMeta,
        ),
      );
    }
    if (data.containsKey('spo2')) {
      context.handle(
        _spo2Meta,
        spo2.isAcceptableOrUnknown(data['spo2']!, _spo2Meta),
      );
    }
    if (data.containsKey('blood_glucose')) {
      context.handle(
        _bloodGlucoseMeta,
        bloodGlucose.isAcceptableOrUnknown(
          data['blood_glucose']!,
          _bloodGlucoseMeta,
        ),
      );
    }
    if (data.containsKey('glucose_unit')) {
      context.handle(
        _glucoseUnitMeta,
        glucoseUnit.isAcceptableOrUnknown(
          data['glucose_unit']!,
          _glucoseUnitMeta,
        ),
      );
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VitalSign map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VitalSign(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      visitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}visit_id'],
      )!,
      bpSystolic: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bp_systolic'],
      ),
      bpDiastolic: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bp_diastolic'],
      ),
      heartRate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}heart_rate'],
      ),
      temperature: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}temperature'],
      ),
      respiratoryRate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}respiratory_rate'],
      ),
      spo2: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}spo2'],
      ),
      bloodGlucose: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}blood_glucose'],
      ),
      glucoseUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}glucose_unit'],
      ),
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      ),
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}height'],
      ),
    );
  }

  @override
  $VitalsTable createAlias(String alias) {
    return $VitalsTable(attachedDatabase, alias);
  }
}

class VitalSign extends DataClass implements Insertable<VitalSign> {
  final String id;
  final String visitId;
  final int? bpSystolic;
  final int? bpDiastolic;
  final int? heartRate;
  final double? temperature;
  final int? respiratoryRate;
  final int? spo2;
  final double? bloodGlucose;
  final String? glucoseUnit;
  final double? weight;
  final double? height;
  const VitalSign({
    required this.id,
    required this.visitId,
    this.bpSystolic,
    this.bpDiastolic,
    this.heartRate,
    this.temperature,
    this.respiratoryRate,
    this.spo2,
    this.bloodGlucose,
    this.glucoseUnit,
    this.weight,
    this.height,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['visit_id'] = Variable<String>(visitId);
    if (!nullToAbsent || bpSystolic != null) {
      map['bp_systolic'] = Variable<int>(bpSystolic);
    }
    if (!nullToAbsent || bpDiastolic != null) {
      map['bp_diastolic'] = Variable<int>(bpDiastolic);
    }
    if (!nullToAbsent || heartRate != null) {
      map['heart_rate'] = Variable<int>(heartRate);
    }
    if (!nullToAbsent || temperature != null) {
      map['temperature'] = Variable<double>(temperature);
    }
    if (!nullToAbsent || respiratoryRate != null) {
      map['respiratory_rate'] = Variable<int>(respiratoryRate);
    }
    if (!nullToAbsent || spo2 != null) {
      map['spo2'] = Variable<int>(spo2);
    }
    if (!nullToAbsent || bloodGlucose != null) {
      map['blood_glucose'] = Variable<double>(bloodGlucose);
    }
    if (!nullToAbsent || glucoseUnit != null) {
      map['glucose_unit'] = Variable<String>(glucoseUnit);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<double>(height);
    }
    return map;
  }

  VitalsCompanion toCompanion(bool nullToAbsent) {
    return VitalsCompanion(
      id: Value(id),
      visitId: Value(visitId),
      bpSystolic: bpSystolic == null && nullToAbsent
          ? const Value.absent()
          : Value(bpSystolic),
      bpDiastolic: bpDiastolic == null && nullToAbsent
          ? const Value.absent()
          : Value(bpDiastolic),
      heartRate: heartRate == null && nullToAbsent
          ? const Value.absent()
          : Value(heartRate),
      temperature: temperature == null && nullToAbsent
          ? const Value.absent()
          : Value(temperature),
      respiratoryRate: respiratoryRate == null && nullToAbsent
          ? const Value.absent()
          : Value(respiratoryRate),
      spo2: spo2 == null && nullToAbsent ? const Value.absent() : Value(spo2),
      bloodGlucose: bloodGlucose == null && nullToAbsent
          ? const Value.absent()
          : Value(bloodGlucose),
      glucoseUnit: glucoseUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(glucoseUnit),
      weight: weight == null && nullToAbsent
          ? const Value.absent()
          : Value(weight),
      height: height == null && nullToAbsent
          ? const Value.absent()
          : Value(height),
    );
  }

  factory VitalSign.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VitalSign(
      id: serializer.fromJson<String>(json['id']),
      visitId: serializer.fromJson<String>(json['visitId']),
      bpSystolic: serializer.fromJson<int?>(json['bpSystolic']),
      bpDiastolic: serializer.fromJson<int?>(json['bpDiastolic']),
      heartRate: serializer.fromJson<int?>(json['heartRate']),
      temperature: serializer.fromJson<double?>(json['temperature']),
      respiratoryRate: serializer.fromJson<int?>(json['respiratoryRate']),
      spo2: serializer.fromJson<int?>(json['spo2']),
      bloodGlucose: serializer.fromJson<double?>(json['bloodGlucose']),
      glucoseUnit: serializer.fromJson<String?>(json['glucoseUnit']),
      weight: serializer.fromJson<double?>(json['weight']),
      height: serializer.fromJson<double?>(json['height']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'visitId': serializer.toJson<String>(visitId),
      'bpSystolic': serializer.toJson<int?>(bpSystolic),
      'bpDiastolic': serializer.toJson<int?>(bpDiastolic),
      'heartRate': serializer.toJson<int?>(heartRate),
      'temperature': serializer.toJson<double?>(temperature),
      'respiratoryRate': serializer.toJson<int?>(respiratoryRate),
      'spo2': serializer.toJson<int?>(spo2),
      'bloodGlucose': serializer.toJson<double?>(bloodGlucose),
      'glucoseUnit': serializer.toJson<String?>(glucoseUnit),
      'weight': serializer.toJson<double?>(weight),
      'height': serializer.toJson<double?>(height),
    };
  }

  VitalSign copyWith({
    String? id,
    String? visitId,
    Value<int?> bpSystolic = const Value.absent(),
    Value<int?> bpDiastolic = const Value.absent(),
    Value<int?> heartRate = const Value.absent(),
    Value<double?> temperature = const Value.absent(),
    Value<int?> respiratoryRate = const Value.absent(),
    Value<int?> spo2 = const Value.absent(),
    Value<double?> bloodGlucose = const Value.absent(),
    Value<String?> glucoseUnit = const Value.absent(),
    Value<double?> weight = const Value.absent(),
    Value<double?> height = const Value.absent(),
  }) => VitalSign(
    id: id ?? this.id,
    visitId: visitId ?? this.visitId,
    bpSystolic: bpSystolic.present ? bpSystolic.value : this.bpSystolic,
    bpDiastolic: bpDiastolic.present ? bpDiastolic.value : this.bpDiastolic,
    heartRate: heartRate.present ? heartRate.value : this.heartRate,
    temperature: temperature.present ? temperature.value : this.temperature,
    respiratoryRate: respiratoryRate.present
        ? respiratoryRate.value
        : this.respiratoryRate,
    spo2: spo2.present ? spo2.value : this.spo2,
    bloodGlucose: bloodGlucose.present ? bloodGlucose.value : this.bloodGlucose,
    glucoseUnit: glucoseUnit.present ? glucoseUnit.value : this.glucoseUnit,
    weight: weight.present ? weight.value : this.weight,
    height: height.present ? height.value : this.height,
  );
  VitalSign copyWithCompanion(VitalsCompanion data) {
    return VitalSign(
      id: data.id.present ? data.id.value : this.id,
      visitId: data.visitId.present ? data.visitId.value : this.visitId,
      bpSystolic: data.bpSystolic.present
          ? data.bpSystolic.value
          : this.bpSystolic,
      bpDiastolic: data.bpDiastolic.present
          ? data.bpDiastolic.value
          : this.bpDiastolic,
      heartRate: data.heartRate.present ? data.heartRate.value : this.heartRate,
      temperature: data.temperature.present
          ? data.temperature.value
          : this.temperature,
      respiratoryRate: data.respiratoryRate.present
          ? data.respiratoryRate.value
          : this.respiratoryRate,
      spo2: data.spo2.present ? data.spo2.value : this.spo2,
      bloodGlucose: data.bloodGlucose.present
          ? data.bloodGlucose.value
          : this.bloodGlucose,
      glucoseUnit: data.glucoseUnit.present
          ? data.glucoseUnit.value
          : this.glucoseUnit,
      weight: data.weight.present ? data.weight.value : this.weight,
      height: data.height.present ? data.height.value : this.height,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VitalSign(')
          ..write('id: $id, ')
          ..write('visitId: $visitId, ')
          ..write('bpSystolic: $bpSystolic, ')
          ..write('bpDiastolic: $bpDiastolic, ')
          ..write('heartRate: $heartRate, ')
          ..write('temperature: $temperature, ')
          ..write('respiratoryRate: $respiratoryRate, ')
          ..write('spo2: $spo2, ')
          ..write('bloodGlucose: $bloodGlucose, ')
          ..write('glucoseUnit: $glucoseUnit, ')
          ..write('weight: $weight, ')
          ..write('height: $height')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    visitId,
    bpSystolic,
    bpDiastolic,
    heartRate,
    temperature,
    respiratoryRate,
    spo2,
    bloodGlucose,
    glucoseUnit,
    weight,
    height,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VitalSign &&
          other.id == this.id &&
          other.visitId == this.visitId &&
          other.bpSystolic == this.bpSystolic &&
          other.bpDiastolic == this.bpDiastolic &&
          other.heartRate == this.heartRate &&
          other.temperature == this.temperature &&
          other.respiratoryRate == this.respiratoryRate &&
          other.spo2 == this.spo2 &&
          other.bloodGlucose == this.bloodGlucose &&
          other.glucoseUnit == this.glucoseUnit &&
          other.weight == this.weight &&
          other.height == this.height);
}

class VitalsCompanion extends UpdateCompanion<VitalSign> {
  final Value<String> id;
  final Value<String> visitId;
  final Value<int?> bpSystolic;
  final Value<int?> bpDiastolic;
  final Value<int?> heartRate;
  final Value<double?> temperature;
  final Value<int?> respiratoryRate;
  final Value<int?> spo2;
  final Value<double?> bloodGlucose;
  final Value<String?> glucoseUnit;
  final Value<double?> weight;
  final Value<double?> height;
  final Value<int> rowid;
  const VitalsCompanion({
    this.id = const Value.absent(),
    this.visitId = const Value.absent(),
    this.bpSystolic = const Value.absent(),
    this.bpDiastolic = const Value.absent(),
    this.heartRate = const Value.absent(),
    this.temperature = const Value.absent(),
    this.respiratoryRate = const Value.absent(),
    this.spo2 = const Value.absent(),
    this.bloodGlucose = const Value.absent(),
    this.glucoseUnit = const Value.absent(),
    this.weight = const Value.absent(),
    this.height = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VitalsCompanion.insert({
    required String id,
    required String visitId,
    this.bpSystolic = const Value.absent(),
    this.bpDiastolic = const Value.absent(),
    this.heartRate = const Value.absent(),
    this.temperature = const Value.absent(),
    this.respiratoryRate = const Value.absent(),
    this.spo2 = const Value.absent(),
    this.bloodGlucose = const Value.absent(),
    this.glucoseUnit = const Value.absent(),
    this.weight = const Value.absent(),
    this.height = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       visitId = Value(visitId);
  static Insertable<VitalSign> custom({
    Expression<String>? id,
    Expression<String>? visitId,
    Expression<int>? bpSystolic,
    Expression<int>? bpDiastolic,
    Expression<int>? heartRate,
    Expression<double>? temperature,
    Expression<int>? respiratoryRate,
    Expression<int>? spo2,
    Expression<double>? bloodGlucose,
    Expression<String>? glucoseUnit,
    Expression<double>? weight,
    Expression<double>? height,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (visitId != null) 'visit_id': visitId,
      if (bpSystolic != null) 'bp_systolic': bpSystolic,
      if (bpDiastolic != null) 'bp_diastolic': bpDiastolic,
      if (heartRate != null) 'heart_rate': heartRate,
      if (temperature != null) 'temperature': temperature,
      if (respiratoryRate != null) 'respiratory_rate': respiratoryRate,
      if (spo2 != null) 'spo2': spo2,
      if (bloodGlucose != null) 'blood_glucose': bloodGlucose,
      if (glucoseUnit != null) 'glucose_unit': glucoseUnit,
      if (weight != null) 'weight': weight,
      if (height != null) 'height': height,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VitalsCompanion copyWith({
    Value<String>? id,
    Value<String>? visitId,
    Value<int?>? bpSystolic,
    Value<int?>? bpDiastolic,
    Value<int?>? heartRate,
    Value<double?>? temperature,
    Value<int?>? respiratoryRate,
    Value<int?>? spo2,
    Value<double?>? bloodGlucose,
    Value<String?>? glucoseUnit,
    Value<double?>? weight,
    Value<double?>? height,
    Value<int>? rowid,
  }) {
    return VitalsCompanion(
      id: id ?? this.id,
      visitId: visitId ?? this.visitId,
      bpSystolic: bpSystolic ?? this.bpSystolic,
      bpDiastolic: bpDiastolic ?? this.bpDiastolic,
      heartRate: heartRate ?? this.heartRate,
      temperature: temperature ?? this.temperature,
      respiratoryRate: respiratoryRate ?? this.respiratoryRate,
      spo2: spo2 ?? this.spo2,
      bloodGlucose: bloodGlucose ?? this.bloodGlucose,
      glucoseUnit: glucoseUnit ?? this.glucoseUnit,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (visitId.present) {
      map['visit_id'] = Variable<String>(visitId.value);
    }
    if (bpSystolic.present) {
      map['bp_systolic'] = Variable<int>(bpSystolic.value);
    }
    if (bpDiastolic.present) {
      map['bp_diastolic'] = Variable<int>(bpDiastolic.value);
    }
    if (heartRate.present) {
      map['heart_rate'] = Variable<int>(heartRate.value);
    }
    if (temperature.present) {
      map['temperature'] = Variable<double>(temperature.value);
    }
    if (respiratoryRate.present) {
      map['respiratory_rate'] = Variable<int>(respiratoryRate.value);
    }
    if (spo2.present) {
      map['spo2'] = Variable<int>(spo2.value);
    }
    if (bloodGlucose.present) {
      map['blood_glucose'] = Variable<double>(bloodGlucose.value);
    }
    if (glucoseUnit.present) {
      map['glucose_unit'] = Variable<String>(glucoseUnit.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VitalsCompanion(')
          ..write('id: $id, ')
          ..write('visitId: $visitId, ')
          ..write('bpSystolic: $bpSystolic, ')
          ..write('bpDiastolic: $bpDiastolic, ')
          ..write('heartRate: $heartRate, ')
          ..write('temperature: $temperature, ')
          ..write('respiratoryRate: $respiratoryRate, ')
          ..write('spo2: $spo2, ')
          ..write('bloodGlucose: $bloodGlucose, ')
          ..write('glucoseUnit: $glucoseUnit, ')
          ..write('weight: $weight, ')
          ..write('height: $height, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ImmunizationsTable extends Immunizations
    with TableInfo<$ImmunizationsTable, ImmunizationRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ImmunizationsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _vaccineNameMeta = const VerificationMeta(
    'vaccineName',
  );
  @override
  late final GeneratedColumn<String> vaccineName = GeneratedColumn<String>(
    'vaccine_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateGivenMeta = const VerificationMeta(
    'dateGiven',
  );
  @override
  late final GeneratedColumn<DateTime> dateGiven = GeneratedColumn<DateTime>(
    'date_given',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    patientId,
    vaccineName,
    status,
    dateGiven,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'immunizations';
  @override
  VerificationContext validateIntegrity(
    Insertable<ImmunizationRecord> instance, {
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
    if (data.containsKey('vaccine_name')) {
      context.handle(
        _vaccineNameMeta,
        vaccineName.isAcceptableOrUnknown(
          data['vaccine_name']!,
          _vaccineNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_vaccineNameMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('date_given')) {
      context.handle(
        _dateGivenMeta,
        dateGiven.isAcceptableOrUnknown(data['date_given']!, _dateGivenMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ImmunizationRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ImmunizationRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      patientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}patient_id'],
      )!,
      vaccineName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vaccine_name'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      dateGiven: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_given'],
      ),
    );
  }

  @override
  $ImmunizationsTable createAlias(String alias) {
    return $ImmunizationsTable(attachedDatabase, alias);
  }
}

class ImmunizationRecord extends DataClass
    implements Insertable<ImmunizationRecord> {
  final String id;
  final String patientId;
  final String vaccineName;
  final String status;
  final DateTime? dateGiven;
  const ImmunizationRecord({
    required this.id,
    required this.patientId,
    required this.vaccineName,
    required this.status,
    this.dateGiven,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['patient_id'] = Variable<String>(patientId);
    map['vaccine_name'] = Variable<String>(vaccineName);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || dateGiven != null) {
      map['date_given'] = Variable<DateTime>(dateGiven);
    }
    return map;
  }

  ImmunizationsCompanion toCompanion(bool nullToAbsent) {
    return ImmunizationsCompanion(
      id: Value(id),
      patientId: Value(patientId),
      vaccineName: Value(vaccineName),
      status: Value(status),
      dateGiven: dateGiven == null && nullToAbsent
          ? const Value.absent()
          : Value(dateGiven),
    );
  }

  factory ImmunizationRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ImmunizationRecord(
      id: serializer.fromJson<String>(json['id']),
      patientId: serializer.fromJson<String>(json['patientId']),
      vaccineName: serializer.fromJson<String>(json['vaccineName']),
      status: serializer.fromJson<String>(json['status']),
      dateGiven: serializer.fromJson<DateTime?>(json['dateGiven']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'patientId': serializer.toJson<String>(patientId),
      'vaccineName': serializer.toJson<String>(vaccineName),
      'status': serializer.toJson<String>(status),
      'dateGiven': serializer.toJson<DateTime?>(dateGiven),
    };
  }

  ImmunizationRecord copyWith({
    String? id,
    String? patientId,
    String? vaccineName,
    String? status,
    Value<DateTime?> dateGiven = const Value.absent(),
  }) => ImmunizationRecord(
    id: id ?? this.id,
    patientId: patientId ?? this.patientId,
    vaccineName: vaccineName ?? this.vaccineName,
    status: status ?? this.status,
    dateGiven: dateGiven.present ? dateGiven.value : this.dateGiven,
  );
  ImmunizationRecord copyWithCompanion(ImmunizationsCompanion data) {
    return ImmunizationRecord(
      id: data.id.present ? data.id.value : this.id,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      vaccineName: data.vaccineName.present
          ? data.vaccineName.value
          : this.vaccineName,
      status: data.status.present ? data.status.value : this.status,
      dateGiven: data.dateGiven.present ? data.dateGiven.value : this.dateGiven,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ImmunizationRecord(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('vaccineName: $vaccineName, ')
          ..write('status: $status, ')
          ..write('dateGiven: $dateGiven')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, patientId, vaccineName, status, dateGiven);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImmunizationRecord &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.vaccineName == this.vaccineName &&
          other.status == this.status &&
          other.dateGiven == this.dateGiven);
}

class ImmunizationsCompanion extends UpdateCompanion<ImmunizationRecord> {
  final Value<String> id;
  final Value<String> patientId;
  final Value<String> vaccineName;
  final Value<String> status;
  final Value<DateTime?> dateGiven;
  final Value<int> rowid;
  const ImmunizationsCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.vaccineName = const Value.absent(),
    this.status = const Value.absent(),
    this.dateGiven = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ImmunizationsCompanion.insert({
    required String id,
    required String patientId,
    required String vaccineName,
    required String status,
    this.dateGiven = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       patientId = Value(patientId),
       vaccineName = Value(vaccineName),
       status = Value(status);
  static Insertable<ImmunizationRecord> custom({
    Expression<String>? id,
    Expression<String>? patientId,
    Expression<String>? vaccineName,
    Expression<String>? status,
    Expression<DateTime>? dateGiven,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (vaccineName != null) 'vaccine_name': vaccineName,
      if (status != null) 'status': status,
      if (dateGiven != null) 'date_given': dateGiven,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ImmunizationsCompanion copyWith({
    Value<String>? id,
    Value<String>? patientId,
    Value<String>? vaccineName,
    Value<String>? status,
    Value<DateTime?>? dateGiven,
    Value<int>? rowid,
  }) {
    return ImmunizationsCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      vaccineName: vaccineName ?? this.vaccineName,
      status: status ?? this.status,
      dateGiven: dateGiven ?? this.dateGiven,
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
    if (vaccineName.present) {
      map['vaccine_name'] = Variable<String>(vaccineName.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (dateGiven.present) {
      map['date_given'] = Variable<DateTime>(dateGiven.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImmunizationsCompanion(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('vaccineName: $vaccineName, ')
          ..write('status: $status, ')
          ..write('dateGiven: $dateGiven, ')
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
  late final $VitalsTable vitals = $VitalsTable(this);
  late final $ImmunizationsTable immunizations = $ImmunizationsTable(this);
  late final PatientsDao patientsDao = PatientsDao(this as AppDatabase);
  late final VisitsDao visitsDao = VisitsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    patients,
    visits,
    vitals,
    immunizations,
  ];
}

typedef $$PatientsTableCreateCompanionBuilder =
    PatientsCompanion Function({
      required String id,
      required String name,
      required DateTime dateOfBirth,
      required String gender,
      Value<String?> occupation,
      Value<String?> maritalStatus,
      Value<int?> numberOfChildren,
      Value<String> createdBy,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$PatientsTableUpdateCompanionBuilder =
    PatientsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<DateTime> dateOfBirth,
      Value<String> gender,
      Value<String?> occupation,
      Value<String?> maritalStatus,
      Value<int?> numberOfChildren,
      Value<String> createdBy,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$PatientsTableReferences
    extends BaseReferences<_$AppDatabase, $PatientsTable, Patient> {
  $$PatientsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$VisitsTable, List<Visit>> _visitsRefsTable(
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

  static MultiTypedResultKey<$ImmunizationsTable, List<ImmunizationRecord>>
  _immunizationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.immunizations,
    aliasName: $_aliasNameGenerator(db.patients.id, db.immunizations.patientId),
  );

  $$ImmunizationsTableProcessedTableManager get immunizationsRefs {
    final manager = $$ImmunizationsTableTableManager(
      $_db,
      $_db.immunizations,
    ).filter((f) => f.patientId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_immunizationsRefsTable($_db));
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get occupation => $composableBuilder(
    column: $table.occupation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get maritalStatus => $composableBuilder(
    column: $table.maritalStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numberOfChildren => $composableBuilder(
    column: $table.numberOfChildren,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
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

  Expression<bool> immunizationsRefs(
    Expression<bool> Function($$ImmunizationsTableFilterComposer f) f,
  ) {
    final $$ImmunizationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.immunizations,
      getReferencedColumn: (t) => t.patientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImmunizationsTableFilterComposer(
            $db: $db,
            $table: $db.immunizations,
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get occupation => $composableBuilder(
    column: $table.occupation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get maritalStatus => $composableBuilder(
    column: $table.maritalStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numberOfChildren => $composableBuilder(
    column: $table.numberOfChildren,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
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

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => column,
  );

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get occupation => $composableBuilder(
    column: $table.occupation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get maritalStatus => $composableBuilder(
    column: $table.maritalStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get numberOfChildren => $composableBuilder(
    column: $table.numberOfChildren,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

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

  Expression<T> immunizationsRefs<T extends Object>(
    Expression<T> Function($$ImmunizationsTableAnnotationComposer a) f,
  ) {
    final $$ImmunizationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.immunizations,
      getReferencedColumn: (t) => t.patientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImmunizationsTableAnnotationComposer(
            $db: $db,
            $table: $db.immunizations,
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
          Patient,
          $$PatientsTableFilterComposer,
          $$PatientsTableOrderingComposer,
          $$PatientsTableAnnotationComposer,
          $$PatientsTableCreateCompanionBuilder,
          $$PatientsTableUpdateCompanionBuilder,
          (Patient, $$PatientsTableReferences),
          Patient,
          PrefetchHooks Function({bool visitsRefs, bool immunizationsRefs})
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
                Value<String> name = const Value.absent(),
                Value<DateTime> dateOfBirth = const Value.absent(),
                Value<String> gender = const Value.absent(),
                Value<String?> occupation = const Value.absent(),
                Value<String?> maritalStatus = const Value.absent(),
                Value<int?> numberOfChildren = const Value.absent(),
                Value<String> createdBy = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PatientsCompanion(
                id: id,
                name: name,
                dateOfBirth: dateOfBirth,
                gender: gender,
                occupation: occupation,
                maritalStatus: maritalStatus,
                numberOfChildren: numberOfChildren,
                createdBy: createdBy,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required DateTime dateOfBirth,
                required String gender,
                Value<String?> occupation = const Value.absent(),
                Value<String?> maritalStatus = const Value.absent(),
                Value<int?> numberOfChildren = const Value.absent(),
                Value<String> createdBy = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PatientsCompanion.insert(
                id: id,
                name: name,
                dateOfBirth: dateOfBirth,
                gender: gender,
                occupation: occupation,
                maritalStatus: maritalStatus,
                numberOfChildren: numberOfChildren,
                createdBy: createdBy,
                createdAt: createdAt,
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
          prefetchHooksCallback:
              ({visitsRefs = false, immunizationsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (visitsRefs) db.visits,
                    if (immunizationsRefs) db.immunizations,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (visitsRefs)
                        await $_getPrefetchedData<
                          Patient,
                          $PatientsTable,
                          Visit
                        >(
                          currentTable: table,
                          referencedTable: $$PatientsTableReferences
                              ._visitsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PatientsTableReferences(
                                db,
                                table,
                                p0,
                              ).visitsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.patientId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (immunizationsRefs)
                        await $_getPrefetchedData<
                          Patient,
                          $PatientsTable,
                          ImmunizationRecord
                        >(
                          currentTable: table,
                          referencedTable: $$PatientsTableReferences
                              ._immunizationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PatientsTableReferences(
                                db,
                                table,
                                p0,
                              ).immunizationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.patientId == item.id,
                              ),
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
      Patient,
      $$PatientsTableFilterComposer,
      $$PatientsTableOrderingComposer,
      $$PatientsTableAnnotationComposer,
      $$PatientsTableCreateCompanionBuilder,
      $$PatientsTableUpdateCompanionBuilder,
      (Patient, $$PatientsTableReferences),
      Patient,
      PrefetchHooks Function({bool visitsRefs, bool immunizationsRefs})
    >;
typedef $$VisitsTableCreateCompanionBuilder =
    VisitsCompanion Function({
      required String id,
      required String patientId,
      Value<DateTime> visitDate,
      Value<String?> mainComplaint,
      Value<String> createdBy,
      Value<String?> clinicalPayloadJson,
      Value<int> rowid,
    });
typedef $$VisitsTableUpdateCompanionBuilder =
    VisitsCompanion Function({
      Value<String> id,
      Value<String> patientId,
      Value<DateTime> visitDate,
      Value<String?> mainComplaint,
      Value<String> createdBy,
      Value<String?> clinicalPayloadJson,
      Value<int> rowid,
    });

final class $$VisitsTableReferences
    extends BaseReferences<_$AppDatabase, $VisitsTable, Visit> {
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

  static MultiTypedResultKey<$VitalsTable, List<VitalSign>> _vitalsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.vitals,
    aliasName: $_aliasNameGenerator(db.visits.id, db.vitals.visitId),
  );

  $$VitalsTableProcessedTableManager get vitalsRefs {
    final manager = $$VitalsTableTableManager(
      $_db,
      $_db.vitals,
    ).filter((f) => f.visitId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_vitalsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
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

  ColumnFilters<String> get mainComplaint => $composableBuilder(
    column: $table.mainComplaint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clinicalPayloadJson => $composableBuilder(
    column: $table.clinicalPayloadJson,
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

  Expression<bool> vitalsRefs(
    Expression<bool> Function($$VitalsTableFilterComposer f) f,
  ) {
    final $$VitalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vitals,
      getReferencedColumn: (t) => t.visitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VitalsTableFilterComposer(
            $db: $db,
            $table: $db.vitals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
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

  ColumnOrderings<String> get mainComplaint => $composableBuilder(
    column: $table.mainComplaint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clinicalPayloadJson => $composableBuilder(
    column: $table.clinicalPayloadJson,
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

  GeneratedColumn<String> get mainComplaint => $composableBuilder(
    column: $table.mainComplaint,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  GeneratedColumn<String> get clinicalPayloadJson => $composableBuilder(
    column: $table.clinicalPayloadJson,
    builder: (column) => column,
  );

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

  Expression<T> vitalsRefs<T extends Object>(
    Expression<T> Function($$VitalsTableAnnotationComposer a) f,
  ) {
    final $$VitalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vitals,
      getReferencedColumn: (t) => t.visitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VitalsTableAnnotationComposer(
            $db: $db,
            $table: $db.vitals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VisitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VisitsTable,
          Visit,
          $$VisitsTableFilterComposer,
          $$VisitsTableOrderingComposer,
          $$VisitsTableAnnotationComposer,
          $$VisitsTableCreateCompanionBuilder,
          $$VisitsTableUpdateCompanionBuilder,
          (Visit, $$VisitsTableReferences),
          Visit,
          PrefetchHooks Function({bool patientId, bool vitalsRefs})
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
                Value<String?> mainComplaint = const Value.absent(),
                Value<String> createdBy = const Value.absent(),
                Value<String?> clinicalPayloadJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VisitsCompanion(
                id: id,
                patientId: patientId,
                visitDate: visitDate,
                mainComplaint: mainComplaint,
                createdBy: createdBy,
                clinicalPayloadJson: clinicalPayloadJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String patientId,
                Value<DateTime> visitDate = const Value.absent(),
                Value<String?> mainComplaint = const Value.absent(),
                Value<String> createdBy = const Value.absent(),
                Value<String?> clinicalPayloadJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VisitsCompanion.insert(
                id: id,
                patientId: patientId,
                visitDate: visitDate,
                mainComplaint: mainComplaint,
                createdBy: createdBy,
                clinicalPayloadJson: clinicalPayloadJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$VisitsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({patientId = false, vitalsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (vitalsRefs) db.vitals],
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
                return [
                  if (vitalsRefs)
                    await $_getPrefetchedData<Visit, $VisitsTable, VitalSign>(
                      currentTable: table,
                      referencedTable: $$VisitsTableReferences._vitalsRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$VisitsTableReferences(db, table, p0).vitalsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.visitId == item.id),
                      typedResults: items,
                    ),
                ];
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
      Visit,
      $$VisitsTableFilterComposer,
      $$VisitsTableOrderingComposer,
      $$VisitsTableAnnotationComposer,
      $$VisitsTableCreateCompanionBuilder,
      $$VisitsTableUpdateCompanionBuilder,
      (Visit, $$VisitsTableReferences),
      Visit,
      PrefetchHooks Function({bool patientId, bool vitalsRefs})
    >;
typedef $$VitalsTableCreateCompanionBuilder =
    VitalsCompanion Function({
      required String id,
      required String visitId,
      Value<int?> bpSystolic,
      Value<int?> bpDiastolic,
      Value<int?> heartRate,
      Value<double?> temperature,
      Value<int?> respiratoryRate,
      Value<int?> spo2,
      Value<double?> bloodGlucose,
      Value<String?> glucoseUnit,
      Value<double?> weight,
      Value<double?> height,
      Value<int> rowid,
    });
typedef $$VitalsTableUpdateCompanionBuilder =
    VitalsCompanion Function({
      Value<String> id,
      Value<String> visitId,
      Value<int?> bpSystolic,
      Value<int?> bpDiastolic,
      Value<int?> heartRate,
      Value<double?> temperature,
      Value<int?> respiratoryRate,
      Value<int?> spo2,
      Value<double?> bloodGlucose,
      Value<String?> glucoseUnit,
      Value<double?> weight,
      Value<double?> height,
      Value<int> rowid,
    });

final class $$VitalsTableReferences
    extends BaseReferences<_$AppDatabase, $VitalsTable, VitalSign> {
  $$VitalsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $VisitsTable _visitIdTable(_$AppDatabase db) => db.visits.createAlias(
    $_aliasNameGenerator(db.vitals.visitId, db.visits.id),
  );

  $$VisitsTableProcessedTableManager get visitId {
    final $_column = $_itemColumn<String>('visit_id')!;

    final manager = $$VisitsTableTableManager(
      $_db,
      $_db.visits,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_visitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$VitalsTableFilterComposer
    extends Composer<_$AppDatabase, $VitalsTable> {
  $$VitalsTableFilterComposer({
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

  ColumnFilters<int> get bpSystolic => $composableBuilder(
    column: $table.bpSystolic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bpDiastolic => $composableBuilder(
    column: $table.bpDiastolic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get heartRate => $composableBuilder(
    column: $table.heartRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get temperature => $composableBuilder(
    column: $table.temperature,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get respiratoryRate => $composableBuilder(
    column: $table.respiratoryRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get spo2 => $composableBuilder(
    column: $table.spo2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get bloodGlucose => $composableBuilder(
    column: $table.bloodGlucose,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get glucoseUnit => $composableBuilder(
    column: $table.glucoseUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  $$VisitsTableFilterComposer get visitId {
    final $$VisitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.visitId,
      referencedTable: $db.visits,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$VitalsTableOrderingComposer
    extends Composer<_$AppDatabase, $VitalsTable> {
  $$VitalsTableOrderingComposer({
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

  ColumnOrderings<int> get bpSystolic => $composableBuilder(
    column: $table.bpSystolic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bpDiastolic => $composableBuilder(
    column: $table.bpDiastolic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get heartRate => $composableBuilder(
    column: $table.heartRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get temperature => $composableBuilder(
    column: $table.temperature,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get respiratoryRate => $composableBuilder(
    column: $table.respiratoryRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get spo2 => $composableBuilder(
    column: $table.spo2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get bloodGlucose => $composableBuilder(
    column: $table.bloodGlucose,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get glucoseUnit => $composableBuilder(
    column: $table.glucoseUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  $$VisitsTableOrderingComposer get visitId {
    final $$VisitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.visitId,
      referencedTable: $db.visits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisitsTableOrderingComposer(
            $db: $db,
            $table: $db.visits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VitalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $VitalsTable> {
  $$VitalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get bpSystolic => $composableBuilder(
    column: $table.bpSystolic,
    builder: (column) => column,
  );

  GeneratedColumn<int> get bpDiastolic => $composableBuilder(
    column: $table.bpDiastolic,
    builder: (column) => column,
  );

  GeneratedColumn<int> get heartRate =>
      $composableBuilder(column: $table.heartRate, builder: (column) => column);

  GeneratedColumn<double> get temperature => $composableBuilder(
    column: $table.temperature,
    builder: (column) => column,
  );

  GeneratedColumn<int> get respiratoryRate => $composableBuilder(
    column: $table.respiratoryRate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get spo2 =>
      $composableBuilder(column: $table.spo2, builder: (column) => column);

  GeneratedColumn<double> get bloodGlucose => $composableBuilder(
    column: $table.bloodGlucose,
    builder: (column) => column,
  );

  GeneratedColumn<String> get glucoseUnit => $composableBuilder(
    column: $table.glucoseUnit,
    builder: (column) => column,
  );

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<double> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  $$VisitsTableAnnotationComposer get visitId {
    final $$VisitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.visitId,
      referencedTable: $db.visits,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$VitalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VitalsTable,
          VitalSign,
          $$VitalsTableFilterComposer,
          $$VitalsTableOrderingComposer,
          $$VitalsTableAnnotationComposer,
          $$VitalsTableCreateCompanionBuilder,
          $$VitalsTableUpdateCompanionBuilder,
          (VitalSign, $$VitalsTableReferences),
          VitalSign,
          PrefetchHooks Function({bool visitId})
        > {
  $$VitalsTableTableManager(_$AppDatabase db, $VitalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VitalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VitalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VitalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> visitId = const Value.absent(),
                Value<int?> bpSystolic = const Value.absent(),
                Value<int?> bpDiastolic = const Value.absent(),
                Value<int?> heartRate = const Value.absent(),
                Value<double?> temperature = const Value.absent(),
                Value<int?> respiratoryRate = const Value.absent(),
                Value<int?> spo2 = const Value.absent(),
                Value<double?> bloodGlucose = const Value.absent(),
                Value<String?> glucoseUnit = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<double?> height = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VitalsCompanion(
                id: id,
                visitId: visitId,
                bpSystolic: bpSystolic,
                bpDiastolic: bpDiastolic,
                heartRate: heartRate,
                temperature: temperature,
                respiratoryRate: respiratoryRate,
                spo2: spo2,
                bloodGlucose: bloodGlucose,
                glucoseUnit: glucoseUnit,
                weight: weight,
                height: height,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String visitId,
                Value<int?> bpSystolic = const Value.absent(),
                Value<int?> bpDiastolic = const Value.absent(),
                Value<int?> heartRate = const Value.absent(),
                Value<double?> temperature = const Value.absent(),
                Value<int?> respiratoryRate = const Value.absent(),
                Value<int?> spo2 = const Value.absent(),
                Value<double?> bloodGlucose = const Value.absent(),
                Value<String?> glucoseUnit = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<double?> height = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VitalsCompanion.insert(
                id: id,
                visitId: visitId,
                bpSystolic: bpSystolic,
                bpDiastolic: bpDiastolic,
                heartRate: heartRate,
                temperature: temperature,
                respiratoryRate: respiratoryRate,
                spo2: spo2,
                bloodGlucose: bloodGlucose,
                glucoseUnit: glucoseUnit,
                weight: weight,
                height: height,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$VitalsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({visitId = false}) {
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
                    if (visitId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.visitId,
                                referencedTable: $$VitalsTableReferences
                                    ._visitIdTable(db),
                                referencedColumn: $$VitalsTableReferences
                                    ._visitIdTable(db)
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

typedef $$VitalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VitalsTable,
      VitalSign,
      $$VitalsTableFilterComposer,
      $$VitalsTableOrderingComposer,
      $$VitalsTableAnnotationComposer,
      $$VitalsTableCreateCompanionBuilder,
      $$VitalsTableUpdateCompanionBuilder,
      (VitalSign, $$VitalsTableReferences),
      VitalSign,
      PrefetchHooks Function({bool visitId})
    >;
typedef $$ImmunizationsTableCreateCompanionBuilder =
    ImmunizationsCompanion Function({
      required String id,
      required String patientId,
      required String vaccineName,
      required String status,
      Value<DateTime?> dateGiven,
      Value<int> rowid,
    });
typedef $$ImmunizationsTableUpdateCompanionBuilder =
    ImmunizationsCompanion Function({
      Value<String> id,
      Value<String> patientId,
      Value<String> vaccineName,
      Value<String> status,
      Value<DateTime?> dateGiven,
      Value<int> rowid,
    });

final class $$ImmunizationsTableReferences
    extends
        BaseReferences<_$AppDatabase, $ImmunizationsTable, ImmunizationRecord> {
  $$ImmunizationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PatientsTable _patientIdTable(_$AppDatabase db) =>
      db.patients.createAlias(
        $_aliasNameGenerator(db.immunizations.patientId, db.patients.id),
      );

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

class $$ImmunizationsTableFilterComposer
    extends Composer<_$AppDatabase, $ImmunizationsTable> {
  $$ImmunizationsTableFilterComposer({
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

  ColumnFilters<String> get vaccineName => $composableBuilder(
    column: $table.vaccineName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateGiven => $composableBuilder(
    column: $table.dateGiven,
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

class $$ImmunizationsTableOrderingComposer
    extends Composer<_$AppDatabase, $ImmunizationsTable> {
  $$ImmunizationsTableOrderingComposer({
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

  ColumnOrderings<String> get vaccineName => $composableBuilder(
    column: $table.vaccineName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateGiven => $composableBuilder(
    column: $table.dateGiven,
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

class $$ImmunizationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ImmunizationsTable> {
  $$ImmunizationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get vaccineName => $composableBuilder(
    column: $table.vaccineName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get dateGiven =>
      $composableBuilder(column: $table.dateGiven, builder: (column) => column);

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

class $$ImmunizationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ImmunizationsTable,
          ImmunizationRecord,
          $$ImmunizationsTableFilterComposer,
          $$ImmunizationsTableOrderingComposer,
          $$ImmunizationsTableAnnotationComposer,
          $$ImmunizationsTableCreateCompanionBuilder,
          $$ImmunizationsTableUpdateCompanionBuilder,
          (ImmunizationRecord, $$ImmunizationsTableReferences),
          ImmunizationRecord,
          PrefetchHooks Function({bool patientId})
        > {
  $$ImmunizationsTableTableManager(_$AppDatabase db, $ImmunizationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ImmunizationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ImmunizationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ImmunizationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> patientId = const Value.absent(),
                Value<String> vaccineName = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> dateGiven = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ImmunizationsCompanion(
                id: id,
                patientId: patientId,
                vaccineName: vaccineName,
                status: status,
                dateGiven: dateGiven,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String patientId,
                required String vaccineName,
                required String status,
                Value<DateTime?> dateGiven = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ImmunizationsCompanion.insert(
                id: id,
                patientId: patientId,
                vaccineName: vaccineName,
                status: status,
                dateGiven: dateGiven,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ImmunizationsTableReferences(db, table, e),
                ),
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
                                referencedTable: $$ImmunizationsTableReferences
                                    ._patientIdTable(db),
                                referencedColumn: $$ImmunizationsTableReferences
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

typedef $$ImmunizationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ImmunizationsTable,
      ImmunizationRecord,
      $$ImmunizationsTableFilterComposer,
      $$ImmunizationsTableOrderingComposer,
      $$ImmunizationsTableAnnotationComposer,
      $$ImmunizationsTableCreateCompanionBuilder,
      $$ImmunizationsTableUpdateCompanionBuilder,
      (ImmunizationRecord, $$ImmunizationsTableReferences),
      ImmunizationRecord,
      PrefetchHooks Function({bool patientId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PatientsTableTableManager get patients =>
      $$PatientsTableTableManager(_db, _db.patients);
  $$VisitsTableTableManager get visits =>
      $$VisitsTableTableManager(_db, _db.visits);
  $$VitalsTableTableManager get vitals =>
      $$VitalsTableTableManager(_db, _db.vitals);
  $$ImmunizationsTableTableManager get immunizations =>
      $$ImmunizationsTableTableManager(_db, _db.immunizations);
}
