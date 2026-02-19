part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class GetSavedLocations extends LocationEvent {}

class AddLocation extends LocationEvent {
  final String zipcode;

  const AddLocation(this.zipcode);

  @override
  List<Object> get props => [zipcode];
}

class DeleteLocation extends LocationEvent {
  final int id;

  const DeleteLocation(this.id);

  @override
  List<Object> get props => [id];
}

class SetDefaultLocation extends LocationEvent {
  final int id;

  const SetDefaultLocation(this.id);

  @override
  List<Object> get props => [id];
}

class GetLocationByZipcodeEvent extends LocationEvent {
  final String zipcode;

  const GetLocationByZipcodeEvent(this.zipcode);

  @override
  List<Object> get props => [zipcode];
}