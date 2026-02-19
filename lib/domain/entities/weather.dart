import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String description;
  final double temperature;
  final double windSpeed;
  final String weatherIconUrl;

  const WeatherEntity({
    required this.description,
    required this.temperature,
    required this.windSpeed,
    required this.weatherIconUrl,
  });

  @override
  List<Object?> get props => [
        description,
        temperature,
        windSpeed,
        weatherIconUrl,
      ];
}
