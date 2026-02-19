import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/domain/usecases/get_temperature_unit.dart';
import 'package:nimbus/domain/usecases/get_update_interval.dart';
import 'package:nimbus/domain/usecases/get_wind_speed_unit.dart';
import 'package:nimbus/domain/usecases/set_temperature_unit.dart';
import 'package:nimbus/domain/usecases/set_update_interval.dart';
import 'package:nimbus/domain/usecases/set_wind_speed_unit.dart';
import 'package:nimbus/domain/usecases/usecase.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetUpdateIntervalUseCase _getUpdateIntervalUseCase;
  final SetUpdateIntervalUseCase _setUpdateIntervalUseCase;
  final GetTemperatureUnitUseCase _getTemperatureUnitUseCase;
  final SetTemperatureUnitUseCase _setTemperatureUnitUseCase;
  final GetWindSpeedUnitUseCase _getWindSpeedUnitUseCase;
  final SetWindSpeedUnitUseCase _setWindSpeedUnitUseCase;

  SettingsBloc(
    this._getUpdateIntervalUseCase,
    this._setUpdateIntervalUseCase,
    this._getTemperatureUnitUseCase,
    this._setTemperatureUnitUseCase,
    this._getWindSpeedUnitUseCase,
    this._setWindSpeedUnitUseCase,
  ) : super(SettingsLoading()) {
    on<LoadSettings>(onLoadSettings);
    on<UpdateUpdateInterval>(onUpdateUpdateInterval);
    on<UpdateTemperatureUnit>(onUpdateTemperatureUnit);
    on<UpdateWindSpeedUnit>(onUpdateWindSpeedUnit);
  }

  void onLoadSettings(LoadSettings event, Emitter<SettingsState> emit) async {
    emit(SettingsLoading());
    final updateIntervalState = await _getUpdateIntervalUseCase(const NoParams());
    final temperatureUnitState =
        await _getTemperatureUnitUseCase(const NoParams());
    final windSpeedUnitState =
        await _getWindSpeedUnitUseCase(const NoParams());

    if (updateIntervalState is DataSuccess &&
        temperatureUnitState is DataSuccess &&
        windSpeedUnitState is DataSuccess &&
        updateIntervalState.data != null &&
        temperatureUnitState.data != null &&
        windSpeedUnitState.data != null) {
      emit(SettingsLoaded(
        updateInterval: updateIntervalState.data!,
        temperatureUnit: temperatureUnitState.data!,
        windSpeedUnit: windSpeedUnitState.data!,
      ));
    } else {
      emit(SettingsError(
          'Failed to load settings: ${updateIntervalState.error ?? temperatureUnitState.error ?? windSpeedUnitState.error}'));
    }
  }

  void onUpdateUpdateInterval(
      UpdateUpdateInterval event, Emitter<SettingsState> emit) async {
    final dataState = await _setUpdateIntervalUseCase(event.interval);
    if (dataState is DataSuccess) {
      add(LoadSettings()); // Reload settings to reflect changes
    } else {
      emit(SettingsError(dataState.error.toString()));
    }
  }

  void onUpdateTemperatureUnit(
      UpdateTemperatureUnit event, Emitter<SettingsState> emit) async {
    final dataState = await _setTemperatureUnitUseCase(event.unit);
    if (dataState is DataSuccess) {
      add(LoadSettings());
    } else {
      emit(SettingsError(dataState.error.toString()));
    }
  }

  void onUpdateWindSpeedUnit(
      UpdateWindSpeedUnit event, Emitter<SettingsState> emit) async {
    final dataState = await _setWindSpeedUnitUseCase(event.unit);
    if (dataState is DataSuccess) {
      add(LoadSettings());
    } else {
      emit(SettingsError(dataState.error.toString()));
    }
  }
}
