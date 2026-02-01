// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modifier_options_dao.dart';

// ignore_for_file: type=lint
mixin _$ModifierOptionsDaoMixin on DatabaseAccessor<AppDatabase> {
  $ModifiersTable get modifiers => attachedDatabase.modifiers;
  $ModifierOptionsTable get modifierOptions => attachedDatabase.modifierOptions;
  ModifierOptionsDaoManager get managers => ModifierOptionsDaoManager(this);
}

class ModifierOptionsDaoManager {
  final _$ModifierOptionsDaoMixin _db;
  ModifierOptionsDaoManager(this._db);
  $$ModifiersTableTableManager get modifiers =>
      $$ModifiersTableTableManager(_db.attachedDatabase, _db.modifiers);
  $$ModifierOptionsTableTableManager get modifierOptions =>
      $$ModifierOptionsTableTableManager(
        _db.attachedDatabase,
        _db.modifierOptions,
      );
}
