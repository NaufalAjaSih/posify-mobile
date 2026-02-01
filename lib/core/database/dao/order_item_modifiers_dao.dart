import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/order_item_modifiers.dart';
import '../tables/modifier_options.dart';
import '../models/composite_models.dart';

part 'order_item_modifiers_dao.g.dart';

@DriftAccessor(tables: [OrderItemModifiers, ModifierOptions])
class OrderItemModifiersDao extends DatabaseAccessor<AppDatabase>
    with _$OrderItemModifiersDaoMixin {
  OrderItemModifiersDao(super.db);

  Future<List<OrderItemModifier>> getAll() => select(orderItemModifiers).get();

  Future<OrderItemModifier?> getById(String id) {
    return (select(
      orderItemModifiers,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertOrderItemModifier(OrderItemModifier orderItemModifier) =>
      into(orderItemModifiers).insert(orderItemModifier);

  Future<bool> updateOrderItemModifier(OrderItemModifier orderItemModifier) =>
      update(orderItemModifiers).replace(orderItemModifier);

  Future<int> deleteOrderItemModifier(OrderItemModifier orderItemModifier) =>
      delete(orderItemModifiers).delete(orderItemModifier);

  Future<List<OrderItemModifierWithOption>> getOrderItemModifiersWithOption() {
    return (select(orderItemModifiers).join([
      innerJoin(
        modifierOptions,
        modifierOptions.id.equalsExp(orderItemModifiers.modifierOptionId),
      ),
    ])).map((row) {
      return OrderItemModifierWithOption(
        orderItemModifier: row.readTable(orderItemModifiers),
        modifierOption: row.readTable(modifierOptions),
      );
    }).get();
  }
}
