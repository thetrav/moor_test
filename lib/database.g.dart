// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Sock extends DataClass implements Insertable<Sock> {
  final String id;
  final String label;
  Sock({@required this.id, @required this.label});
  factory Sock.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return Sock(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      label:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}label']),
    );
  }
  factory Sock.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Sock(
      id: serializer.fromJson<String>(json['id']),
      label: serializer.fromJson<String>(json['label']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<String>(id),
      'label': serializer.toJson<String>(label),
    };
  }

  @override
  SocksCompanion createCompanion(bool nullToAbsent) {
    return SocksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      label:
          label == null && nullToAbsent ? const Value.absent() : Value(label),
    );
  }

  Sock copyWith({String id, String label}) => Sock(
        id: id ?? this.id,
        label: label ?? this.label,
      );
  @override
  String toString() {
    return (StringBuffer('Sock(')
          ..write('id: $id, ')
          ..write('label: $label')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, label.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Sock && other.id == this.id && other.label == this.label);
}

class SocksCompanion extends UpdateCompanion<Sock> {
  final Value<String> id;
  final Value<String> label;
  const SocksCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
  });
  SocksCompanion.insert({
    @required String id,
    @required String label,
  })  : id = Value(id),
        label = Value(label);
  SocksCompanion copyWith({Value<String> id, Value<String> label}) {
    return SocksCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
    );
  }
}

class $SocksTable extends Socks with TableInfo<$SocksTable, Sock> {
  final GeneratedDatabase _db;
  final String _alias;
  $SocksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _labelMeta = const VerificationMeta('label');
  GeneratedTextColumn _label;
  @override
  GeneratedTextColumn get label => _label ??= _constructLabel();
  GeneratedTextColumn _constructLabel() {
    return GeneratedTextColumn(
      'label',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, label];
  @override
  $SocksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'socks';
  @override
  final String actualTableName = 'socks';
  @override
  VerificationContext validateIntegrity(SocksCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.label.present) {
      context.handle(
          _labelMeta, label.isAcceptableValue(d.label.value, _labelMeta));
    } else if (label.isRequired && isInserting) {
      context.missing(_labelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Sock map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Sock.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(SocksCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.label.present) {
      map['label'] = Variable<String, StringType>(d.label.value);
    }
    return map;
  }

  @override
  $SocksTable createAlias(String alias) {
    return $SocksTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $SocksTable _socks;
  $SocksTable get socks => _socks ??= $SocksTable(this);
  @override
  List<TableInfo> get allTables => [socks];
}
