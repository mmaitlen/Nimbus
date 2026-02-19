// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_dao.dart';

// ignore_for_file: type=lint
mixin _$LocationDaoMixin on DatabaseAccessor<AppDatabase> {
  $LocationsTable get locations => attachedDatabase.locations;
  $CachedWeatherTable get cachedWeather => attachedDatabase.cachedWeather;
  LocationDaoManager get managers => LocationDaoManager(this);
}

class LocationDaoManager {
  final _$LocationDaoMixin _db;
  LocationDaoManager(this._db);
  $$LocationsTableTableManager get locations =>
      $$LocationsTableTableManager(_db.attachedDatabase, _db.locations);
  $$CachedWeatherTableTableManager get cachedWeather =>
      $$CachedWeatherTableTableManager(_db.attachedDatabase, _db.cachedWeather);
}
