import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/payments.dart';
import '../tables/orders.dart';
import '../models/composite_models.dart';

part 'payments_dao.g.dart';

@DriftAccessor(tables: [Payments, Orders])
class PaymentsDao extends DatabaseAccessor<AppDatabase>
    with _$PaymentsDaoMixin {
  PaymentsDao(super.db);

  Future<List<Payment>> getAll() => select(payments).get();

  Future<Payment?> getById(String id) {
    return (select(payments)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertPayment(Payment payment) => into(payments).insert(payment);

  Future<bool> updatePayment(Payment payment) =>
      update(payments).replace(payment);

  Future<int> deletePayment(Payment payment) =>
      delete(payments).delete(payment);

  Future<List<PaymentWithOrder>> getPaymentsWithOrder() {
    return (select(payments).join([
      innerJoin(orders, orders.id.equalsExp(payments.orderId)),
    ])).map((row) {
      return PaymentWithOrder(
        payment: row.readTable(payments),
        order: row.readTable(orders),
      );
    }).get();
  }
}
