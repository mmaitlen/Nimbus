import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/domain/repositories/settings_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SharedPreferences _sharedPreferences;

  SettingsRepositoryImpl(this._sharedPreferences);

  static const String _updateIntervalKey = 'updateInterval';
  static const String _temperatureUnitKey = 'temperatureUnit';
  static const String _windSpeedUnitKey = 'windSpeedUnit';

  @override
  Future<DataState<Duration>> getUpdateInterval() async {
    try {
      final int? milliseconds = _sharedPreferences.getInt(_updateIntervalKey);
      if (milliseconds != null) {
        return DataSuccess(Duration(milliseconds: milliseconds));
      }
      return const DataSuccess(Duration(minutes: 30)); // Default to 30 minutes
    } catch (e) {
      return DataFailed(Exception(e.toString()));
    }
  }

  @override
  Future<DataState<String>> getTemperatureUnit() async {
    try {
      final String? unit = _sharedPreferences.getString(_temperatureUnitKey);
      return DataSuccess(unit ?? 'F'); // Default to Fahrenheit
    } catch (e) {
      return DataFailed(Exception(e.toString()));
    }
  }

  @override
  Future<DataState<String>> getWindSpeedUnit() async {
    try {
      final String? unit = _sharedPreferences.getString(_windSpeedUnitKey);
      return DataSuccess(unit ?? 'mph'); // Default to mph
    } catch (e) {
      return DataFailed(Exception(e.toString()));
    }
  }

  @override
  Future<DataState<void>> setUpdateInterval(Duration interval) async {
    try {
      await _sharedPreferences.setInt(_updateIntervalKey, interval.inMilliseconds);
      return const DataSuccess(null);
    } catch (e) {
      return DataFailed(Exception(e.toString()));
    }
  }

  @override
  Future<DataState<void>> setTemperatureUnit(String unit) async {
    try {
      await _sharedPreferences.setString(_temperatureUnitKey, unit);
      return const DataSuccess(null);
    } catch (e) {
      return DataFailed(Exception(e.toString()));
    }
  }

  @override
  Future<DataState<void>> setWindSpeedUnit(String unit) async {
    try {
      await _sharedPreferences.setString(_windSpeedUnitKey, unit);
      return const DataSuccess(null);
    } catch (e) {
      return DataFailed(Exception(e.toString()));
    }
  }
}
