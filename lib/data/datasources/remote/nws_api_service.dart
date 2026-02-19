import 'package:dio/dio.dart';
import 'package:nimbus/data/models/weather_model.dart';

class NwsApiService {
  final Dio _dio;

  NwsApiService(this._dio);

  Future<WeatherModel> getCurrentWeather(double latitude, double longitude) async {
    try {
      // Step 1: Get gridpoints from /points endpoint
      final pointsResponse = await _dio.get(
        'https://api.weather.gov/points/$latitude,$longitude',
      );

      if (pointsResponse.statusCode != 200) {
        throw Exception('Failed to get NWS gridpoints: ${pointsResponse.statusCode}');
      }

      final String forecastHourlyUrl = pointsResponse.data['properties']['forecastHourly'];

      // Step 2: Get hourly forecast from the forecastHourly URL
      final forecastResponse = await _dio.get(forecastHourlyUrl);

      if (forecastResponse.statusCode != 200) {
        throw Exception('Failed to get NWS forecast: ${forecastResponse.statusCode}');
      }

      final periods = forecastResponse.data['properties']['periods'] as List;
      if (periods.isNotEmpty) {
        final currentPeriod = periods[0]; // Get the current period

        return WeatherModel(
          description: currentPeriod['shortForecast'],
          temperature: currentPeriod['temperature'].toDouble(),
          windSpeed: double.parse(currentPeriod['windSpeed'].replaceAll(RegExp(r'[^0-9.]'), '')), // Extract numbers from "10 mph"
          weatherIconUrl: currentPeriod['icon'],
        );
      } else {
        throw Exception('No forecast periods found.');
      }
    } on DioException catch (e) {
      throw Exception('Failed to connect to NWS service: ${e.message}');
    }
  }
}