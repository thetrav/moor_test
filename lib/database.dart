import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

class Socks extends Table {
  TextColumn get id => text()();
  TextColumn get label => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@UseMoor(tables: [Socks])
class MyDatabase  extends _$MyDatabase {
  MyDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));
  @override
  int get schemaVersion => 1;

  Stream<List<Sock>> watchSocks() {
    return select(socks).watch();
  }

  Future<int> upsert(String id, String label) {
    return into(socks).insert(SocksCompanion(
      id: Value(id),
      label: Value(label)
    ), orReplace: true);
  }

  Future<int> clear() {
    return delete(socks).go();
  }
}