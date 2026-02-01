import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'package:posify/core/database/dao/roles_dao.dart';
import 'package:posify/core/database/dao/users_dao.dart';
import 'package:posify/core/database/dao/categories_dao.dart';
import 'package:posify/core/database/dao/products_dao.dart';
import 'package:posify/core/database/dao/modifiers_dao.dart';
import 'package:posify/core/database/dao/modifier_options_dao.dart';
import 'package:posify/core/database/dao/orders_dao.dart';
import 'package:posify/core/database/dao/order_items_dao.dart';
import 'package:posify/core/database/dao/order_item_modifiers_dao.dart';
import 'package:posify/core/database/dao/payments_dao.dart';
import 'package:posify/core/database/dao/stocks_dao.dart';
import 'package:posify/core/database/dao/stock_movements_dao.dart';
import 'package:posify/core/database/dao/sync_queue_dao.dart';

import 'package:posify/core/database/tables/roles.dart';
import 'package:posify/core/database/tables/users.dart';
import 'package:posify/core/database/tables/categories.dart';
import 'package:posify/core/database/tables/products.dart';
import 'package:posify/core/database/tables/modifiers.dart';
import 'package:posify/core/database/tables/modifier_options.dart';
import 'package:posify/core/database/tables/orders.dart';
import 'package:posify/core/database/tables/order_items.dart';
import 'package:posify/core/database/tables/order_item_modifiers.dart';
import 'package:posify/core/database/tables/payments.dart';
import 'package:posify/core/database/tables/stocks.dart';
import 'package:posify/core/database/tables/stock_movements.dart';
import 'package:posify/core/database/tables/sync_queue.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Roles,
    Users,
    Categories,
    Products,
    Modifiers,
    ModifierOptions,
    Orders,
    OrderItems,
    OrderItemModifiers,
    Payments,
    Stocks,
    StockMovements,
    SyncQueue,
  ],
  daos: [
    RolesDao,
    UsersDao,
    CategoriesDao,
    ProductsDao,
    ModifiersDao,
    ModifierOptionsDao,
    OrdersDao,
    OrderItemsDao,
    OrderItemModifiersDao,
    PaymentsDao,
    StocksDao,
    StockMovementsDao,
    SyncQueueDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'app_database');
  }
}
