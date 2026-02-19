part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsLoading extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final Duration updateInterval;
  final String temperatureUnit;
  final String windSpeedUnit;

  const SettingsLoaded({
    required this.updateInterval,
    required this.temperatureUnit,
    required this.windSpeedUnit,
  });

  @override
  List<Object> get props => [updateInterval, temperatureUnit, windSpeedUnit];
}

class SettingsError extends SettingsState {
  final String message;

  const SettingsError(this.message);

  @override
  List<Object> get props => [message];
}
