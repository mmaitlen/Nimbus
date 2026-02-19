import 'package:drift/drift.dart';
import 'package:nimbus/data/local/app_database.dart';

part 'error_dao.g.dart';

@DriftAccessor(tables: [AppErrors])
class ErrorDao extends DatabaseAccessor<AppDatabase> with _$ErrorDaoMixin {
  ErrorDao(AppDatabase db) : super(db: db);

  Future<List<AppErrorEntry>> getErrors() => select(appErrors).get();
  Future<int> insertError(AppErrorsCompanion entry) => into(appErrors).insert(entry);
  Future<int> deleteErrorsOlderThan(DateTime threshold) =>
      (delete(appErrors)..where((tbl) => tbl.timestamp.isSmallerThanValue(threshold)))
          .go();
}
