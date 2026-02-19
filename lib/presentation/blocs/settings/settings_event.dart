part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class LoadSettings extends SettingsEvent {}

class UpdateUpdateInterval extends SettingsEvent {
  final Duration interval;

  const UpdateUpdateInterval(this.interval);

  @override
  List<Object> get props => [interval];
}

class UpdateTemperatureUnit extends SettingsEvent {
  final String unit;

  const UpdateTemperatureUnit(this.unit);

  @override
  List<Object> get props => [unit];
}

class UpdateWindSpeedUnit extends SettingsEvent {
  final String unit;

  const UpdateWindSpeedUnit(this.unit);

  @override
  List<Object> get props => [unit];
}
