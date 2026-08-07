// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ControlesPesajeTable extends ControlesPesaje
    with TableInfo<$ControlesPesajeTable, ControlesPesajeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ControlesPesajeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tituloMeta = const VerificationMeta('titulo');
  @override
  late final GeneratedColumn<String> titulo = GeneratedColumn<String>(
      'titulo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fechaMeta = const VerificationMeta('fecha');
  @override
  late final GeneratedColumn<DateTime> fecha = GeneratedColumn<DateTime>(
      'fecha', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _creadoEnMeta =
      const VerificationMeta('creadoEn');
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
      'creado_en', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, titulo, fecha, creadoEn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'controles_pesaje';
  @override
  VerificationContext validateIntegrity(
      Insertable<ControlesPesajeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('titulo')) {
      context.handle(_tituloMeta,
          titulo.isAcceptableOrUnknown(data['titulo']!, _tituloMeta));
    } else if (isInserting) {
      context.missing(_tituloMeta);
    }
    if (data.containsKey('fecha')) {
      context.handle(
          _fechaMeta, fecha.isAcceptableOrUnknown(data['fecha']!, _fechaMeta));
    } else if (isInserting) {
      context.missing(_fechaMeta);
    }
    if (data.containsKey('creado_en')) {
      context.handle(_creadoEnMeta,
          creadoEn.isAcceptableOrUnknown(data['creado_en']!, _creadoEnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ControlesPesajeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ControlesPesajeData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      titulo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}titulo'])!,
      fecha: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}fecha'])!,
      creadoEn: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}creado_en'])!,
    );
  }

  @override
  $ControlesPesajeTable createAlias(String alias) {
    return $ControlesPesajeTable(attachedDatabase, alias);
  }
}

