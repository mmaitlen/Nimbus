// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_dao.dart';

// ignore_for_file: type=lint
mixin _$ErrorDaoMixin on DatabaseAccessor<AppDatabase> {
  $AppErrorsTable get appErrors => attachedDatabase.appErrors;
  ErrorDaoManager get managers => ErrorDaoManager(this);
}

class ErrorDaoManager {
  final _$ErrorDaoMixin _db;
  ErrorDaoManager(this._db);
  $$AppErrorsTableTableManager get appErrors =>
      $$AppErrorsTableTableManager(_db.attachedDatabase, _db.appErrors);
}
