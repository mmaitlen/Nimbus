import 'package:nimbus/domain/entities/location.dart';

class LocationModel extends LocationEntity {
  const LocationModel({
    required int id,
    required String zipcode,
    required String cityName,
    required String stateName,
    required double latitude,
    required double longitude,
    bool isDefault = false,
  }) : super(
          id: id,
          zipcode: zipcode,
          cityName: cityName,
          stateName: stateName,
          latitude: latitude,
          longitude: longitude,
          isDefault: isDefault,
        );

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    // This factory constructor is a placeholder. The GeocodingApiService
    // already constructs a LocationModel from its response directly.
    // This might be used if we were deserializing from a generic API response.
    throw UnimplementedError('LocationModel.fromJson() not yet implemented.');
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'zipcode': zipcode,
      'cityName': cityName,
      'stateName': stateName,
      'latitude': latitude,
      'longitude': longitude,
      'isDefault': isDefault,
    };
  }

  factory LocationModel.fromLocationEntity(LocationEntity entity) {
    return LocationModel(
      id: entity.id,
      zipcode: entity.zipcode,
      cityName: entity.cityName,
      stateName: entity.stateName,
      latitude: entity.latitude,
      longitude: entity.longitude,
      isDefault: entity.isDefault,
    );
  }
}
