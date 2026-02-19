import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/domain/entities/weather.dart';
import 'package:nimbus/domain/repositories/weather_repository.dart';
import 'package:nimbus/domain/usecases/usecase.dart';

class GetCurrentWeatherUseCase implements UseCase<WeatherEntity, Map<String, double>> {
  final WeatherRepository _weatherRepository;

  GetCurrentWeatherUseCase(this._weatherRepository);

  @override
  Future<DataState<WeatherEntity>> call(Map<String, double> params) {
    return _weatherRepository.getCurrentWeather(
        params['latitude']!, params['longitude']!);
  }
}
