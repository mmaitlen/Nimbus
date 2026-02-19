import 'package:get_it/get_it.dart';
import 'package:nimbus/data/local/app_database.dart';
import 'package:dio/dio.dart';
import 'package:nimbus/data/datasources/remote/geocoding_api_service.dart';
import 'package:nimbus/data/datasources/remote/nws_api_service.dart';
import 'package:nimbus/data/repositories/location_repository_impl.dart';
import 'package:nimbus/data/repositories/weather_repository_impl.dart';
import 'package:nimbus/data/repositories/settings_repository_impl.dart';
import 'package:nimbus/data/repositories/error_repository_impl.dart'; // New Import
import 'package:nimbus/domain/repositories/location_repository.dart';
import 'package:nimbus/domain/repositories/weather_repository.dart';
import 'package:nimbus/domain/repositories/settings_repository.dart';
import 'package:nimbus/domain/repositories/error_repository.dart'; // New Import
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nimbus/data/local/daos/location_dao.dart';
import 'package:nimbus/data/local/daos/settings_dao.dart';
import 'package:nimbus/data/local/daos/error_dao.dart';
import 'package:nimbus/domain/usecases/add_location.dart';
import 'package:nimbus/domain/usecases/delete_location.dart';
import 'package:nimbus/domain/usecases/get_default_location.dart';
import 'package:nimbus/domain/usecases/get_location_by_zipcode.dart';
import 'package:nimbus/domain/usecases/get_saved_locations.dart';
import 'package:nimbus/domain/usecases/set_default_location.dart';
import 'package:nimbus/domain/usecases/get_current_weather.dart';
import 'package:nimbus/domain/usecases/log_error.dart'; // New Import
import 'package:nimbus/domain/usecases/get_errors.dart'; // New Import
import 'package:nimbus/domain/usecases/clear_errors_older_than.dart'; // New Import
import 'package:nimbus/presentation/blocs/location/location_bloc.dart';
import 'package:nimbus/presentation/blocs/weather/weather_bloc.dart';
import 'package:nimbus/presentation/blocs/error/error_bloc.dart'; // New Import
import 'package:nimbus/domain/usecases/get_temperature_unit.dart'; // New Import
import 'package:nimbus/domain/usecases/get_update_interval.dart'; // New Import
import 'package:nimbus/domain/usecases/get_wind_speed_unit.dart'; // New Import
import 'package:nimbus/domain/usecases/set_temperature_unit.dart'; // New Import
import 'package:nimbus/domain/usecases/set_update_interval.dart'; // New Import
import 'package:nimbus/domain/usecases/set_wind_speed_unit.dart'; // New Import
import 'package:nimbus/presentation/blocs/settings/settings_bloc.dart'; // New Import


final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // Register Dio
  locator.registerLazySingleton<Dio>(() => Dio());

  // Register SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);

  // Register database
  locator.registerSingleton<AppDatabase>(AppDatabase());

  // Register DAOs
  locator.registerLazySingleton<LocationDao>(() => LocationDao(locator()));
  locator.registerLazySingleton<SettingsDao>(() => SettingsDao(locator()));
  locator.registerLazySingleton<ErrorDao>(() => ErrorDao(locator()));

  // Register GeocodingApiService
  locator.registerLazySingleton<GeocodingApiService>(
      () => GeocodingApiService(locator()));

  // Register NwsApiService
  locator.registerLazySingleton<NwsApiService>(
      () => NwsApiService(locator()));

  // Register Repositories
  locator.registerLazySingleton<LocationRepository>(
      () => LocationRepositoryImpl(locator()));
  locator.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(locator(), locator(), locator()));
  locator.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(locator()));
  locator.registerLazySingleton<ErrorRepository>(
      () => ErrorRepositoryImpl(locator())); // New Registration

  // Register Location UseCases
  locator.registerLazySingleton<GetSavedLocationsUseCase>(
      () => GetSavedLocationsUseCase(locator()));
  locator.registerLazySingleton<AddLocationUseCase>(
      () => AddLocationUseCase(locator()));
  locator.registerLazySingleton<DeleteLocationUseCase>(
      () => DeleteLocationUseCase(locator()));
  locator.registerLazySingleton<SetDefaultLocationUseCase>(
      () => SetDefaultLocationUseCase(locator()));
  locator.registerLazySingleton<GetDefaultLocationUseCase>(
      () => GetDefaultLocationUseCase(locator()));
  locator.registerLazySingleton<GetLocationByZipcodeUseCase>(
      () => GetLocationByZipcodeUseCase(locator()));

  // Register Weather UseCases
  locator.registerLazySingleton<GetCurrentWeatherUseCase>(
      () => GetCurrentWeatherUseCase(locator()));

  // Register Error UseCases
  locator.registerLazySingleton<LogErrorUseCase>(
      () => LogErrorUseCase(locator()));
  locator.registerLazySingleton<GetErrorsUseCase>(
      () => GetErrorsUseCase(locator()));
  locator.registerLazySingleton<ClearErrorsOlderThanUseCase>(
      () => ClearErrorsOlderThanUseCase(locator()));

  // Register Settings UseCases
  locator.registerLazySingleton<GetUpdateIntervalUseCase>(
      () => GetUpdateIntervalUseCase(locator()));
  locator.registerLazySingleton<SetUpdateIntervalUseCase>(
      () => SetUpdateIntervalUseCase(locator()));
  locator.registerLazySingleton<GetTemperatureUnitUseCase>(
      () => GetTemperatureUnitUseCase(locator()));
  locator.registerLazySingleton<SetTemperatureUnitUseCase>(
      () => SetTemperatureUnitUseCase(locator()));
  locator.registerLazySingleton<GetWindSpeedUnitUseCase>(
      () => GetWindSpeedUnitUseCase(locator()));
  locator.registerLazySingleton<SetWindSpeedUnitUseCase>(
      () => SetWindSpeedUnitUseCase(locator()));

  // Register BLoCs
  locator.registerFactory<LocationBloc>(
    () => LocationBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory<WeatherBloc>(
    () => WeatherBloc(locator()),
  );
  locator.registerFactory<ErrorBloc>(
    () => ErrorBloc(locator(), locator(), locator()),
  );
  locator.registerFactory<SettingsBloc>(
    () => SettingsBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
}
