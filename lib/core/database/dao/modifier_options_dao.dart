import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/modifier_options.dart';
import '../tables/modifiers.dart';
import '../models/composite_models.dart';

part 'modifier_options_dao.g.dart';

@DriftAccessor(tables: [ModifierOptions, Modifiers])
class ModifierOptionsDao extends DatabaseAccessor<AppDatabase>
    with _$ModifierOptionsDaoMixin {
  ModifierOptionsDao(super.db);

  Future<List<ModifierOption>> getAll() => select(modifierOptions).get();

  Future<ModifierOption?> getById(String id) {
    return (select(
      modifierOptions,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertModifierOption(ModifierOption modifierOption) =>
      into(modifierOptions).insert(modifierOption);

  Future<bool> updateModifierOption(ModifierOption modifierOption) =>
      update(modifierOptions).replace(modifierOption);

  Future<int> deleteModifierOption(ModifierOption modifierOption) =>
      delete(modifierOptions).delete(modifierOption);

  Future<List<ModifierOptionWithModifier>> getModifierOptionsWithModifier() {
    return (select(modifierOptions).join([
      innerJoin(modifiers, modifiers.id.equalsExp(modifierOptions.modifierId)),
    ])).map((row) {
      return ModifierOptionWithModifier(
        modifierOption: row.readTable(modifierOptions),
        modifier: row.readTable(modifiers),
      );
    }).get();
  }
}
