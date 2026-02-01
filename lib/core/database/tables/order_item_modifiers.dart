import 'package:drift/drift.dart';
import 'order_items.dart';
import 'modifier_options.dart';

class OrderItemModifiers extends Table {
  TextColumn get id => text()();
  TextColumn get orderItemId => text().references(OrderItems, #id)();
  TextColumn get modifierOptionId => text().references(ModifierOptions, #id)();
  IntColumn get extraPrice => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
