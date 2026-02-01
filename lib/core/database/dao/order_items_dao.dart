import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/order_items.dart';
import '../tables/products.dart';
import '../models/composite_models.dart';

part 'order_items_dao.g.dart';

@DriftAccessor(tables: [OrderItems, Products])
class OrderItemsDao extends DatabaseAccessor<AppDatabase>
    with _$OrderItemsDaoMixin {
  OrderItemsDao(super.db);

  Future<List<OrderItem>> getAll() => select(orderItems).get();

  Future<OrderItem?> getById(String id) {
    return (select(
      orderItems,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertOrderItem(OrderItem orderItem) =>
      into(orderItems).insert(orderItem);

  Future<bool> updateOrderItem(OrderItem orderItem) =>
      update(orderItems).replace(orderItem);

  Future<int> deleteOrderItem(OrderItem orderItem) =>
      delete(orderItems).delete(orderItem);

  Future<List<OrderItemWithProduct>> getOrderItemsWithProduct() {
    return (select(orderItems).join([
      innerJoin(products, products.id.equalsExp(orderItems.productId)),
    ])).map((row) {
      return OrderItemWithProduct(
        orderItem: row.readTable(orderItems),
        product: row.readTable(products),
      );
    }).get();
  }
}
