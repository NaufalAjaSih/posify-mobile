import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/roles.dart';

part 'roles_dao.g.dart';

@DriftAccessor(tables: [Roles])
class RolesDao extends DatabaseAccessor<AppDatabase> with _$RolesDaoMixin {
  RolesDao(super.db);

  Future<List<Role>> getAll() => select(roles).get();

  Future<Role?> getById(String id) {
    return (select(roles)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertRole(Role role) => into(roles).insert(role);

  Future<bool> updateRole(Role role) => update(roles).replace(role);

  Future<int> deleteRole(Role role) => delete(roles).delete(role);
}
