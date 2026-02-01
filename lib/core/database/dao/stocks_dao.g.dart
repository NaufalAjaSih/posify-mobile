// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stocks_dao.dart';

// ignore_for_file: type=lint
mixin _$StocksDaoMixin on DatabaseAccessor<AppDatabase> {
  $CategoriesTable get categories => attachedDatabase.categories;
  $ProductsTable get products => attachedDatabase.products;
  $StocksTable get stocks => attachedDatabase.stocks;
  StocksDaoManager get managers => StocksDaoManager(this);
}

class StocksDaoManager {
  final _$StocksDaoMixin _db;
  StocksDaoManager(this._db);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db.attachedDatabase, _db.categories);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db.attachedDatabase, _db.products);
  $$StocksTableTableManager get stocks =>
      $$StocksTableTableManager(_db.attachedDatabase, _db.stocks);
}