class ControlesPesajeData extends DataClass
    implements Insertable<ControlesPesajeData> {
  final int id;
  final String titulo;
  final DateTime fecha;
  final DateTime creadoEn;
  const ControlesPesajeData(
      {required this.id,
      required this.titulo,
      required this.fecha,
      required this.creadoEn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['titulo'] = Variable<String>(titulo);
    map['fecha'] = Variable<DateTime>(fecha);
    map['creado_en'] = Variable<DateTime>(creadoEn);
    return map;
  }

  ControlesPesajeCompanion toCompanion(bool nullToAbsent) {
    return ControlesPesajeCompanion(
      id: Value(id),
      titulo: Value(titulo),
      fecha: Value(fecha),
      creadoEn: Value(creadoEn),
    );
  }

  factory ControlesPesajeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ControlesPesajeData(
      id: serializer.fromJson<int>(json['id']),
      titulo: serializer.fromJson<String>(json['titulo']),
      fecha: serializer.fromJson<DateTime>(json['fecha']),
      creadoEn: serializer.fromJson<DateTime>(json['creadoEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'titulo': serializer.toJson<String>(titulo),
      'fecha': serializer.toJson<DateTime>(fecha),
      'creadoEn': serializer.toJson<DateTime>(creadoEn),
    };
  }

  ControlesPesajeData copyWith(
          {int? id, String? titulo, DateTime? fecha, DateTime? creadoEn}) =>
      ControlesPesajeData(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        fecha: fecha ?? this.fecha,
        creadoEn: creadoEn ?? this.creadoEn,
      );
  ControlesPesajeData copyWithCompanion(ControlesPesajeCompanion data) {
    return ControlesPesajeData(
      id: data.id.present ? data.id.value : this.id,
      titulo: data.titulo.present ? data.titulo.value : this.titulo,
      fecha: data.fecha.present ? data.fecha.value : this.fecha,
      creadoEn: data.creadoEn.present ? data.creadoEn.value : this.creadoEn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ControlesPesajeData(')
          ..write('id: $id, ')
          ..write('titulo: $titulo, ')
          ..write('fecha: $fecha, ')
          ..write('creadoEn: $creadoEn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, titulo, fecha, creadoEn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ControlesPesajeData &&
          other.id == this.id &&
          other.titulo == this.titulo &&
          other.fecha == this.fecha &&
          other.creadoEn == this.creadoEn);
}

class ControlesPesajeCompanion extends UpdateCompanion<ControlesPesajeData> {
  final Value<int> id;
  final Value<String> titulo;
  final Value<DateTime> fecha;
  final Value<DateTime> creadoEn;
  const ControlesPesajeCompanion({
    this.id = const Value.absent(),
    this.titulo = const Value.absent(),
    this.fecha = const Value.absent(),
    this.creadoEn = const Value.absent(),
  });
  ControlesPesajeCompanion.insert({
    this.id = const Value.absent(),
    required String titulo,
    required DateTime fecha,
    this.creadoEn = const Value.absent(),
  })  : titulo = Value(titulo),
        fecha = Value(fecha);
  static Insertable<ControlesPesajeData> custom({
    Expression<int>? id,
    Expression<String>? titulo,
    Expression<DateTime>? fecha,
    Expression<DateTime>? creadoEn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (titulo != null) 'titulo': titulo,
      if (fecha != null) 'fecha': fecha,
      if (creadoEn != null) 'creado_en': creadoEn,
    });
  }

  ControlesPesajeCompanion copyWith(
      {Value<int>? id,
      Value<String>? titulo,
      Value<DateTime>? fecha,
      Value<DateTime>? creadoEn}) {
    return ControlesPesajeCompanion(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      fecha: fecha ?? this.fecha,
      creadoEn: creadoEn ?? this.creadoEn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (titulo.present) {
      map['titulo'] = Variable<String>(titulo.value);
    }
    if (fecha.present) {
      map['fecha'] = Variable<DateTime>(fecha.value);
    }
    if (creadoEn.present) {
      map['creado_en'] = Variable<DateTime>(creadoEn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ControlesPesajeCompanion(')
          ..write('id: $id, ')
          ..write('titulo: $titulo, ')
          ..write('fecha: $fecha, ')
          ..write('creadoEn: $creadoEn')
          ..write(')'))
        .toString();
  }
}

class $CategoriasPesajeTable extends CategoriasPesaje
    with TableInfo<$CategoriasPesajeTable, CategoriasPesajeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriasPesajeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _controlPesajeIdMeta =
      const VerificationMeta('controlPesajeId');
  @override
  late final GeneratedColumn<int> controlPesajeId = GeneratedColumn<int>(
      'control_pesaje_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES controles_pesaje (id) ON DELETE CASCADE'));
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
      'nombre', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _porcentajeDestareMeta =
      const VerificationMeta('porcentajeDestare');
  @override
  late final GeneratedColumn<double> porcentajeDestare =
      GeneratedColumn<double>('porcentaje_destare', aliasedName, false,
          type: DriftSqlType.double,
          requiredDuringInsert: false,
          defaultValue: const Constant(0));
  static const VerificationMeta _creadoEnMeta =
      const VerificationMeta('creadoEn');
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
      'creado_en', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, controlPesajeId, nombre, porcentajeDestare, creadoEn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categorias_pesaje';
  @override
  VerificationContext validateIntegrity(
      Insertable<CategoriasPesajeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('control_pesaje_id')) {
      context.handle(
          _controlPesajeIdMeta,
          controlPesajeId.isAcceptableOrUnknown(
              data['control_pesaje_id']!, _controlPesajeIdMeta));
    } else if (isInserting) {
      context.missing(_controlPesajeIdMeta);
    }
    if (data.containsKey('nombre')) {
      context.handle(_nombreMeta,
          nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta));
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('porcentaje_destare')) {
      context.handle(
          _porcentajeDestareMeta,
          porcentajeDestare.isAcceptableOrUnknown(
              data['porcentaje_destare']!, _porcentajeDestareMeta));
    }
    if (data.containsKey('creado_en')) {
      context.handle(_creadoEnMeta,
          creadoEn.isAcceptableOrUnknown(data['creado_en']!, _creadoEnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoriasPesajeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoriasPesajeData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      controlPesajeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}control_pesaje_id'])!,
      nombre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre'])!,
      porcentajeDestare: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}porcentaje_destare'])!,
      creadoEn: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}creado_en'])!,
    );
  }

  @override
  $CategoriasPesajeTable createAlias(String alias) {
    return $CategoriasPesajeTable(attachedDatabase, alias);
  }
}

class CategoriasPesajeData extends DataClass
    implements Insertable<CategoriasPesajeData> {
  final int id;
  final int controlPesajeId;
  final String nombre;
  final double porcentajeDestare;
  final DateTime creadoEn;
  const CategoriasPesajeData(
      {required this.id,
      required this.controlPesajeId,
      required this.nombre,
      required this.porcentajeDestare,
      required this.creadoEn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['control_pesaje_id'] = Variable<int>(controlPesajeId);
    map['nombre'] = Variable<String>(nombre);
    map['porcentaje_destare'] = Variable<double>(porcentajeDestare);
    map['creado_en'] = Variable<DateTime>(creadoEn);
    return map;
  }

  CategoriasPesajeCompanion toCompanion(bool nullToAbsent) {
    return CategoriasPesajeCompanion(
      id: Value(id),
      controlPesajeId: Value(controlPesajeId),
      nombre: Value(nombre),
      porcentajeDestare: Value(porcentajeDestare),
      creadoEn: Value(creadoEn),
    );
  }

  factory CategoriasPesajeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoriasPesajeData(
      id: serializer.fromJson<int>(json['id']),
      controlPesajeId: serializer.fromJson<int>(json['controlPesajeId']),
      nombre: serializer.fromJson<String>(json['nombre']),
      porcentajeDestare: serializer.fromJson<double>(json['porcentajeDestare']),
      creadoEn: serializer.fromJson<DateTime>(json['creadoEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'controlPesajeId': serializer.toJson<int>(controlPesajeId),
      'nombre': serializer.toJson<String>(nombre),
      'porcentajeDestare': serializer.toJson<double>(porcentajeDestare),
      'creadoEn': serializer.toJson<DateTime>(creadoEn),
    };
  }

  CategoriasPesajeData copyWith(
          {int? id,
          int? controlPesajeId,
          String? nombre,
          double? porcentajeDestare,
          DateTime? creadoEn}) =>
      CategoriasPesajeData(
        id: id ?? this.id,
        controlPesajeId: controlPesajeId ?? this.controlPesajeId,
        nombre: nombre ?? this.nombre,
        porcentajeDestare: porcentajeDestare ?? this.porcentajeDestare,
        creadoEn: creadoEn ?? this.creadoEn,
      );
  CategoriasPesajeData copyWithCompanion(CategoriasPesajeCompanion data) {
    return CategoriasPesajeData(
      id: data.id.present ? data.id.value : this.id,
      controlPesajeId: data.controlPesajeId.present
          ? data.controlPesajeId.value
          : this.controlPesajeId,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      porcentajeDestare: data.porcentajeDestare.present
          ? data.porcentajeDestare.value
          : this.porcentajeDestare,
      creadoEn: data.creadoEn.present ? data.creadoEn.value : this.creadoEn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoriasPesajeData(')
          ..write('id: $id, ')
          ..write('controlPesajeId: $controlPesajeId, ')
          ..write('nombre: $nombre, ')
          ..write('porcentajeDestare: $porcentajeDestare, ')
          ..write('creadoEn: $creadoEn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, controlPesajeId, nombre, porcentajeDestare, creadoEn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoriasPesajeData &&
          other.id == this.id &&
          other.controlPesajeId == this.controlPesajeId &&
          other.nombre == this.nombre &&
          other.porcentajeDestare == this.porcentajeDestare &&
          other.creadoEn == this.creadoEn);
}

class CategoriasPesajeCompanion extends UpdateCompanion<CategoriasPesajeData> {
  final Value<int> id;
  final Value<int> controlPesajeId;
  final Value<String> nombre;
  final Value<double> porcentajeDestare;
  final Value<DateTime> creadoEn;
  const CategoriasPesajeCompanion({
    this.id = const Value.absent(),
    this.controlPesajeId = const Value.absent(),
    this.nombre = const Value.absent(),
    this.porcentajeDestare = const Value.absent(),
    this.creadoEn = const Value.absent(),
  });
  CategoriasPesajeCompanion.insert({
    this.id = const Value.absent(),
    required int controlPesajeId,
    required String nombre,
    this.porcentajeDestare = const Value.absent(),
    this.creadoEn = const Value.absent(),
  })  : controlPesajeId = Value(controlPesajeId),
        nombre = Value(nombre);
  static Insertable<CategoriasPesajeData> custom({
    Expression<int>? id,
    Expression<int>? controlPesajeId,
    Expression<String>? nombre,
    Expression<double>? porcentajeDestare,
    Expression<DateTime>? creadoEn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (controlPesajeId != null) 'control_pesaje_id': controlPesajeId,
      if (nombre != null) 'nombre': nombre,
      if (porcentajeDestare != null) 'porcentaje_destare': porcentajeDestare,
      if (creadoEn != null) 'creado_en': creadoEn,
    });
  }

  CategoriasPesajeCompanion copyWith(
      {Value<int>? id,
      Value<int>? controlPesajeId,
      Value<String>? nombre,
      Value<double>? porcentajeDestare,
      Value<DateTime>? creadoEn}) {
    return CategoriasPesajeCompanion(
      id: id ?? this.id,
      controlPesajeId: controlPesajeId ?? this.controlPesajeId,
      nombre: nombre ?? this.nombre,
      porcentajeDestare: porcentajeDestare ?? this.porcentajeDestare,
      creadoEn: creadoEn ?? this.creadoEn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (controlPesajeId.present) {
      map['control_pesaje_id'] = Variable<int>(controlPesajeId.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (porcentajeDestare.present) {
      map['porcentaje_destare'] = Variable<double>(porcentajeDestare.value);
    }
    if (creadoEn.present) {
      map['creado_en'] = Variable<DateTime>(creadoEn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriasPesajeCompanion(')
          ..write('id: $id, ')
          ..write('controlPesajeId: $controlPesajeId, ')
          ..write('nombre: $nombre, ')
          ..write('porcentajeDestare: $porcentajeDestare, ')
          ..write('creadoEn: $creadoEn')
          ..write(')'))
        .toString();
  }
}

class $AnimalesPesajeTable extends AnimalesPesaje
    with TableInfo<$AnimalesPesajeTable, AnimalesPesajeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnimalesPesajeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _categoriaPesajeIdMeta =
      const VerificationMeta('categoriaPesajeId');
  @override
  late final GeneratedColumn<int> categoriaPesajeId = GeneratedColumn<int>(
      'categoria_pesaje_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES categorias_pesaje (id) ON DELETE CASCADE'));
  static const VerificationMeta _identificativoMeta =
      const VerificationMeta('identificativo');
  @override
  late final GeneratedColumn<String> identificativo = GeneratedColumn<String>(
      'identificativo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pesoMeta = const VerificationMeta('peso');
  @override
  late final GeneratedColumn<double> peso = GeneratedColumn<double>(
      'peso', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _creadoEnMeta =
      const VerificationMeta('creadoEn');
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
      'creado_en', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, categoriaPesajeId, identificativo, peso, creadoEn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'animales_pesaje';
  @override
  VerificationContext validateIntegrity(Insertable<AnimalesPesajeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('categoria_pesaje_id')) {
      context.handle(
          _categoriaPesajeIdMeta,
          categoriaPesajeId.isAcceptableOrUnknown(
              data['categoria_pesaje_id']!, _categoriaPesajeIdMeta));
    } else if (isInserting) {
      context.missing(_categoriaPesajeIdMeta);
    }
    if (data.containsKey('identificativo')) {
      context.handle(
          _identificativoMeta,
          identificativo.isAcceptableOrUnknown(
              data['identificativo']!, _identificativoMeta));
    } else if (isInserting) {
      context.missing(_identificativoMeta);
    }
    if (data.containsKey('peso')) {
      context.handle(
          _pesoMeta, peso.isAcceptableOrUnknown(data['peso']!, _pesoMeta));
    } else if (isInserting) {
      context.missing(_pesoMeta);
    }
    if (data.containsKey('creado_en')) {
      context.handle(_creadoEnMeta,
          creadoEn.isAcceptableOrUnknown(data['creado_en']!, _creadoEnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AnimalesPesajeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AnimalesPesajeData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      categoriaPesajeId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}categoria_pesaje_id'])!,
      identificativo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}identificativo'])!,
      peso: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}peso'])!,
      creadoEn: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}creado_en'])!,
    );
  }

  @override
  $AnimalesPesajeTable createAlias(String alias) {
    return $AnimalesPesajeTable(attachedDatabase, alias);
  }
}

class AnimalesPesajeData extends DataClass
    implements Insertable<AnimalesPesajeData> {
  final int id;
  final int categoriaPesajeId;
  final String identificativo;
  final double peso;
  final DateTime creadoEn;
  const AnimalesPesajeData(
      {required this.id,
      required this.categoriaPesajeId,
      required this.identificativo,
      required this.peso,
      required this.creadoEn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['categoria_pesaje_id'] = Variable<int>(categoriaPesajeId);
    map['identificativo'] = Variable<String>(identificativo);
    map['peso'] = Variable<double>(peso);
    map['creado_en'] = Variable<DateTime>(creadoEn);
    return map;
  }

  AnimalesPesajeCompanion toCompanion(bool nullToAbsent) {
    return AnimalesPesajeCompanion(
      id: Value(id),
      categoriaPesajeId: Value(categoriaPesajeId),
      identificativo: Value(identificativo),
      peso: Value(peso),
      creadoEn: Value(creadoEn),
    );
  }

  factory AnimalesPesajeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnimalesPesajeData(
      id: serializer.fromJson<int>(json['id']),
      categoriaPesajeId: serializer.fromJson<int>(json['categoriaPesajeId']),
      identificativo: serializer.fromJson<String>(json['identificativo']),
      peso: serializer.fromJson<double>(json['peso']),
      creadoEn: serializer.fromJson<DateTime>(json['creadoEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoriaPesajeId': serializer.toJson<int>(categoriaPesajeId),
      'identificativo': serializer.toJson<String>(identificativo),
      'peso': serializer.toJson<double>(peso),
      'creadoEn': serializer.toJson<DateTime>(creadoEn),
    };
  }

  AnimalesPesajeData copyWith(
          {int? id,
          int? categoriaPesajeId,
          String? identificativo,
          double? peso,
          DateTime? creadoEn}) =>
      AnimalesPesajeData(
        id: id ?? this.id,
        categoriaPesajeId: categoriaPesajeId ?? this.categoriaPesajeId,
        identificativo: identificativo ?? this.identificativo,
        peso: peso ?? this.peso,
        creadoEn: creadoEn ?? this.creadoEn,
      );
  AnimalesPesajeData copyWithCompanion(AnimalesPesajeCompanion data) {
    return AnimalesPesajeData(
      id: data.id.present ? data.id.value : this.id,
      categoriaPesajeId: data.categoriaPesajeId.present
          ? data.categoriaPesajeId.value
          : this.categoriaPesajeId,
      identificativo: data.identificativo.present
          ? data.identificativo.value
          : this.identificativo,
      peso: data.peso.present ? data.peso.value : this.peso,
      creadoEn: data.creadoEn.present ? data.creadoEn.value : this.creadoEn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AnimalesPesajeData(')
          ..write('id: $id, ')
          ..write('categoriaPesajeId: $categoriaPesajeId, ')
          ..write('identificativo: $identificativo, ')
          ..write('peso: $peso, ')
          ..write('creadoEn: $creadoEn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, categoriaPesajeId, identificativo, peso, creadoEn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnimalesPesajeData &&
          other.id == this.id &&
          other.categoriaPesajeId == this.categoriaPesajeId &&
          other.identificativo == this.identificativo &&
          other.peso == this.peso &&
          other.creadoEn == this.creadoEn);
}

class AnimalesPesajeCompanion extends UpdateCompanion<AnimalesPesajeData> {
  final Value<int> id;
  final Value<int> categoriaPesajeId;
  final Value<String> identificativo;
  final Value<double> peso;
  final Value<DateTime> creadoEn;
  const AnimalesPesajeCompanion({
    this.id = const Value.absent(),
    this.categoriaPesajeId = const Value.absent(),
    this.identificativo = const Value.absent(),
    this.peso = const Value.absent(),
    this.creadoEn = const Value.absent(),
  });
  AnimalesPesajeCompanion.insert({
    this.id = const Value.absent(),
    required int categoriaPesajeId,
    required String identificativo,
    required double peso,
    this.creadoEn = const Value.absent(),
  })  : categoriaPesajeId = Value(categoriaPesajeId),
        identificativo = Value(identificativo),
        peso = Value(peso);
  static Insertable<AnimalesPesajeData> custom({
    Expression<int>? id,
    Expression<int>? categoriaPesajeId,
    Expression<String>? identificativo,
    Expression<double>? peso,
    Expression<DateTime>? creadoEn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoriaPesajeId != null) 'categoria_pesaje_id': categoriaPesajeId,
      if (identificativo != null) 'identificativo': identificativo,
      if (peso != null) 'peso': peso,
      if (creadoEn != null) 'creado_en': creadoEn,
    });
  }

  AnimalesPesajeCompanion copyWith(
      {Value<int>? id,
      Value<int>? categoriaPesajeId,
      Value<String>? identificativo,
      Value<double>? peso,
      Value<DateTime>? creadoEn}) {
    return AnimalesPesajeCompanion(
      id: id ?? this.id,
      categoriaPesajeId: categoriaPesajeId ?? this.categoriaPesajeId,
      identificativo: identificativo ?? this.identificativo,
      peso: peso ?? this.peso,
      creadoEn: creadoEn ?? this.creadoEn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoriaPesajeId.present) {
      map['categoria_pesaje_id'] = Variable<int>(categoriaPesajeId.value);
    }
    if (identificativo.present) {
      map['identificativo'] = Variable<String>(identificativo.value);
    }
    if (peso.present) {
      map['peso'] = Variable<double>(peso.value);
    }
    if (creadoEn.present) {
      map['creado_en'] = Variable<DateTime>(creadoEn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnimalesPesajeCompanion(')
          ..write('id: $id, ')
          ..write('categoriaPesajeId: $categoriaPesajeId, ')
          ..write('identificativo: $identificativo, ')
          ..write('peso: $peso, ')
          ..write('creadoEn: $creadoEn')
          ..write(')'))
        .toString();
  }
}

class $StockAnimalesTable extends StockAnimales
    with TableInfo<$StockAnimalesTable, StockAnimalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StockAnimalesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tipoMeta = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
      'tipo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cantidadMeta =
      const VerificationMeta('cantidad');
  @override
  late final GeneratedColumn<int> cantidad = GeneratedColumn<int>(
      'cantidad', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _creadoEnMeta =
      const VerificationMeta('creadoEn');
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
      'creado_en', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, tipo, cantidad, creadoEn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stock_animales';
  @override
  VerificationContext validateIntegrity(Insertable<StockAnimalData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tipo')) {
      context.handle(
          _tipoMeta, tipo.isAcceptableOrUnknown(data['tipo']!, _tipoMeta));
    } else if (isInserting) {
      context.missing(_tipoMeta);
    }
    if (data.containsKey('cantidad')) {
      context.handle(_cantidadMeta,
          cantidad.isAcceptableOrUnknown(data['cantidad']!, _cantidadMeta));
    } else if (isInserting) {
      context.missing(_cantidadMeta);
    }
    if (data.containsKey('creado_en')) {
      context.handle(_creadoEnMeta,
          creadoEn.isAcceptableOrUnknown(data['creado_en']!, _creadoEnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StockAnimalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StockAnimalData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      tipo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tipo'])!,
      cantidad: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cantidad'])!,
      creadoEn: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}creado_en'])!,
    );
  }

  @override
  $StockAnimalesTable createAlias(String alias) {
    return $StockAnimalesTable(attachedDatabase, alias);
  }
}

class StockAnimalData extends DataClass implements Insertable<StockAnimalData> {
  final int id;
  final String tipo;
  final int cantidad;
  final DateTime creadoEn;
  const StockAnimalData(
      {required this.id,
      required this.tipo,
      required this.cantidad,
      required this.creadoEn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tipo'] = Variable<String>(tipo);
    map['cantidad'] = Variable<int>(cantidad);
    map['creado_en'] = Variable<DateTime>(creadoEn);
    return map;
  }

  StockAnimalesCompanion toCompanion(bool nullToAbsent) {
    return StockAnimalesCompanion(
      id: Value(id),
      tipo: Value(tipo),
      cantidad: Value(cantidad),
      creadoEn: Value(creadoEn),
    );
  }

  factory StockAnimalData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StockAnimalData(
      id: serializer.fromJson<int>(json['id']),
      tipo: serializer.fromJson<String>(json['tipo']),
      cantidad: serializer.fromJson<int>(json['cantidad']),
      creadoEn: serializer.fromJson<DateTime>(json['creadoEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tipo': serializer.toJson<String>(tipo),
      'cantidad': serializer.toJson<int>(cantidad),
      'creadoEn': serializer.toJson<DateTime>(creadoEn),
    };
  }

  StockAnimalData copyWith(
          {int? id, String? tipo, int? cantidad, DateTime? creadoEn}) =>
      StockAnimalData(
        id: id ?? this.id,
        tipo: tipo ?? this.tipo,
        cantidad: cantidad ?? this.cantidad,
        creadoEn: creadoEn ?? this.creadoEn,
      );
  StockAnimalData copyWithCompanion(StockAnimalesCompanion data) {
    return StockAnimalData(
      id: data.id.present ? data.id.value : this.id,
      tipo: data.tipo.present ? data.tipo.value : this.tipo,
      cantidad: data.cantidad.present ? data.cantidad.value : this.cantidad,
      creadoEn: data.creadoEn.present ? data.creadoEn.value : this.creadoEn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StockAnimalData(')
          ..write('id: $id, ')
          ..write('tipo: $tipo, ')
          ..write('cantidad: $cantidad, ')
          ..write('creadoEn: $creadoEn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tipo, cantidad, creadoEn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StockAnimalData &&
          other.id == this.id &&
          other.tipo == this.tipo &&
          other.cantidad == this.cantidad &&
          other.creadoEn == this.creadoEn);
}

class StockAnimalesCompanion extends UpdateCompanion<StockAnimalData> {
  final Value<int> id;
  final Value<String> tipo;
  final Value<int> cantidad;
  final Value<DateTime> creadoEn;
  const StockAnimalesCompanion({
    this.id = const Value.absent(),
    this.tipo = const Value.absent(),
    this.cantidad = const Value.absent(),
    this.creadoEn = const Value.absent(),
  });
  StockAnimalesCompanion.insert({
    this.id = const Value.absent(),
    required String tipo,
    required int cantidad,
    this.creadoEn = const Value.absent(),
  })  : tipo = Value(tipo),
        cantidad = Value(cantidad);
  static Insertable<StockAnimalData> custom({
    Expression<int>? id,
    Expression<String>? tipo,
    Expression<int>? cantidad,
    Expression<DateTime>? creadoEn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tipo != null) 'tipo': tipo,
      if (cantidad != null) 'cantidad': cantidad,
      if (creadoEn != null) 'creado_en': creadoEn,
    });
  }

  StockAnimalesCompanion copyWith(
      {Value<int>? id,
      Value<String>? tipo,
      Value<int>? cantidad,
      Value<DateTime>? creadoEn}) {
    return StockAnimalesCompanion(
      id: id ?? this.id,
      tipo: tipo ?? this.tipo,
      cantidad: cantidad ?? this.cantidad,
      creadoEn: creadoEn ?? this.creadoEn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tipo.present) {
      map['tipo'] = Variable<String>(tipo.value);
    }
    if (cantidad.present) {
      map['cantidad'] = Variable<int>(cantidad.value);
    }
    if (creadoEn.present) {
      map['creado_en'] = Variable<DateTime>(creadoEn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StockAnimalesCompanion(')
          ..write('id: $id, ')
          ..write('tipo: $tipo, ')
          ..write('cantidad: $cantidad, ')
          ..write('creadoEn: $creadoEn')
          ..write(')'))
        .toString();
  }
}

class $CarpetasControlTable extends CarpetasControl
    with TableInfo<$CarpetasControlTable, CarpetaControlData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CarpetasControlTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tituloMeta = const VerificationMeta('titulo');
  @override
  late final GeneratedColumn<String> titulo = GeneratedColumn<String>(
      'titulo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _creadoEnMeta =
      const VerificationMeta('creadoEn');
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
      'creado_en', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, titulo, creadoEn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'carpetas_control';
  @override
  VerificationContext validateIntegrity(Insertable<CarpetaControlData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('titulo')) {
      context.handle(_tituloMeta,
          titulo.isAcceptableOrUnknown(data['titulo']!, _tituloMeta));
    } else if (isInserting) {
      context.missing(_tituloMeta);
    }
    if (data.containsKey('creado_en')) {
      context.handle(_creadoEnMeta,
          creadoEn.isAcceptableOrUnknown(data['creado_en']!, _creadoEnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CarpetaControlData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CarpetaControlData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      titulo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}titulo'])!,
      creadoEn: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}creado_en'])!,
    );
  }

  @override
  $CarpetasControlTable createAlias(String alias) {
    return $CarpetasControlTable(attachedDatabase, alias);
  }
}

class CarpetaControlData extends DataClass
    implements Insertable<CarpetaControlData> {
  final int id;
  final String titulo;
  final DateTime creadoEn;
  const CarpetaControlData(
      {required this.id, required this.titulo, required this.creadoEn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['titulo'] = Variable<String>(titulo);
    map['creado_en'] = Variable<DateTime>(creadoEn);
    return map;
  }

  CarpetasControlCompanion toCompanion(bool nullToAbsent) {
    return CarpetasControlCompanion(
      id: Value(id),
      titulo: Value(titulo),
      creadoEn: Value(creadoEn),
    );
  }

  factory CarpetaControlData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CarpetaControlData(
      id: serializer.fromJson<int>(json['id']),
      titulo: serializer.fromJson<String>(json['titulo']),
      creadoEn: serializer.fromJson<DateTime>(json['creadoEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'titulo': serializer.toJson<String>(titulo),
      'creadoEn': serializer.toJson<DateTime>(creadoEn),
    };
  }

  CarpetaControlData copyWith({int? id, String? titulo, DateTime? creadoEn}) =>
      CarpetaControlData(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        creadoEn: creadoEn ?? this.creadoEn,
      );
  CarpetaControlData copyWithCompanion(CarpetasControlCompanion data) {
    return CarpetaControlData(
      id: data.id.present ? data.id.value : this.id,
      titulo: data.titulo.present ? data.titulo.value : this.titulo,
      creadoEn: data.creadoEn.present ? data.creadoEn.value : this.creadoEn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CarpetaControlData(')
          ..write('id: $id, ')
          ..write('titulo: $titulo, ')
          ..write('creadoEn: $creadoEn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, titulo, creadoEn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CarpetaControlData &&
          other.id == this.id &&
          other.titulo == this.titulo &&
          other.creadoEn == this.creadoEn);
}

class CarpetasControlCompanion extends UpdateCompanion<CarpetaControlData> {
  final Value<int> id;
  final Value<String> titulo;
  final Value<DateTime> creadoEn;
  const CarpetasControlCompanion({
    this.id = const Value.absent(),
    this.titulo = const Value.absent(),
    this.creadoEn = const Value.absent(),
  });
  CarpetasControlCompanion.insert({
    this.id = const Value.absent(),
    required String titulo,
    this.creadoEn = const Value.absent(),
  }) : titulo = Value(titulo);
  static Insertable<CarpetaControlData> custom({
    Expression<int>? id,
    Expression<String>? titulo,
    Expression<DateTime>? creadoEn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (titulo != null) 'titulo': titulo,
      if (creadoEn != null) 'creado_en': creadoEn,
    });
  }

  CarpetasControlCompanion copyWith(
      {Value<int>? id, Value<String>? titulo, Value<DateTime>? creadoEn}) {
    return CarpetasControlCompanion(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      creadoEn: creadoEn ?? this.creadoEn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (titulo.present) {
      map['titulo'] = Variable<String>(titulo.value);
    }
    if (creadoEn.present) {
      map['creado_en'] = Variable<DateTime>(creadoEn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CarpetasControlCompanion(')
          ..write('id: $id, ')
          ..write('titulo: $titulo, ')
          ..write('creadoEn: $creadoEn')
          ..write(')'))
        .toString();
  }
}

class $ActividadesControlTable extends ActividadesControl
    with TableInfo<$ActividadesControlTable, ActividadControlData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActividadesControlTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _carpetaControlIdMeta =
      const VerificationMeta('carpetaControlId');
  @override
  late final GeneratedColumn<int> carpetaControlId = GeneratedColumn<int>(
      'carpeta_control_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES carpetas_control (id) ON DELETE CASCADE'));
  static const VerificationMeta _tituloMeta = const VerificationMeta('titulo');
  @override
  late final GeneratedColumn<String> titulo = GeneratedColumn<String>(
      'titulo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fechaMeta = const VerificationMeta('fecha');
  @override
  late final GeneratedColumn<DateTime> fecha = GeneratedColumn<DateTime>(
      'fecha', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _creadoEnMeta =
      const VerificationMeta('creadoEn');
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
      'creado_en', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, carpetaControlId, titulo, fecha, creadoEn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'actividades_control';
  @override
  VerificationContext validateIntegrity(
      Insertable<ActividadControlData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('carpeta_control_id')) {
      context.handle(
          _carpetaControlIdMeta,
          carpetaControlId.isAcceptableOrUnknown(
              data['carpeta_control_id']!, _carpetaControlIdMeta));
    } else if (isInserting) {
      context.missing(_carpetaControlIdMeta);
    }
    if (data.containsKey('titulo')) {
      context.handle(_tituloMeta,
          titulo.isAcceptableOrUnknown(data['titulo']!, _tituloMeta));
    } else if (isInserting) {
      context.missing(_tituloMeta);
    }
    if (data.containsKey('fecha')) {
      context.handle(
          _fechaMeta, fecha.isAcceptableOrUnknown(data['fecha']!, _fechaMeta));
    } else if (isInserting) {
      context.missing(_fechaMeta);
    }
    if (data.containsKey('creado_en')) {
      context.handle(_creadoEnMeta,
          creadoEn.isAcceptableOrUnknown(data['creado_en']!, _creadoEnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActividadControlData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActividadControlData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      carpetaControlId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}carpeta_control_id'])!,
      titulo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}titulo'])!,
      fecha: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}fecha'])!,
      creadoEn: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}creado_en'])!,
    );
  }

  @override
  $ActividadesControlTable createAlias(String alias) {
    return $ActividadesControlTable(attachedDatabase, alias);
  }
}

class ActividadControlData extends DataClass
    implements Insertable<ActividadControlData> {
  final int id;
  final int carpetaControlId;
  final String titulo;
  final DateTime fecha;
  final DateTime creadoEn;
  const ActividadControlData(
      {required this.id,
      required this.carpetaControlId,
      required this.titulo,
      required this.fecha,
      required this.creadoEn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['carpeta_control_id'] = Variable<int>(carpetaControlId);
    map['titulo'] = Variable<String>(titulo);
    map['fecha'] = Variable<DateTime>(fecha);
    map['creado_en'] = Variable<DateTime>(creadoEn);
    return map;
  }

  ActividadesControlCompanion toCompanion(bool nullToAbsent) {
    return ActividadesControlCompanion(
      id: Value(id),
      carpetaControlId: Value(carpetaControlId),
      titulo: Value(titulo),
      fecha: Value(fecha),
      creadoEn: Value(creadoEn),
    );
  }

  factory ActividadControlData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActividadControlData(
      id: serializer.fromJson<int>(json['id']),
      carpetaControlId: serializer.fromJson<int>(json['carpetaControlId']),
      titulo: serializer.fromJson<String>(json['titulo']),
      fecha: serializer.fromJson<DateTime>(json['fecha']),
      creadoEn: serializer.fromJson<DateTime>(json['creadoEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'carpetaControlId': serializer.toJson<int>(carpetaControlId),
      'titulo': serializer.toJson<String>(titulo),
      'fecha': serializer.toJson<DateTime>(fecha),
      'creadoEn': serializer.toJson<DateTime>(creadoEn),
    };
  }

  ActividadControlData copyWith(
          {int? id,
          int? carpetaControlId,
          String? titulo,
          DateTime? fecha,
          DateTime? creadoEn}) =>
      ActividadControlData(
        id: id ?? this.id,
        carpetaControlId: carpetaControlId ?? this.carpetaControlId,
        titulo: titulo ?? this.titulo,
        fecha: fecha ?? this.fecha,
        creadoEn: creadoEn ?? this.creadoEn,
      );
  ActividadControlData copyWithCompanion(ActividadesControlCompanion data) {
    return ActividadControlData(
      id: data.id.present ? data.id.value : this.id,
      carpetaControlId: data.carpetaControlId.present
          ? data.carpetaControlId.value
          : this.carpetaControlId,
      titulo: data.titulo.present ? data.titulo.value : this.titulo,
      fecha: data.fecha.present ? data.fecha.value : this.fecha,
      creadoEn: data.creadoEn.present ? data.creadoEn.value : this.creadoEn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActividadControlData(')
          ..write('id: $id, ')
          ..write('carpetaControlId: $carpetaControlId, ')
          ..write('titulo: $titulo, ')
          ..write('fecha: $fecha, ')
          ..write('creadoEn: $creadoEn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, carpetaControlId, titulo, fecha, creadoEn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActividadControlData &&
          other.id == this.id &&
          other.carpetaControlId == this.carpetaControlId &&
          other.titulo == this.titulo &&
          other.fecha == this.fecha &&
          other.creadoEn == this.creadoEn);
}

class ActividadesControlCompanion
    extends UpdateCompanion<ActividadControlData> {
  final Value<int> id;
  final Value<int> carpetaControlId;
  final Value<String> titulo;
  final Value<DateTime> fecha;
  final Value<DateTime> creadoEn;
  const ActividadesControlCompanion({
    this.id = const Value.absent(),
    this.carpetaControlId = const Value.absent(),
    this.titulo = const Value.absent(),
    this.fecha = const Value.absent(),
    this.creadoEn = const Value.absent(),
  });
  ActividadesControlCompanion.insert({
    this.id = const Value.absent(),
    required int carpetaControlId,
    required String titulo,
    required DateTime fecha,
    this.creadoEn = const Value.absent(),
  })  : carpetaControlId = Value(carpetaControlId),
        titulo = Value(titulo),
        fecha = Value(fecha);
  static Insertable<ActividadControlData> custom({
    Expression<int>? id,
    Expression<int>? carpetaControlId,
    Expression<String>? titulo,
    Expression<DateTime>? fecha,
    Expression<DateTime>? creadoEn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (carpetaControlId != null) 'carpeta_control_id': carpetaControlId,
      if (titulo != null) 'titulo': titulo,
      if (fecha != null) 'fecha': fecha,
      if (creadoEn != null) 'creado_en': creadoEn,
    });
  }

  ActividadesControlCompanion copyWith(
      {Value<int>? id,
      Value<int>? carpetaControlId,
      Value<String>? titulo,
      Value<DateTime>? fecha,
      Value<DateTime>? creadoEn}) {
    return ActividadesControlCompanion(
      id: id ?? this.id,
      carpetaControlId: carpetaControlId ?? this.carpetaControlId,
      titulo: titulo ?? this.titulo,
      fecha: fecha ?? this.fecha,
      creadoEn: creadoEn ?? this.creadoEn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (carpetaControlId.present) {
      map['carpeta_control_id'] = Variable<int>(carpetaControlId.value);
    }
    if (titulo.present) {
      map['titulo'] = Variable<String>(titulo.value);
    }
    if (fecha.present) {
      map['fecha'] = Variable<DateTime>(fecha.value);
    }
    if (creadoEn.present) {
      map['creado_en'] = Variable<DateTime>(creadoEn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActividadesControlCompanion(')
          ..write('id: $id, ')
          ..write('carpetaControlId: $carpetaControlId, ')
          ..write('titulo: $titulo, ')
          ..write('fecha: $fecha, ')
          ..write('creadoEn: $creadoEn')
          ..write(')'))
        .toString();
  }
}

class $TarjasControlTable extends TarjasControl
    with TableInfo<$TarjasControlTable, TarjaControlData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TarjasControlTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _actividadControlIdMeta =
      const VerificationMeta('actividadControlId');
  @override
  late final GeneratedColumn<int> actividadControlId = GeneratedColumn<int>(
      'actividad_control_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES actividades_control (id) ON DELETE CASCADE'));
  static const VerificationMeta _tipoMeta = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
      'tipo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cantidadMeta =
      const VerificationMeta('cantidad');
  @override
  late final GeneratedColumn<int> cantidad = GeneratedColumn<int>(
      'cantidad', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _creadoEnMeta =
      const VerificationMeta('creadoEn');
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
      'creado_en', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, actividadControlId, tipo, cantidad, creadoEn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tarjas_control';
  @override
  VerificationContext validateIntegrity(Insertable<TarjaControlData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('actividad_control_id')) {
      context.handle(
          _actividadControlIdMeta,
          actividadControlId.isAcceptableOrUnknown(
              data['actividad_control_id']!, _actividadControlIdMeta));
    } else if (isInserting) {
      context.missing(_actividadControlIdMeta);
    }
    if (data.containsKey('tipo')) {
      context.handle(
          _tipoMeta, tipo.isAcceptableOrUnknown(data['tipo']!, _tipoMeta));
    } else if (isInserting) {
      context.missing(_tipoMeta);
    }
    if (data.containsKey('cantidad')) {
      context.handle(_cantidadMeta,
          cantidad.isAcceptableOrUnknown(data['cantidad']!, _cantidadMeta));
    } else if (isInserting) {
      context.missing(_cantidadMeta);
    }
    if (data.containsKey('creado_en')) {
      context.handle(_creadoEnMeta,
          creadoEn.isAcceptableOrUnknown(data['creado_en']!, _creadoEnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TarjaControlData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TarjaControlData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      actividadControlId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}actividad_control_id'])!,
      tipo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tipo'])!,
      cantidad: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cantidad'])!,
      creadoEn: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}creado_en'])!,
    );
  }

  @override
  $TarjasControlTable createAlias(String alias) {
    return $TarjasControlTable(attachedDatabase, alias);
  }
}

class TarjaControlData extends DataClass
    implements Insertable<TarjaControlData> {
  final int id;
  final int actividadControlId;
  final String tipo;
  final int cantidad;
  final DateTime creadoEn;
  const TarjaControlData(
      {required this.id,
      required this.actividadControlId,
      required this.tipo,
      required this.cantidad,
      required this.creadoEn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['actividad_control_id'] = Variable<int>(actividadControlId);
    map['tipo'] = Variable<String>(tipo);
    map['cantidad'] = Variable<int>(cantidad);
    map['creado_en'] = Variable<DateTime>(creadoEn);
    return map;
  }

  TarjasControlCompanion toCompanion(bool nullToAbsent) {
    return TarjasControlCompanion(
      id: Value(id),
      actividadControlId: Value(actividadControlId),
      tipo: Value(tipo),
      cantidad: Value(cantidad),
      creadoEn: Value(creadoEn),
    );
  }

  factory TarjaControlData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TarjaControlData(
      id: serializer.fromJson<int>(json['id']),
      actividadControlId: serializer.fromJson<int>(json['actividadControlId']),
      tipo: serializer.fromJson<String>(json['tipo']),
      cantidad: serializer.fromJson<int>(json['cantidad']),
      creadoEn: serializer.fromJson<DateTime>(json['creadoEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'actividadControlId': serializer.toJson<int>(actividadControlId),
      'tipo': serializer.toJson<String>(tipo),
      'cantidad': serializer.toJson<int>(cantidad),
      'creadoEn': serializer.toJson<DateTime>(creadoEn),
    };
  }

  TarjaControlData copyWith(
          {int? id,
          int? actividadControlId,
          String? tipo,
          int? cantidad,
          DateTime? creadoEn}) =>
      TarjaControlData(
        id: id ?? this.id,
        actividadControlId: actividadControlId ?? this.actividadControlId,
        tipo: tipo ?? this.tipo,
        cantidad: cantidad ?? this.cantidad,
        creadoEn: creadoEn ?? this.creadoEn,
      );
  TarjaControlData copyWithCompanion(TarjasControlCompanion data) {
    return TarjaControlData(
      id: data.id.present ? data.id.value : this.id,
      actividadControlId: data.actividadControlId.present
          ? data.actividadControlId.value
          : this.actividadControlId,
      tipo: data.tipo.present ? data.tipo.value : this.tipo,
      cantidad: data.cantidad.present ? data.cantidad.value : this.cantidad,
      creadoEn: data.creadoEn.present ? data.creadoEn.value : this.creadoEn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TarjaControlData(')
          ..write('id: $id, ')
          ..write('actividadControlId: $actividadControlId, ')
          ..write('tipo: $tipo, ')
          ..write('cantidad: $cantidad, ')
          ..write('creadoEn: $creadoEn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, actividadControlId, tipo, cantidad, creadoEn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TarjaControlData &&
          other.id == this.id &&
          other.actividadControlId == this.actividadControlId &&
          other.tipo == this.tipo &&
          other.cantidad == this.cantidad &&
          other.creadoEn == this.creadoEn);
}

class TarjasControlCompanion extends UpdateCompanion<TarjaControlData> {
  final Value<int> id;
  final Value<int> actividadControlId;
  final Value<String> tipo;
  final Value<int> cantidad;
  final Value<DateTime> creadoEn;
  const TarjasControlCompanion({
    this.id = const Value.absent(),
    this.actividadControlId = const Value.absent(),
    this.tipo = const Value.absent(),
    this.cantidad = const Value.absent(),
    this.creadoEn = const Value.absent(),
  });
  TarjasControlCompanion.insert({
    this.id = const Value.absent(),
    required int actividadControlId,
    required String tipo,
    required int cantidad,
    this.creadoEn = const Value.absent(),
  })  : actividadControlId = Value(actividadControlId),
        tipo = Value(tipo),
        cantidad = Value(cantidad);
  static Insertable<TarjaControlData> custom({
    Expression<int>? id,
    Expression<int>? actividadControlId,
    Expression<String>? tipo,
    Expression<int>? cantidad,
    Expression<DateTime>? creadoEn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (actividadControlId != null)
        'actividad_control_id': actividadControlId,
      if (tipo != null) 'tipo': tipo,
      if (cantidad != null) 'cantidad': cantidad,
      if (creadoEn != null) 'creado_en': creadoEn,
    });
  }

  TarjasControlCompanion copyWith(
      {Value<int>? id,
      Value<int>? actividadControlId,
      Value<String>? tipo,
      Value<int>? cantidad,
      Value<DateTime>? creadoEn}) {
    return TarjasControlCompanion(
      id: id ?? this.id,
      actividadControlId: actividadControlId ?? this.actividadControlId,
      tipo: tipo ?? this.tipo,
      cantidad: cantidad ?? this.cantidad,
      creadoEn: creadoEn ?? this.creadoEn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (actividadControlId.present) {
      map['actividad_control_id'] = Variable<int>(actividadControlId.value);
    }
    if (tipo.present) {
      map['tipo'] = Variable<String>(tipo.value);
    }
    if (cantidad.present) {
      map['cantidad'] = Variable<int>(cantidad.value);
    }
    if (creadoEn.present) {
      map['creado_en'] = Variable<DateTime>(creadoEn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TarjasControlCompanion(')
          ..write('id: $id, ')
          ..write('actividadControlId: $actividadControlId, ')
          ..write('tipo: $tipo, ')
          ..write('cantidad: $cantidad, ')
          ..write('creadoEn: $creadoEn')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ControlesPesajeTable controlesPesaje =
      $ControlesPesajeTable(this);
  late final $CategoriasPesajeTable categoriasPesaje =
      $CategoriasPesajeTable(this);
  late final $AnimalesPesajeTable animalesPesaje = $AnimalesPesajeTable(this);
  late final $StockAnimalesTable stockAnimales = $StockAnimalesTable(this);
  late final $CarpetasControlTable carpetasControl =
      $CarpetasControlTable(this);
  late final $ActividadesControlTable actividadesControl =
      $ActividadesControlTable(this);
  late final $TarjasControlTable tarjasControl = $TarjasControlTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        controlesPesaje,
        categoriasPesaje,
        animalesPesaje,
        stockAnimales,
        carpetasControl,
        actividadesControl,
        tarjasControl
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('controles_pesaje',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('categorias_pesaje', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('categorias_pesaje',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('animales_pesaje', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('carpetas_control',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('actividades_control', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('actividades_control',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('tarjas_control', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$ControlesPesajeTableCreateCompanionBuilder = ControlesPesajeCompanion
    Function({
  Value<int> id,
  required String titulo,
  required DateTime fecha,
  Value<DateTime> creadoEn,
});
typedef $$ControlesPesajeTableUpdateCompanionBuilder = ControlesPesajeCompanion
    Function({
  Value<int> id,
  Value<String> titulo,
  Value<DateTime> fecha,
  Value<DateTime> creadoEn,
});

final class $$ControlesPesajeTableReferences extends BaseReferences<
    _$AppDatabase, $ControlesPesajeTable, ControlesPesajeData> {
  $$ControlesPesajeTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CategoriasPesajeTable, List<CategoriasPesajeData>>
      _categoriasPesajeRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.categoriasPesaje,
              aliasName: $_aliasNameGenerator(
                  db.controlesPesaje.id, db.categoriasPesaje.controlPesajeId));

  $$CategoriasPesajeTableProcessedTableManager get categoriasPesajeRefs {
    final manager =
        $$CategoriasPesajeTableTableManager($_db, $_db.categoriasPesaje).filter(
            (f) => f.controlPesajeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_categoriasPesajeRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ControlesPesajeTableFilterComposer
    extends Composer<_$AppDatabase, $ControlesPesajeTable> {
  $$ControlesPesajeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get titulo => $composableBuilder(
      column: $table.titulo, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get fecha => $composableBuilder(
      column: $table.fecha, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get creadoEn => $composableBuilder(
      column: $table.creadoEn, builder: (column) => ColumnFilters(column));

  Expression<bool> categoriasPesajeRefs(
      Expression<bool> Function($$CategoriasPesajeTableFilterComposer f) f) {
    final $$CategoriasPesajeTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.categoriasPesaje,
        getReferencedColumn: (t) => t.controlPesajeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriasPesajeTableFilterComposer(
              $db: $db,
              $table: $db.categoriasPesaje,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ControlesPesajeTableOrderingComposer
    extends Composer<_$AppDatabase, $ControlesPesajeTable> {
  $$ControlesPesajeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get titulo => $composableBuilder(
      column: $table.titulo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get fecha => $composableBuilder(
      column: $table.fecha, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get creadoEn => $composableBuilder(
      column: $table.creadoEn, builder: (column) => ColumnOrderings(column));
}

class $$ControlesPesajeTableAnnotationComposer
    extends Composer<_$AppDatabase, $ControlesPesajeTable> {
  $$ControlesPesajeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get titulo =>
      $composableBuilder(column: $table.titulo, builder: (column) => column);

  GeneratedColumn<DateTime> get fecha =>
      $composableBuilder(column: $table.fecha, builder: (column) => column);

  GeneratedColumn<DateTime> get creadoEn =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);

  Expression<T> categoriasPesajeRefs<T extends Object>(
      Expression<T> Function($$CategoriasPesajeTableAnnotationComposer a) f) {
    final $$CategoriasPesajeTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.categoriasPesaje,
        getReferencedColumn: (t) => t.controlPesajeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriasPesajeTableAnnotationComposer(
              $db: $db,
              $table: $db.categoriasPesaje,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ControlesPesajeTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ControlesPesajeTable,
    ControlesPesajeData,
    $$ControlesPesajeTableFilterComposer,
    $$ControlesPesajeTableOrderingComposer,
    $$ControlesPesajeTableAnnotationComposer,
    $$ControlesPesajeTableCreateCompanionBuilder,
    $$ControlesPesajeTableUpdateCompanionBuilder,
    (ControlesPesajeData, $$ControlesPesajeTableReferences),
    ControlesPesajeData,
    PrefetchHooks Function({bool categoriasPesajeRefs})> {
  $$ControlesPesajeTableTableManager(
      _$AppDatabase db, $ControlesPesajeTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ControlesPesajeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ControlesPesajeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ControlesPesajeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> titulo = const Value.absent(),
            Value<DateTime> fecha = const Value.absent(),
            Value<DateTime> creadoEn = const Value.absent(),
          }) =>
              ControlesPesajeCompanion(
            id: id,
            titulo: titulo,
            fecha: fecha,
            creadoEn: creadoEn,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String titulo,
            required DateTime fecha,
            Value<DateTime> creadoEn = const Value.absent(),
          }) =>
              ControlesPesajeCompanion.insert(
            id: id,
            titulo: titulo,
            fecha: fecha,
            creadoEn: creadoEn,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ControlesPesajeTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({categoriasPesajeRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (categoriasPesajeRefs) db.categoriasPesaje
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (categoriasPesajeRefs)
                    await $_getPrefetchedData<ControlesPesajeData,
                            $ControlesPesajeTable, CategoriasPesajeData>(
                        currentTable: table,
                        referencedTable: $$ControlesPesajeTableReferences
                            ._categoriasPesajeRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ControlesPesajeTableReferences(db, table, p0)
                                .categoriasPesajeRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.controlPesajeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ControlesPesajeTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ControlesPesajeTable,
    ControlesPesajeData,
    $$ControlesPesajeTableFilterComposer,
    $$ControlesPesajeTableOrderingComposer,
    $$ControlesPesajeTableAnnotationComposer,
    $$ControlesPesajeTableCreateCompanionBuilder,
    $$ControlesPesajeTableUpdateCompanionBuilder,
    (ControlesPesajeData, $$ControlesPesajeTableReferences),
    ControlesPesajeData,
    PrefetchHooks Function({bool categoriasPesajeRefs})>;
typedef $$CategoriasPesajeTableCreateCompanionBuilder
    = CategoriasPesajeCompanion Function({
  Value<int> id,
  required int controlPesajeId,
  required String nombre,
  Value<double> porcentajeDestare,
  Value<DateTime> creadoEn,
});
typedef $$CategoriasPesajeTableUpdateCompanionBuilder
    = CategoriasPesajeCompanion Function({
  Value<int> id,
  Value<int> controlPesajeId,
  Value<String> nombre,
  Value<double> porcentajeDestare,
  Value<DateTime> creadoEn,
});

final class $$CategoriasPesajeTableReferences extends BaseReferences<
    _$AppDatabase, $CategoriasPesajeTable, CategoriasPesajeData> {
  $$CategoriasPesajeTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ControlesPesajeTable _controlPesajeIdTable(_$AppDatabase db) =>
      db.controlesPesaje.createAlias($_aliasNameGenerator(
          db.categoriasPesaje.controlPesajeId, db.controlesPesaje.id));

  $$ControlesPesajeTableProcessedTableManager get controlPesajeId {
    final $_column = $_itemColumn<int>('control_pesaje_id')!;

    final manager =
        $$ControlesPesajeTableTableManager($_db, $_db.controlesPesaje)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_controlPesajeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$AnimalesPesajeTable, List<AnimalesPesajeData>>
      _animalesPesajeRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.animalesPesaje,
              aliasName: $_aliasNameGenerator(
                  db.categoriasPesaje.id, db.animalesPesaje.categoriaPesajeId));

  $$AnimalesPesajeTableProcessedTableManager get animalesPesajeRefs {
    final manager = $$AnimalesPesajeTableTableManager($_db, $_db.animalesPesaje)
        .filter(
            (f) => f.categoriaPesajeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_animalesPesajeRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CategoriasPesajeTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriasPesajeTable> {
  $$CategoriasPesajeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nombre => $composableBuilder(
      column: $table.nombre, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get porcentajeDestare => $composableBuilder(
      column: $table.porcentajeDestare,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get creadoEn => $composableBuilder(
      column: $table.creadoEn, builder: (column) => ColumnFilters(column));

  $$ControlesPesajeTableFilterComposer get controlPesajeId {
    final $$ControlesPesajeTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.controlPesajeId,
        referencedTable: $db.controlesPesaje,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ControlesPesajeTableFilterComposer(
              $db: $db,
              $table: $db.controlesPesaje,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> animalesPesajeRefs(
      Expression<bool> Function($$AnimalesPesajeTableFilterComposer f) f) {
    final $$AnimalesPesajeTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.animalesPesaje,
        getReferencedColumn: (t) => t.categoriaPesajeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AnimalesPesajeTableFilterComposer(
              $db: $db,
              $table: $db.animalesPesaje,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoriasPesajeTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriasPesajeTable> {
  $$CategoriasPesajeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nombre => $composableBuilder(
      column: $table.nombre, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get porcentajeDestare => $composableBuilder(
      column: $table.porcentajeDestare,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get creadoEn => $composableBuilder(
      column: $table.creadoEn, builder: (column) => ColumnOrderings(column));

  $$ControlesPesajeTableOrderingComposer get controlPesajeId {
    final $$ControlesPesajeTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.controlPesajeId,
        referencedTable: $db.controlesPesaje,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ControlesPesajeTableOrderingComposer(
              $db: $db,
              $table: $db.controlesPesaje,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CategoriasPesajeTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriasPesajeTable> {
  $$CategoriasPesajeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<double> get porcentajeDestare => $composableBuilder(
      column: $table.porcentajeDestare, builder: (column) => column);

  GeneratedColumn<DateTime> get creadoEn =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);

  $$ControlesPesajeTableAnnotationComposer get controlPesajeId {
    final $$ControlesPesajeTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.controlPesajeId,
        referencedTable: $db.controlesPesaje,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ControlesPesajeTableAnnotationComposer(
              $db: $db,
              $table: $db.controlesPesaje,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> animalesPesajeRefs<T extends Object>(
      Expression<T> Function($$AnimalesPesajeTableAnnotationComposer a) f) {
    final $$AnimalesPesajeTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.animalesPesaje,
        getReferencedColumn: (t) => t.categoriaPesajeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AnimalesPesajeTableAnnotationComposer(
              $db: $db,
              $table: $db.animalesPesaje,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoriasPesajeTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoriasPesajeTable,
    CategoriasPesajeData,
    $$CategoriasPesajeTableFilterComposer,
    $$CategoriasPesajeTableOrderingComposer,
    $$CategoriasPesajeTableAnnotationComposer,
    $$CategoriasPesajeTableCreateCompanionBuilder,
    $$CategoriasPesajeTableUpdateCompanionBuilder,
    (CategoriasPesajeData, $$CategoriasPesajeTableReferences),
    CategoriasPesajeData,
    PrefetchHooks Function({bool controlPesajeId, bool animalesPesajeRefs})> {
  $$CategoriasPesajeTableTableManager(
      _$AppDatabase db, $CategoriasPesajeTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriasPesajeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriasPesajeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriasPesajeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> controlPesajeId = const Value.absent(),
            Value<String> nombre = const Value.absent(),
            Value<double> porcentajeDestare = const Value.absent(),
            Value<DateTime> creadoEn = const Value.absent(),
          }) =>
              CategoriasPesajeCompanion(
            id: id,
            controlPesajeId: controlPesajeId,
            nombre: nombre,
            porcentajeDestare: porcentajeDestare,
            creadoEn: creadoEn,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int controlPesajeId,
            required String nombre,
            Value<double> porcentajeDestare = const Value.absent(),
            Value<DateTime> creadoEn = const Value.absent(),
          }) =>
              CategoriasPesajeCompanion.insert(
            id: id,
            controlPesajeId: controlPesajeId,
            nombre: nombre,
            porcentajeDestare: porcentajeDestare,
            creadoEn: creadoEn,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CategoriasPesajeTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {controlPesajeId = false, animalesPesajeRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (animalesPesajeRefs) db.animalesPesaje
              ],
              addJoins: <
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
                      dynamic>>(state) {
                if (controlPesajeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.controlPesajeId,
                    referencedTable: $$CategoriasPesajeTableReferences
                        ._controlPesajeIdTable(db),
                    referencedColumn: $$CategoriasPesajeTableReferences
                        ._controlPesajeIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (animalesPesajeRefs)
                    await $_getPrefetchedData<CategoriasPesajeData,
                            $CategoriasPesajeTable, AnimalesPesajeData>(
                        currentTable: table,
                        referencedTable: $$CategoriasPesajeTableReferences
                            ._animalesPesajeRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoriasPesajeTableReferences(db, table, p0)
                                .animalesPesajeRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoriaPesajeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CategoriasPesajeTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoriasPesajeTable,
    CategoriasPesajeData,
    $$CategoriasPesajeTableFilterComposer,
    $$CategoriasPesajeTableOrderingComposer,
    $$CategoriasPesajeTableAnnotationComposer,
    $$CategoriasPesajeTableCreateCompanionBuilder,
    $$CategoriasPesajeTableUpdateCompanionBuilder,
    (CategoriasPesajeData, $$CategoriasPesajeTableReferences),
    CategoriasPesajeData,
    PrefetchHooks Function({bool controlPesajeId, bool animalesPesajeRefs})>;
typedef $$AnimalesPesajeTableCreateCompanionBuilder = AnimalesPesajeCompanion
    Function({
  Value<int> id,
  required int categoriaPesajeId,
  required String identificativo,
  required double peso,
  Value<DateTime> creadoEn,
});
typedef $$AnimalesPesajeTableUpdateCompanionBuilder = AnimalesPesajeCompanion
    Function({
  Value<int> id,
  Value<int> categoriaPesajeId,
  Value<String> identificativo,
  Value<double> peso,
  Value<DateTime> creadoEn,
});

final class $$AnimalesPesajeTableReferences extends BaseReferences<
    _$AppDatabase, $AnimalesPesajeTable, AnimalesPesajeData> {
  $$AnimalesPesajeTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CategoriasPesajeTable _categoriaPesajeIdTable(_$AppDatabase db) =>
      db.categoriasPesaje.createAlias($_aliasNameGenerator(
          db.animalesPesaje.categoriaPesajeId, db.categoriasPesaje.id));

  $$CategoriasPesajeTableProcessedTableManager get categoriaPesajeId {
    final $_column = $_itemColumn<int>('categoria_pesaje_id')!;

    final manager =
        $$CategoriasPesajeTableTableManager($_db, $_db.categoriasPesaje)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoriaPesajeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$AnimalesPesajeTableFilterComposer
    extends Composer<_$AppDatabase, $AnimalesPesajeTable> {
  $$AnimalesPesajeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get identificativo => $composableBuilder(
      column: $table.identificativo,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get peso => $composableBuilder(
      column: $table.peso, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get creadoEn => $composableBuilder(
      column: $table.creadoEn, builder: (column) => ColumnFilters(column));

  $$CategoriasPesajeTableFilterComposer get categoriaPesajeId {
    final $$CategoriasPesajeTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoriaPesajeId,
        referencedTable: $db.categoriasPesaje,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriasPesajeTableFilterComposer(
              $db: $db,
              $table: $db.categoriasPesaje,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AnimalesPesajeTableOrderingComposer
    extends Composer<_$AppDatabase, $AnimalesPesajeTable> {
  $$AnimalesPesajeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get identificativo => $composableBuilder(
      column: $table.identificativo,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get peso => $composableBuilder(
      column: $table.peso, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get creadoEn => $composableBuilder(
      column: $table.creadoEn, builder: (column) => ColumnOrderings(column));

  $$CategoriasPesajeTableOrderingComposer get categoriaPesajeId {
    final $$CategoriasPesajeTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoriaPesajeId,
        referencedTable: $db.categoriasPesaje,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriasPesajeTableOrderingComposer(
              $db: $db,
              $table: $db.categoriasPesaje,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AnimalesPesajeTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnimalesPesajeTable> {
  $$AnimalesPesajeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get identificativo => $composableBuilder(
      column: $table.identificativo, builder: (column) => column);

  GeneratedColumn<double> get peso =>
      $composableBuilder(column: $table.peso, builder: (column) => column);

  GeneratedColumn<DateTime> get creadoEn =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);

  $$CategoriasPesajeTableAnnotationComposer get categoriaPesajeId {
    final $$CategoriasPesajeTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoriaPesajeId,
        referencedTable: $db.categoriasPesaje,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriasPesajeTableAnnotationComposer(
              $db: $db,
              $table: $db.categoriasPesaje,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AnimalesPesajeTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AnimalesPesajeTable,
    AnimalesPesajeData,
    $$AnimalesPesajeTableFilterComposer,
    $$AnimalesPesajeTableOrderingComposer,
    $$AnimalesPesajeTableAnnotationComposer,
    $$AnimalesPesajeTableCreateCompanionBuilder,
    $$AnimalesPesajeTableUpdateCompanionBuilder,
    (AnimalesPesajeData, $$AnimalesPesajeTableReferences),
    AnimalesPesajeData,
    PrefetchHooks Function({bool categoriaPesajeId})> {
  $$AnimalesPesajeTableTableManager(
      _$AppDatabase db, $AnimalesPesajeTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnimalesPesajeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AnimalesPesajeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AnimalesPesajeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> categoriaPesajeId = const Value.absent(),
            Value<String> identificativo = const Value.absent(),
            Value<double> peso = const Value.absent(),
            Value<DateTime> creadoEn = const Value.absent(),
          }) =>
              AnimalesPesajeCompanion(
            id: id,
            categoriaPesajeId: categoriaPesajeId,
            identificativo: identificativo,
            peso: peso,
            creadoEn: creadoEn,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int categoriaPesajeId,
            required String identificativo,
            required double peso,
            Value<DateTime> creadoEn = const Value.absent(),
          }) =>
              AnimalesPesajeCompanion.insert(
            id: id,
            categoriaPesajeId: categoriaPesajeId,
            identificativo: identificativo,
            peso: peso,
            creadoEn: creadoEn,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AnimalesPesajeTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({categoriaPesajeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                      dynamic>>(state) {
                if (categoriaPesajeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoriaPesajeId,
                    referencedTable: $$AnimalesPesajeTableReferences
                        ._categoriaPesajeIdTable(db),
                    referencedColumn: $$AnimalesPesajeTableReferences
                        ._categoriaPesajeIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$AnimalesPesajeTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AnimalesPesajeTable,
    AnimalesPesajeData,
    $$AnimalesPesajeTableFilterComposer,
    $$AnimalesPesajeTableOrderingComposer,
    $$AnimalesPesajeTableAnnotationComposer,
    $$AnimalesPesajeTableCreateCompanionBuilder,
    $$AnimalesPesajeTableUpdateCompanionBuilder,
    (AnimalesPesajeData, $$AnimalesPesajeTableReferences),
    AnimalesPesajeData,
    PrefetchHooks Function({bool categoriaPesajeId})>;
typedef $$StockAnimalesTableCreateCompanionBuilder = StockAnimalesCompanion
    Function({
  Value<int> id,
  required String tipo,
  required int cantidad,
  Value<DateTime> creadoEn,
});
typedef $$StockAnimalesTableUpdateCompanionBuilder = StockAnimalesCompanion
    Function({
  Value<int> id,
  Value<String> tipo,
  Value<int> cantidad,
  Value<DateTime> creadoEn,
});

class $$StockAnimalesTableFilterComposer
    extends Composer<_$AppDatabase, $StockAnimalesTable> {
  $$StockAnimalesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tipo => $composableBuilder(
      column: $table.tipo, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get cantidad => $composableBuilder(
      column: $table.cantidad, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get creadoEn => $composableBuilder(
      column: $table.creadoEn, builder: (column) => ColumnFilters(column));
}

class $$StockAnimalesTableOrderingComposer
    extends Composer<_$AppDatabase, $StockAnimalesTable> {
  $$StockAnimalesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tipo => $composableBuilder(
      column: $table.tipo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get cantidad => $composableBuilder(
      column: $table.cantidad, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get creadoEn => $composableBuilder(
      column: $table.creadoEn, builder: (column) => ColumnOrderings(column));
}

class $$StockAnimalesTableAnnotationComposer
    extends Composer<_$AppDatabase, $StockAnimalesTable> {
  $$StockAnimalesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tipo =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  GeneratedColumn<int> get cantidad =>
      $composableBuilder(column: $table.cantidad, builder: (column) => column);

  GeneratedColumn<DateTime> get creadoEn =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);
}

class $$StockAnimalesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StockAnimalesTable,
    StockAnimalData,
    $$StockAnimalesTableFilterComposer,
    $$StockAnimalesTableOrderingComposer,
    $$StockAnimalesTableAnnotationComposer,
    $$StockAnimalesTableCreateCompanionBuilder,
    $$StockAnimalesTableUpdateCompanionBuilder,
    (
      StockAnimalData,
      BaseReferences<_$AppDatabase, $StockAnimalesTable, StockAnimalData>
    ),
    StockAnimalData,
    PrefetchHooks Function()> {
  $$StockAnimalesTableTableManager(_$AppDatabase db, $StockAnimalesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StockAnimalesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StockAnimalesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StockAnimalesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> tipo = const Value.absent(),
            Value<int> cantidad = const Value.absent(),
            Value<DateTime> creadoEn = const Value.absent(),
          }) =>
              StockAnimalesCompanion(
            id: id,
            tipo: tipo,
            cantidad: cantidad,
            creadoEn: creadoEn,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String tipo,
            required int cantidad,
            Value<DateTime> creadoEn = const Value.absent(),
          }) =>
              StockAnimalesCompanion.insert(
            id: id,
            tipo: tipo,
            cantidad: cantidad,
            creadoEn: creadoEn,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$StockAnimalesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StockAnimalesTable,
    StockAnimalData,
    $$StockAnimalesTableFilterComposer,
    $$StockAnimalesTableOrderingComposer,
    $$StockAnimalesTableAnnotationComposer,
    $$StockAnimalesTableCreateCompanionBuilder,
    $$StockAnimalesTableUpdateCompanionBuilder,
    (
      StockAnimalData,
      BaseReferences<_$AppDatabase, $StockAnimalesTable, StockAnimalData>
    ),
    StockAnimalData,
    PrefetchHooks Function()>;
typedef $$CarpetasControlTableCreateCompanionBuilder = CarpetasControlCompanion
    Function({
  Value<int> id,
  required String titulo,
  Value<DateTime> creadoEn,
});
typedef $$CarpetasControlTableUpdateCompanionBuilder = CarpetasControlCompanion
    Function({
  Value<int> id,
  Value<String> titulo,
  Value<DateTime> creadoEn,
});

final class $$CarpetasControlTableReferences extends BaseReferences<
    _$AppDatabase, $CarpetasControlTable, CarpetaControlData> {
  $$CarpetasControlTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ActividadesControlTable,
      List<ActividadControlData>> _actividadesControlRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.actividadesControl,
          aliasName: $_aliasNameGenerator(
              db.carpetasControl.id, db.actividadesControl.carpetaControlId));

  $$ActividadesControlTableProcessedTableManager get actividadesControlRefs {
    final manager = $$ActividadesControlTableTableManager(
            $_db, $_db.actividadesControl)
        .filter(
            (f) => f.carpetaControlId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_actividadesControlRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CarpetasControlTableFilterComposer
    extends Composer<_$AppDatabase, $CarpetasControlTable> {
  $$CarpetasControlTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get titulo => $composableBuilder(
      column: $table.titulo, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get creadoEn => $composableBuilder(
      column: $table.creadoEn, builder: (column) => ColumnFilters(column));

  Expression<bool> actividadesControlRefs(
      Expression<bool> Function($$ActividadesControlTableFilterComposer f) f) {
    final $$ActividadesControlTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.actividadesControl,
        getReferencedColumn: (t) => t.carpetaControlId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ActividadesControlTableFilterComposer(
              $db: $db,
              $table: $db.actividadesControl,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CarpetasControlTableOrderingComposer
    extends Composer<_$AppDatabase, $CarpetasControlTable> {
  $$CarpetasControlTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get titulo => $composableBuilder(
      column: $table.titulo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get creadoEn => $composableBuilder(
      column: $table.creadoEn, builder: (column) => ColumnOrderings(column));
}

class $$CarpetasControlTableAnnotationComposer
    extends Composer<_$AppDatabase, $CarpetasControlTable> {
  $$CarpetasControlTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get titulo =>
      $composableBuilder(column: $table.titulo, builder: (column) => column);

  GeneratedColumn<DateTime> get creadoEn =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);

  Expression<T> actividadesControlRefs<T extends Object>(
      Expression<T> Function($$ActividadesControlTableAnnotationComposer a) f) {
    final $$ActividadesControlTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.actividadesControl,
            getReferencedColumn: (t) => t.carpetaControlId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ActividadesControlTableAnnotationComposer(
                  $db: $db,
                  $table: $db.actividadesControl,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$CarpetasControlTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CarpetasControlTable,
    CarpetaControlData,
    $$CarpetasControlTableFilterComposer,
    $$CarpetasControlTableOrderingComposer,
    $$CarpetasControlTableAnnotationComposer,
    $$CarpetasControlTableCreateCompanionBuilder,
    $$CarpetasControlTableUpdateCompanionBuilder,
    (CarpetaControlData, $$CarpetasControlTableReferences),
    CarpetaControlData,
    PrefetchHooks Function({bool actividadesControlRefs})> {
  $$CarpetasControlTableTableManager(
      _$AppDatabase db, $CarpetasControlTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CarpetasControlTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CarpetasControlTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CarpetasControlTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> titulo = const Value.absent(),
            Value<DateTime> creadoEn = const Value.absent(),
          }) =>
              CarpetasControlCompanion(
            id: id,
            titulo: titulo,
            creadoEn: creadoEn,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String titulo,
            Value<DateTime> creadoEn = const Value.absent(),
          }) =>
              CarpetasControlCompanion.insert(
            id: id,
            titulo: titulo,
            creadoEn: creadoEn,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CarpetasControlTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({actividadesControlRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (actividadesControlRefs) db.actividadesControl
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (actividadesControlRefs)
                    await $_getPrefetchedData<CarpetaControlData,
                            $CarpetasControlTable, ActividadControlData>(
                        currentTable: table,
                        referencedTable: $$CarpetasControlTableReferences
                            ._actividadesControlRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CarpetasControlTableReferences(db, table, p0)
                                .actividadesControlRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.carpetaControlId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CarpetasControlTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CarpetasControlTable,
    CarpetaControlData,
    $$CarpetasControlTableFilterComposer,
    $$CarpetasControlTableOrderingComposer,
    $$CarpetasControlTableAnnotationComposer,
    $$CarpetasControlTableCreateCompanionBuilder,
    $$CarpetasControlTableUpdateCompanionBuilder,
    (CarpetaControlData, $$CarpetasControlTableReferences),
    CarpetaControlData,
    PrefetchHooks Function({bool actividadesControlRefs})>;
typedef $$ActividadesControlTableCreateCompanionBuilder
    = ActividadesControlCompanion Function({
  Value<int> id,
  required int carpetaControlId,
  required String titulo,
  required DateTime fecha,
  Value<DateTime> creadoEn,
});
typedef $$ActividadesControlTableUpdateCompanionBuilder
    = ActividadesControlCompanion Function({
  Value<int> id,
  Value<int> carpetaControlId,
  Value<String> titulo,
  Value<DateTime> fecha,
  Value<DateTime> creadoEn,
});

final class $$ActividadesControlTableReferences extends BaseReferences<
    _$AppDatabase, $ActividadesControlTable, ActividadControlData> {
  $$ActividadesControlTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CarpetasControlTable _carpetaControlIdTable(_$AppDatabase db) =>
      db.carpetasControl.createAlias($_aliasNameGenerator(
          db.actividadesControl.carpetaControlId, db.carpetasControl.id));

  $$CarpetasControlTableProcessedTableManager get carpetaControlId {
    final $_column = $_itemColumn<int>('carpeta_control_id')!;

    final manager =
        $$CarpetasControlTableTableManager($_db, $_db.carpetasControl)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_carpetaControlIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TarjasControlTable, List<TarjaControlData>>
      _tarjasControlRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.tarjasControl,
              aliasName: $_aliasNameGenerator(db.actividadesControl.id,
                  db.tarjasControl.actividadControlId));

  $$TarjasControlTableProcessedTableManager get tarjasControlRefs {
    final manager = $$TarjasControlTableTableManager($_db, $_db.tarjasControl)
        .filter(
            (f) => f.actividadControlId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_tarjasControlRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ActividadesControlTableFilterComposer
    extends Composer<_$AppDatabase, $ActividadesControlTable> {
  $$ActividadesControlTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get titulo => $composableBuilder(
      column: $table.titulo, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get fecha => $composableBuilder(
      column: $table.fecha, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get creadoEn => $composableBuilder(
      column: $table.creadoEn, builder: (column) => ColumnFilters(column));

  $$CarpetasControlTableFilterComposer get carpetaControlId {
    final $$CarpetasControlTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.carpetaControlId,
        referencedTable: $db.carpetasControl,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CarpetasControlTableFilterComposer(
              $db: $db,
              $table: $db.carpetasControl,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> tarjasControlRefs(
      Expression<bool> Function($$TarjasControlTableFilterComposer f) f) {
    final $$TarjasControlTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tarjasControl,
        getReferencedColumn: (t) => t.actividadControlId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TarjasControlTableFilterComposer(
              $db: $db,
              $table: $db.tarjasControl,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ActividadesControlTableOrderingComposer
    extends Composer<_$AppDatabase, $ActividadesControlTable> {
  $$ActividadesControlTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get titulo => $composableBuilder(
      column: $table.titulo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get fecha => $composableBuilder(
      column: $table.fecha, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get creadoEn => $composableBuilder(
      column: $table.creadoEn, builder: (column) => ColumnOrderings(column));

  $$CarpetasControlTableOrderingComposer get carpetaControlId {
    final $$CarpetasControlTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.carpetaControlId,
        referencedTable: $db.carpetasControl,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CarpetasControlTableOrderingComposer(
              $db: $db,
              $table: $db.carpetasControl,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ActividadesControlTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActividadesControlTable> {
  $$ActividadesControlTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get titulo =>
      $composableBuilder(column: $table.titulo, builder: (column) => column);

  GeneratedColumn<DateTime> get fecha =>
      $composableBuilder(column: $table.fecha, builder: (column) => column);

  GeneratedColumn<DateTime> get creadoEn =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);

  $$CarpetasControlTableAnnotationComposer get carpetaControlId {
    final $$CarpetasControlTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.carpetaControlId,
        referencedTable: $db.carpetasControl,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CarpetasControlTableAnnotationComposer(
              $db: $db,
              $table: $db.carpetasControl,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> tarjasControlRefs<T extends Object>(
      Expression<T> Function($$TarjasControlTableAnnotationComposer a) f) {
    final $$TarjasControlTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tarjasControl,
        getReferencedColumn: (t) => t.actividadControlId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TarjasControlTableAnnotationComposer(
              $db: $db,
              $table: $db.tarjasControl,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ActividadesControlTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ActividadesControlTable,
    ActividadControlData,
    $$ActividadesControlTableFilterComposer,
    $$ActividadesControlTableOrderingComposer,
    $$ActividadesControlTableAnnotationComposer,
    $$ActividadesControlTableCreateCompanionBuilder,
    $$ActividadesControlTableUpdateCompanionBuilder,
    (ActividadControlData, $$ActividadesControlTableReferences),
    ActividadControlData,
    PrefetchHooks Function({bool carpetaControlId, bool tarjasControlRefs})> {
  $$ActividadesControlTableTableManager(
      _$AppDatabase db, $ActividadesControlTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActividadesControlTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActividadesControlTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActividadesControlTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> carpetaControlId = const Value.absent(),
            Value<String> titulo = const Value.absent(),
            Value<DateTime> fecha = const Value.absent(),
            Value<DateTime> creadoEn = const Value.absent(),
          }) =>
              ActividadesControlCompanion(
            id: id,
            carpetaControlId: carpetaControlId,
            titulo: titulo,
            fecha: fecha,
            creadoEn: creadoEn,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int carpetaControlId,
            required String titulo,
            required DateTime fecha,
            Value<DateTime> creadoEn = const Value.absent(),
          }) =>
              ActividadesControlCompanion.insert(
            id: id,
            carpetaControlId: carpetaControlId,
            titulo: titulo,
            fecha: fecha,
            creadoEn: creadoEn,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ActividadesControlTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {carpetaControlId = false, tarjasControlRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (tarjasControlRefs) db.tarjasControl
              ],
              addJoins: <
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
                      dynamic>>(state) {
                if (carpetaControlId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.carpetaControlId,
                    referencedTable: $$ActividadesControlTableReferences
                        ._carpetaControlIdTable(db),
                    referencedColumn: $$ActividadesControlTableReferences
                        ._carpetaControlIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tarjasControlRefs)
                    await $_getPrefetchedData<ActividadControlData,
                            $ActividadesControlTable, TarjaControlData>(
                        currentTable: table,
                        referencedTable: $$ActividadesControlTableReferences
                            ._tarjasControlRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ActividadesControlTableReferences(db, table, p0)
                                .tarjasControlRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.actividadControlId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ActividadesControlTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ActividadesControlTable,
    ActividadControlData,
    $$ActividadesControlTableFilterComposer,
    $$ActividadesControlTableOrderingComposer,
    $$ActividadesControlTableAnnotationComposer,
    $$ActividadesControlTableCreateCompanionBuilder,
    $$ActividadesControlTableUpdateCompanionBuilder,
    (ActividadControlData, $$ActividadesControlTableReferences),
    ActividadControlData,
    PrefetchHooks Function({bool carpetaControlId, bool tarjasControlRefs})>;
typedef $$TarjasControlTableCreateCompanionBuilder = TarjasControlCompanion
    Function({
  Value<int> id,
  required int actividadControlId,
  required String tipo,
  required int cantidad,
  Value<DateTime> creadoEn,
});
typedef $$TarjasControlTableUpdateCompanionBuilder = TarjasControlCompanion
    Function({
  Value<int> id,
  Value<int> actividadControlId,
  Value<String> tipo,
  Value<int> cantidad,
  Value<DateTime> creadoEn,
});

final class $$TarjasControlTableReferences extends BaseReferences<_$AppDatabase,
    $TarjasControlTable, TarjaControlData> {
  $$TarjasControlTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ActividadesControlTable _actividadControlIdTable(_$AppDatabase db) =>
      db.actividadesControl.createAlias($_aliasNameGenerator(
          db.tarjasControl.actividadControlId, db.actividadesControl.id));

  $$ActividadesControlTableProcessedTableManager get actividadControlId {
    final $_column = $_itemColumn<int>('actividad_control_id')!;

    final manager =
        $$ActividadesControlTableTableManager($_db, $_db.actividadesControl)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_actividadControlIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TarjasControlTableFilterComposer
    extends Composer<_$AppDatabase, $TarjasControlTable> {
  $$TarjasControlTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tipo => $composableBuilder(
      column: $table.tipo, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get cantidad => $composableBuilder(
      column: $table.cantidad, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get creadoEn => $composableBuilder(
      column: $table.creadoEn, builder: (column) => ColumnFilters(column));

  $$ActividadesControlTableFilterComposer get actividadControlId {
    final $$ActividadesControlTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.actividadControlId,
        referencedTable: $db.actividadesControl,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ActividadesControlTableFilterComposer(
              $db: $db,
              $table: $db.actividadesControl,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TarjasControlTableOrderingComposer
    extends Composer<_$AppDatabase, $TarjasControlTable> {
  $$TarjasControlTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tipo => $composableBuilder(
      column: $table.tipo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get cantidad => $composableBuilder(
      column: $table.cantidad, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get creadoEn => $composableBuilder(
      column: $table.creadoEn, builder: (column) => ColumnOrderings(column));

  $$ActividadesControlTableOrderingComposer get actividadControlId {
    final $$ActividadesControlTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.actividadControlId,
        referencedTable: $db.actividadesControl,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ActividadesControlTableOrderingComposer(
              $db: $db,
              $table: $db.actividadesControl,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TarjasControlTableAnnotationComposer
    extends Composer<_$AppDatabase, $TarjasControlTable> {
  $$TarjasControlTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tipo =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  GeneratedColumn<int> get cantidad =>
      $composableBuilder(column: $table.cantidad, builder: (column) => column);

  GeneratedColumn<DateTime> get creadoEn =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);

  $$ActividadesControlTableAnnotationComposer get actividadControlId {
    final $$ActividadesControlTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.actividadControlId,
            referencedTable: $db.actividadesControl,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ActividadesControlTableAnnotationComposer(
                  $db: $db,
                  $table: $db.actividadesControl,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$TarjasControlTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TarjasControlTable,
    TarjaControlData,
    $$TarjasControlTableFilterComposer,
    $$TarjasControlTableOrderingComposer,
    $$TarjasControlTableAnnotationComposer,
    $$TarjasControlTableCreateCompanionBuilder,
    $$TarjasControlTableUpdateCompanionBuilder,
    (TarjaControlData, $$TarjasControlTableReferences),
    TarjaControlData,
    PrefetchHooks Function({bool actividadControlId})> {
  $$TarjasControlTableTableManager(_$AppDatabase db, $TarjasControlTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TarjasControlTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TarjasControlTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TarjasControlTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> actividadControlId = const Value.absent(),
            Value<String> tipo = const Value.absent(),
            Value<int> cantidad = const Value.absent(),
            Value<DateTime> creadoEn = const Value.absent(),
          }) =>
              TarjasControlCompanion(
            id: id,
            actividadControlId: actividadControlId,
            tipo: tipo,
            cantidad: cantidad,
            creadoEn: creadoEn,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int actividadControlId,
            required String tipo,
            required int cantidad,
            Value<DateTime> creadoEn = const Value.absent(),
          }) =>
              TarjasControlCompanion.insert(
            id: id,
            actividadControlId: actividadControlId,
            tipo: tipo,
            cantidad: cantidad,
            creadoEn: creadoEn,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TarjasControlTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({actividadControlId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                      dynamic>>(state) {
                if (actividadControlId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.actividadControlId,
                    referencedTable: $$TarjasControlTableReferences
                        ._actividadControlIdTable(db),
                    referencedColumn: $$TarjasControlTableReferences
                        ._actividadControlIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TarjasControlTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TarjasControlTable,
    TarjaControlData,
    $$TarjasControlTableFilterComposer,
    $$TarjasControlTableOrderingComposer,
    $$TarjasControlTableAnnotationComposer,
    $$TarjasControlTableCreateCompanionBuilder,
    $$TarjasControlTableUpdateCompanionBuilder,
    (TarjaControlData, $$TarjasControlTableReferences),
    TarjaControlData,
    PrefetchHooks Function({bool actividadControlId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ControlesPesajeTableTableManager get controlesPesaje =>
      $$ControlesPesajeTableTableManager(_db, _db.controlesPesaje);
  $$CategoriasPesajeTableTableManager get categoriasPesaje =>
      $$CategoriasPesajeTableTableManager(_db, _db.categoriasPesaje);
  $$AnimalesPesajeTableTableManager get animalesPesaje =>
      $$AnimalesPesajeTableTableManager(_db, _db.animalesPesaje);
  $$StockAnimalesTableTableManager get stockAnimales =>
      $$StockAnimalesTableTableManager(_db, _db.stockAnimales);
  $$CarpetasControlTableTableManager get carpetasControl =>
      $$CarpetasControlTableTableManager(_db, _db.carpetasControl);
  $$ActividadesControlTableTableManager get actividadesControl =>
      $$ActividadesControlTableTableManager(_db, _db.actividadesControl);
  $$TarjasControlTableTableManager get tarjasControl =>
      $$TarjasControlTableTableManager(_db, _db.tarjasControl);
}
