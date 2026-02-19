import 'package:nimbus/domain/entities/weather.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel({
    required String description,
    required double temperature,
    required double windSpeed,
    required String weatherIconUrl,
  }) : super(
          description: description,
          temperature: temperature,
          windSpeed: windSpeed,
          weatherIconUrl: weatherIconUrl,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      description: json['shortForecast'],
      temperature: json['temperature'].toDouble(),
      windSpeed: double.parse(json['windSpeed'].replaceAll(RegExp(r'[^0-9.]'), '')),
      weatherIconUrl: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'temperature': temperature,
      'windSpeed': windSpeed,
      'weatherIconUrl': weatherIconUrl,
    };
  }

  factory WeatherModel.fromWeatherEntity(WeatherEntity entity) {
    return WeatherModel(
      description: entity.description,
      temperature: entity.temperature,
      windSpeed: entity.windSpeed,
      weatherIconUrl: entity.weatherIconUrl,
    );
  }
}
