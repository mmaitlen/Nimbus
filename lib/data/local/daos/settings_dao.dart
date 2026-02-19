import 'package:drift/drift.dart';
import 'package:nimbus/data/local/app_database.dart';

part 'settings_dao.g.dart';

@DriftAccessor(tables: [Settings])
class SettingsDao extends DatabaseAccessor<AppDatabase> with _$SettingsDaoMixin {
  SettingsDao(AppDatabase db) : super(db);

  Future<SettingEntry?> getSetting(String key) =>
      (select(settings)..where((tbl) => tbl.key.equals(key))).getSingleOrNull();

  Future<void> saveSetting(String key, String value) =>
      into(settings).insert(SettingsCompanion.insert(key: key, value: value),
          mode: InsertMode.insertOrReplace);
}
