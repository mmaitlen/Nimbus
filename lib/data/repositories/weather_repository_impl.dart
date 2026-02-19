import 'package:dio/dio.dart';
import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/data/datasources/remote/nws_api_service.dart';
import 'package:nimbus/data/models/weather_model.dart';
import 'package:nimbus/domain/entities/weather.dart';
import 'package:nimbus/domain/repositories/weather_repository.dart';
import 'package:nimbus/data/local/app_database.dart';
import 'package:nimbus/domain/repositories/settings_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final NwsApiService _nwsApiService;
  final AppDatabase _appDatabase;
  final SettingsRepository _settingsRepository;

  WeatherRepositoryImpl(
      this._nwsApiService, this._appDatabase, this._settingsRepository);

  @override
  Future<DataState<WeatherEntity>> getCurrentWeather(
      double latitude, double longitude) async {
    try {
      // Check cache first
      final cachedWeather = await _appDatabase.select(_appDatabase.cachedWeather).get();
      if (cachedWeather.isNotEmpty) {
        final lastCachedEntry = cachedWeather.last; // Assuming last is most recent
        final updateIntervalState = await _settingsRepository.getUpdateInterval();

        if (updateIntervalState is DataSuccess && updateIntervalState.data != null) {
          final updateInterval = updateIntervalState.data!;
          if (DateTime.now().difference(lastCachedEntry.timestamp) < updateInterval) {
            // Cache is fresh, return cached data
            return DataSuccess(
              WeatherModel(
                description: lastCachedEntry.description,
                temperature: lastCachedEntry.temperature,
                windSpeed: lastCachedEntry.windSpeed,
                weatherIconUrl: lastCachedEntry.weatherIconUrl,
              ),
            );
          }
        }
      }

      // Fetch new data
      final WeatherModel weather =
          await _nwsApiService.getCurrentWeather(latitude, longitude);

      // Store in cache
      await _appDatabase.into(_appDatabase.cachedWeather).insert(
            CachedWeatherCompanion.insert(
              locationId: 0, // TODO: This needs to be a real location ID
              description: weather.description,
              temperature: weather.temperature,
              windSpeed: weather.windSpeed,
              weatherIconUrl: weather.weatherIconUrl,
              timestamp: DateTime.now(),
            ),
          );

      return DataSuccess(weather);
    } on DioException catch (e) {
      return DataFailed(e);
    } on Exception catch (e) {
      return DataFailed(e);
    }
  }
}
