import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/domain/entities/location.dart';
import 'package:nimbus/domain/usecases/add_location.dart';
import 'package:nimbus/domain/usecases/delete_location.dart';
import 'package:nimbus/domain/usecases/get_default_location.dart';
import 'package:nimbus/domain/usecases/get_location_by_zipcode.dart';
import 'package:nimbus/domain/usecases/get_saved_locations.dart';
import 'package:nimbus/domain/usecases/set_default_location.dart';
import 'package:nimbus/domain/usecases/usecase.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetSavedLocationsUseCase _getSavedLocationsUseCase;
  final AddLocationUseCase _addLocationUseCase;
  final DeleteLocationUseCase _deleteLocationUseCase;
  final SetDefaultLocationUseCase _setDefaultLocationUseCase;
  final GetDefaultLocationUseCase _getDefaultLocationUseCase;
  final GetLocationByZipcodeUseCase _getLocationByZipcodeUseCase;

  LocationBloc(
    this._getSavedLocationsUseCase,
    this._addLocationUseCase,
    this._deleteLocationUseCase,
    this._setDefaultLocationUseCase,
    this._getDefaultLocationUseCase,
    this._getLocationByZipcodeUseCase,
  ) : super(LocationLoading()) {
    on<GetSavedLocations>(onGetSavedLocations);
    on<AddLocation>(onAddLocation);
    on<DeleteLocation>(onDeleteLocation);
    on<SetDefaultLocation>(onSetDefaultLocation);
    on<GetLocationByZipcodeEvent>(onGetLocationByZipcode);
  }

  void onGetSavedLocations(
      GetSavedLocations event, Emitter<LocationState> emit) async {
    emit(LocationLoading());
    final dataState = await _getSavedLocationsUseCase(const NoParams());

    if (dataState is DataSuccess && dataState.data != null) {
      final defaultLocationState =
          await _getDefaultLocationUseCase(const NoParams());
      LocationEntity? defaultLocation;
      if (defaultLocationState is DataSuccess) {
        defaultLocation = defaultLocationState.data;
      }
      emit(LocationsLoaded(
          locations: dataState.data!, defaultLocation: defaultLocation));
    } else if (dataState is DataFailed) {
      emit(LocationError(dataState.error.toString()));
    }
  }

  void onAddLocation(AddLocation event, Emitter<LocationState> emit) async {
    emit(LocationLoading());
    // First, validate/get location details by zipcode
    final locationDataState =
        await _getLocationByZipcodeUseCase(event.zipcode);

    if (locationDataState is DataSuccess && locationDataState.data != null) {
      final locationToAdd = locationDataState.data!;
      final addResult = await _addLocationUseCase(locationToAdd);

      if (addResult is DataSuccess) {
        // After adding, reload all saved locations
        onGetSavedLocations(GetSavedLocations(), emit);
      } else if (addResult is DataFailed) {
        emit(LocationError(addResult.error.toString()));
      }
    } else if (locationDataState is DataFailed) {
      emit(LocationError(locationDataState.error.toString()));
    }
  }

  void onDeleteLocation(
      DeleteLocation event, Emitter<LocationState> emit) async {
    emit(LocationLoading());
    final dataState = await _deleteLocationUseCase(event.id);

    if (dataState is DataSuccess) {
      onGetSavedLocations(GetSavedLocations(), emit);
    } else if (dataState is DataFailed) {
      emit(LocationError(dataState.error.toString()));
    }
  }

  void onSetDefaultLocation(
      SetDefaultLocation event, Emitter<LocationState> emit) async {
    emit(LocationLoading());
    final dataState = await _setDefaultLocationUseCase(event.id);

    if (dataState is DataSuccess) {
      onGetSavedLocations(GetSavedLocations(), emit);
    } else if (dataState is DataFailed) {
      emit(LocationError(dataState.error.toString()));
    }
  }

  void onGetLocationByZipcode(
      GetLocationByZipcodeEvent event, Emitter<LocationState> emit) async {
    emit(LocationLoading());
    final dataState = await _getLocationByZipcodeUseCase(event.zipcode);

    if (dataState is DataSuccess && dataState.data != null) {
      emit(LocationValidated(dataState.data!));
    } else if (dataState is DataFailed) {
      emit(LocationError(dataState.error.toString()));
    }
  }
}
