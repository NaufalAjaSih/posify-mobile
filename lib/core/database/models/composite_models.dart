import '../app_database.dart';

class UserWithRole {
  final User user;
  final Role role;

  UserWithRole({required this.user, required this.role});
}

class ProductWithCategory {
  final Product product;
  final Category category;

  ProductWithCategory({required this.product, required this.category});
}

class ModifierOptionWithModifier {
  final ModifierOption modifierOption;
  final Modifier modifier;

  ModifierOptionWithModifier({
    required this.modifierOption,
    required this.modifier,
  });
}

class OrderWithUser {
  final Order order;
  final User user;

  OrderWithUser({required this.order, required this.user});
}

class OrderItemWithProduct {
  final OrderItem orderItem;
  final Product product;

  OrderItemWithProduct({required this.orderItem, required this.product});
}

class OrderItemModifierWithOption {
  final OrderItemModifier orderItemModifier;
  final ModifierOption modifierOption;

  OrderItemModifierWithOption({
    required this.orderItemModifier,
    required this.modifierOption,
  });
}

class PaymentWithOrder {
  final Payment payment;
  final Order order;

  PaymentWithOrder({required this.payment, required this.order});
}

class StockWithProduct {
  final Stock stock;
  final Product product;

  StockWithProduct({required this.stock, required this.product});
}

class StockMovementWithProduct {
  final StockMovement stockMovement;
  final Product product;

  StockMovementWithProduct({
    required this.stockMovement,
    required this.product,
  });
}
