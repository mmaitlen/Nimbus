import 'package:drift/drift.dart';
import 'package:nimbus/data/local/app_database.dart';

part 'location_dao.g.dart';

@DriftAccessor(tables: [Locations, CachedWeather])
class LocationDao extends DatabaseAccessor<AppDatabase> with _$LocationDaoMixin {
  LocationDao(AppDatabase db) : super(db);

  // Locations operations
  Future<List<LocationEntry>> getSavedLocations() => select(locations).get();
  Future<LocationEntry?> getLocationByZipcode(String zipcode) =>
      (select(locations)..where((tbl) => tbl.zipcode.equals(zipcode))).getSingleOrNull();
  Future<int> insertLocation(LocationsCompanion entry) => into(locations).insert(entry);
  Future<bool> updateLocation(LocationEntry entry) => update(locations).replace(entry);
  Future<int> deleteLocation(int id) =>
      (delete(locations)..where((tbl) => tbl.id.equals(id))).go();
  Future<void> clearAllDefaults() =>
      (update(locations)..where((tbl) => tbl.isDefault.equals(true))).write(
        const LocationsCompanion(isDefault: Value(false)),
      );

  // CachedWeather operations
  Future<CachedWeatherEntry?> getCachedWeatherForLocation(int locationId) =>
      (select(cachedWeather)..where((tbl) => tbl.locationId.equals(locationId)))
          .getSingleOrNull();
  Future<int> insertCachedWeather(CachedWeatherCompanion entry) =>
      into(cachedWeather).insert(entry);
  Future<bool> updateCachedWeather(CachedWeatherEntry entry) =>
      update(cachedWeather).replace(entry);
  Future<int> deleteCachedWeather(int locationId) =>
      (delete(cachedWeather)..where((tbl) => tbl.locationId.equals(locationId))).go();
}
