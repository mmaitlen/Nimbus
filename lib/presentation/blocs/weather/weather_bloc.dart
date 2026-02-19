import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/domain/entities/weather.dart';
import 'package:nimbus/domain/usecases/get_current_weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;

  WeatherBloc(this._getCurrentWeatherUseCase) : super(WeatherLoading()) {
    on<GetCurrentWeather>(onGetCurrentWeather);
  }

  void onGetCurrentWeather(
      GetCurrentWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    final dataState = await _getCurrentWeatherUseCase(
        {'latitude': event.latitude, 'longitude': event.longitude});

    if (dataState is DataSuccess && dataState.data != null) {
      emit(WeatherLoaded(dataState.data!));
    } else if (dataState is DataFailed) {
      emit(WeatherError(dataState.error.toString()));
    }
  }
}
