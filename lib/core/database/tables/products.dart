import 'package:drift/drift.dart';
import 'categories.dart';

class Products extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get sku => text()();
  IntColumn get price => integer()();
  IntColumn get cost => integer()();
  TextColumn get categoryId => text().references(Categories, #id)();
  IntColumn get isActive => integer()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
