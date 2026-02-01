import 'package:drift/drift.dart';
import 'roles.dart';

class Users extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get pin => text()();
  TextColumn get roleId => text().references(Roles, #id)();
  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
