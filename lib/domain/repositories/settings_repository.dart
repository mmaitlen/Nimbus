import 'package:nimbus/core/utils/data_state.dart';

abstract class SettingsRepository {
  Future<DataState<void>> setUpdateInterval(Duration interval);
  Future<DataState<Duration>> getUpdateInterval();
  Future<DataState<void>> setTemperatureUnit(String unit); // e.g., 'C' or 'F'
  Future<DataState<String>> getTemperatureUnit();
  Future<DataState<void>> setWindSpeedUnit(String unit); // e.g., 'mph' or 'kph'
  Future<DataState<String>> getWindSpeedUnit();
}
