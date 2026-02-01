import 'package:drift/drift.dart';
import 'users.dart';

class Orders extends Table {
  TextColumn get id => text()();
  TextColumn get invoiceNumber => text()();
  IntColumn get total => integer()();
  IntColumn get discount => integer()();
  IntColumn get tax => integer()();
  TextColumn get status => text()();
  IntColumn get createdAt => integer()();
  TextColumn get userId => text().references(Users, #id)();

  @override
  Set<Column> get primaryKey => {id};
}
