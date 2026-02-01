import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/users.dart';
import '../tables/roles.dart';
import '../models/composite_models.dart';

part 'users_dao.g.dart';

@DriftAccessor(tables: [Users, Roles])
class UsersDao extends DatabaseAccessor<AppDatabase> with _$UsersDaoMixin {
  UsersDao(super.db);

  Future<List<User>> getAll() => select(users).get();

  Future<User?> getById(String id) {
    return (select(users)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertUser(User user) => into(users).insert(user);

  Future<bool> updateUser(User user) => update(users).replace(user);

  Future<int> deleteUser(User user) => delete(users).delete(user);

  Future<List<UserWithRole>> getUsersWithRoles() {
    return (select(
      users,
    ).join([innerJoin(roles, roles.id.equalsExp(users.roleId))])).map((row) {
      return UserWithRole(
        user: row.readTable(users),
        role: row.readTable(roles),
      );
    }).get();
  }
}
