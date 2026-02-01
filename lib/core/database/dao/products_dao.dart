import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/products.dart';
import '../tables/categories.dart';
import '../models/composite_models.dart';

part 'products_dao.g.dart';

@DriftAccessor(tables: [Products, Categories])
class ProductsDao extends DatabaseAccessor<AppDatabase>
    with _$ProductsDaoMixin {
  ProductsDao(AppDatabase db) : super(db);

  Future<List<Product>> getAll() => select(products).get();

  Future<Product?> getById(String id) {
    return (select(products)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertProduct(Product product) => into(products).insert(product);

  Future<bool> updateProduct(Product product) =>
      update(products).replace(product);

  Future<int> deleteProduct(Product product) =>
      delete(products).delete(product);

  Future<List<ProductWithCategory>> getProductsWithCategory() {
    return (select(products).join([
      innerJoin(categories, categories.id.equalsExp(products.categoryId)),
    ])).map((row) {
      return ProductWithCategory(
        product: row.readTable(products),
        category: row.readTable(categories),
      );
    }).get();
  }
}
