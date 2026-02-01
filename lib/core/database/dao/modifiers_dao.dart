import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/modifiers.dart';

part 'modifiers_dao.g.dart';

@DriftAccessor(tables: [Modifiers])
class ModifiersDao extends DatabaseAccessor<AppDatabase>
    with _$ModifiersDaoMixin {
  ModifiersDao(super.db);

  Future<List<Modifier>> getAll() => select(modifiers).get();

  Future<Modifier?> getById(String id) {
    return (select(modifiers)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertModifier(Modifier modifier) =>
      into(modifiers).insert(modifier);

  Future<bool> updateModifier(Modifier modifier) =>
      update(modifiers).replace(modifier);

  Future<int> deleteModifier(Modifier modifier) =>
      delete(modifiers).delete(modifier);
}
