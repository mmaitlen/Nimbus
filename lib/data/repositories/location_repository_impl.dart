import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/data/datasources/remote/geocoding_api_service.dart';
import 'package:nimbus/data/models/location_model.dart';
import 'package:nimbus/domain/entities/location.dart';
import 'package:nimbus/domain/repositories/location_repository.dart';
import 'package:dio/dio.dart';

class LocationRepositoryImpl implements LocationRepository {
  final GeocodingApiService _geocodingApiService;

  LocationRepositoryImpl(this._geocodingApiService);

  @override
  Future<DataState<LocationEntity>> addLocation(LocationEntity location) {
    throw UnimplementedError(); // TODO: Implement local database interaction
  }

  @override
  Future<DataState<void>> deleteLocation(int id) {
    throw UnimplementedError(); // TODO: Implement local database interaction
  }

  @override
  Future<DataState<LocationEntity?>> getDefaultLocation() {
    throw UnimplementedError(); // TODO: Implement local database interaction
  }

  @override
  Future<DataState<List<LocationEntity>>> getSavedLocations() {
    throw UnimplementedError(); // TODO: Implement local database interaction
  }

  @override
  Future<DataState<void>> setDefaultLocation(int id) {
    throw UnimplementedError(); // TODO: Implement local database interaction
  }

  @override
  Future<DataState<LocationEntity>> getLocationByZipcode(String zipcode) async {
    try {
      final List<LocationModel> locations =
          await _geocodingApiService.getLocationsFromZipcode(zipcode);

      if (locations.isNotEmpty) {
        return DataSuccess(locations.first);
      } else {
        return const DataFailed(Exception('No location found for the given zipcode.'));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } on Exception catch (e) {
      return DataFailed(e);
    }
  }
}
