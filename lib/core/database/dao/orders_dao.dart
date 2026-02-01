import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/orders.dart';
import '../tables/users.dart';
import '../models/composite_models.dart';

part 'orders_dao.g.dart';

@DriftAccessor(tables: [Orders, Users])
class OrdersDao extends DatabaseAccessor<AppDatabase> with _$OrdersDaoMixin {
  OrdersDao(super.db);

  Future<List<Order>> getAll() => select(orders).get();

  Future<Order?> getById(String id) {
    return (select(orders)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertOrder(Order order) => into(orders).insert(order);

  Future<bool> updateOrder(Order order) => update(orders).replace(order);

  Future<int> deleteOrder(Order order) => delete(orders).delete(order);

  Future<List<OrderWithUser>> getOrdersWithUser() {
    return (select(
      orders,
    ).join([innerJoin(users, users.id.equalsExp(orders.userId))])).map((row) {
      return OrderWithUser(
        order: row.readTable(orders),
        user: row.readTable(users),
      );
    }).get();
  }
}
