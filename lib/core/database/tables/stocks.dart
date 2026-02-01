import 'package:drift/drift.dart';
import 'products.dart';

class Stocks extends Table {
  TextColumn get productId => text().references(Products, #id)();
  IntColumn get quantity => integer()();
  IntColumn get minStock => integer()();

  @override
  Set<Column> get primaryKey => {productId};
}
