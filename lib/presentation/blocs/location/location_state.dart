part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationLoading extends LocationState {}

class LocationError extends LocationState {
  final String message;

  const LocationError(this.message);

  @override
  List<Object> get props => [message];
}

class LocationsLoaded extends LocationState {
  final List<LocationEntity> locations;
  final LocationEntity? defaultLocation;

  const LocationsLoaded({required this.locations, this.defaultLocation});

  @override
  List<Object> get props => [locations, defaultLocation ?? ''];
}

class LocationAdded extends LocationState {
  final LocationEntity newLocation;

  const LocationAdded(this.newLocation);

  @override
  List<Object> get props => [newLocation];
}

class LocationValidated extends LocationState {
  final LocationEntity location;

  const LocationValidated(this.location);

  @override
  List<Object> get props => [location];
}

class DefaultLocationSet extends LocationState {
  final LocationEntity defaultLocation;

  const DefaultLocationSet(this.defaultLocation);

  @override
  List<Object> get props => [defaultLocation];
}
