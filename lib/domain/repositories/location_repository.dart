import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/domain/entities/location.dart';

abstract class LocationRepository {
  Future<DataState<List<LocationEntity>>> getSavedLocations();
  Future<DataState<LocationEntity>> addLocation(LocationEntity location);
  Future<DataState<void>> deleteLocation(int id);
  Future<DataState<void>> setDefaultLocation(int id);
  Future<DataState<LocationEntity?>> getDefaultLocation();
  Future<DataState<LocationEntity>> getLocationByZipcode(String zipcode);
}
