import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/sync_queue.dart';

part 'sync_queue_dao.g.dart';

@DriftAccessor(tables: [SyncQueue])
class SyncQueueDao extends DatabaseAccessor<AppDatabase>
    with _$SyncQueueDaoMixin {
  SyncQueueDao(super.db);

  Future<List<SyncQueueData>> getAll() => select(syncQueue).get();

  Future<SyncQueueData?> getById(String id) {
    return (select(syncQueue)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertSyncQueue(SyncQueueData syncQueueItem) =>
      into(syncQueue).insert(syncQueueItem);

  Future<bool> updateSyncQueue(SyncQueueData syncQueueItem) =>
      update(syncQueue).replace(syncQueueItem);

  Future<int> deleteSyncQueue(SyncQueueData syncQueueItem) =>
      delete(syncQueue).delete(syncQueueItem);
}
