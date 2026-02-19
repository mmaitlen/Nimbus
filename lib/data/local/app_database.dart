import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'app_database.g.dart';
part 'daos/location_dao.g.dart';
part 'daos/settings_dao.g.dart';
part 'daos/error_dao.g.dart';

@DataClassName('LocationEntry')
class Locations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get zipcode => text().unique()();
  TextColumn get cityName => text()();
  TextColumn get stateName => text()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  BoolColumn get isDefault => boolean().withDefault(const Constant(false))();
}

@DataClassName('CachedWeatherEntry')
class CachedWeather extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get locationId => integer().references(Locations, #id)();
  TextColumn get description => text()();
  RealColumn get temperature => real()();
  RealColumn get windSpeed => real()();
  TextColumn get weatherIconUrl => text()();
  DateTimeColumn get timestamp => dateTime()();
}

@DataClassName('SettingEntry')
class Settings extends Table {
  TextColumn get key => text().unique()();
  TextColumn get value => text()();
}

@DataClassName('AppErrorEntry')
class AppErrors extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get apiEndpoint => text()();
  IntColumn get statusCode => integer().nullable()();
  TextColumn get errorMessage => text()();
  TextColumn get locationIdentifier => text().nullable()();
  TextColumn get requestParameters => text().nullable()(); // Stored as JSON string
}

@DriftDatabase(tables: [Locations, CachedWeather, Settings, AppErrors], daos: [LocationDao, SettingsDao, ErrorDao])
class AppDatabase extends _$AppDatabase with LocationDaoMixin, SettingsDaoMixin, ErrorDaoMixin {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
