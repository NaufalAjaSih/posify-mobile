import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/stocks.dart';
import '../tables/products.dart';
import '../models/composite_models.dart';

part 'stocks_dao.g.dart';

@DriftAccessor(tables: [Stocks, Products])
class StocksDao extends DatabaseAccessor<AppDatabase> with _$StocksDaoMixin {
  StocksDao(super.db);

  Future<List<Stock>> getAll() => select(stocks).get();

  Future<Stock?> getByProductId(String productId) {
    return (select(
      stocks,
    )..where((t) => t.productId.equals(productId))).getSingleOrNull();
  }

  // Helper for getById since PK is productId
  Future<Stock?> getById(String id) => getByProductId(id);

  Future<int> insertStock(Stock stock) => into(stocks).insert(stock);

  Future<bool> updateStock(Stock stock) => update(stocks).replace(stock);

  Future<int> deleteStock(Stock stock) => delete(stocks).delete(stock);

  Future<List<StockWithProduct>> getStocksWithProduct() {
    return (select(stocks).join([
      innerJoin(products, products.id.equalsExp(stocks.productId)),
    ])).map((row) {
      return StockWithProduct(
        stock: row.readTable(stocks),
        product: row.readTable(products),
      );
    }).get();
  }
}
