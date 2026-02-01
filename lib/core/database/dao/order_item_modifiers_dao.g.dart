// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_modifiers_dao.dart';

// ignore_for_file: type=lint
mixin _$OrderItemModifiersDaoMixin on DatabaseAccessor<AppDatabase> {
  $RolesTable get roles => attachedDatabase.roles;
  $UsersTable get users => attachedDatabase.users;
  $OrdersTable get orders => attachedDatabase.orders;
  $CategoriesTable get categories => attachedDatabase.categories;
  $ProductsTable get products => attachedDatabase.products;
  $OrderItemsTable get orderItems => attachedDatabase.orderItems;
  $ModifiersTable get modifiers => attachedDatabase.modifiers;
  $ModifierOptionsTable get modifierOptions => attachedDatabase.modifierOptions;
  $OrderItemModifiersTable get orderItemModifiers =>
      attachedDatabase.orderItemModifiers;
  OrderItemModifiersDaoManager get managers =>
      OrderItemModifiersDaoManager(this);
}

class OrderItemModifiersDaoManager {
  final _$OrderItemModifiersDaoMixin _db;
  OrderItemModifiersDaoManager(this._db);
  $$RolesTableTableManager get roles =>
      $$RolesTableTableManager(_db.attachedDatabase, _db.roles);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db.attachedDatabase, _db.users);
  $$OrdersTableTableManager get orders =>
      $$OrdersTableTableManager(_db.attachedDatabase, _db.orders);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db.attachedDatabase, _db.categories);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db.attachedDatabase, _db.products);
  $$OrderItemsTableTableManager get orderItems =>
      $$OrderItemsTableTableManager(_db.attachedDatabase, _db.orderItems);
  $$ModifiersTableTableManager get modifiers =>
      $$ModifiersTableTableManager(_db.attachedDatabase, _db.modifiers);
  $$ModifierOptionsTableTableManager get modifierOptions =>
      $$ModifierOptionsTableTableManager(
        _db.attachedDatabase,
        _db.modifierOptions,
      );
  $$OrderItemModifiersTableTableManager get orderItemModifiers =>
      $$OrderItemModifiersTableTableManager(
        _db.attachedDatabase,
        _db.orderItemModifiers,
      );
}
