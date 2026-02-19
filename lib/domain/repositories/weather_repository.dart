import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<DataState<WeatherEntity>> getCurrentWeather(
      double latitude, double longitude);
}
