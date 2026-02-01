import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/stock_movements.dart';
import '../tables/products.dart';
import '../models/composite_models.dart';

part 'stock_movements_dao.g.dart';

@DriftAccessor(tables: [StockMovements, Products])
class StockMovementsDao extends DatabaseAccessor<AppDatabase>
    with _$StockMovementsDaoMixin {
  StockMovementsDao(super.db);

  Future<List<StockMovement>> getAll() => select(stockMovements).get();

  Future<StockMovement?> getById(String id) {
    return (select(
      stockMovements,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertStockMovement(StockMovement stockMovement) =>
      into(stockMovements).insert(stockMovement);

  Future<bool> updateStockMovement(StockMovement stockMovement) =>
      update(stockMovements).replace(stockMovement);

  Future<int> deleteStockMovement(StockMovement stockMovement) =>
      delete(stockMovements).delete(stockMovement);

  Future<List<StockMovementWithProduct>> getStockMovementsWithProduct() {
    return (select(stockMovements).join([
      innerJoin(products, products.id.equalsExp(stockMovements.productId)),
    ])).map((row) {
      return StockMovementWithProduct(
        stockMovement: row.readTable(stockMovements),
        product: row.readTable(products),
      );
    }).get();
  }
}
