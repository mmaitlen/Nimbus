import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final int id;
  final String zipcode;
  final String cityName;
  final String stateName;
  final double latitude;
  final double longitude;
  final bool isDefault;

  const LocationEntity({
    required this.id,
    required this.zipcode,
    required this.cityName,
    required this.stateName,
    required this.latitude,
    required this.longitude,
    this.isDefault = false,
  });

  @override
  List<Object?> get props => [
        id,
        zipcode,
        cityName,
        stateName,
        latitude,
        longitude,
        isDefault,
      ];
}
