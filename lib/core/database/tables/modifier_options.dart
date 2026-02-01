import 'package:drift/drift.dart';
import 'modifiers.dart';

class ModifierOptions extends Table {
  TextColumn get id => text()();
  TextColumn get modifierId => text().references(Modifiers, #id)();
  TextColumn get name => text()();
  IntColumn get extraPrice => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
