import 'package:drift/drift.dart';

class Modifiers extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get isRequired => integer()();
  IntColumn get isMultiple => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
