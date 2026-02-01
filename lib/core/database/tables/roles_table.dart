import 'package:drift/drift.dart';

class Roles extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();

  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
