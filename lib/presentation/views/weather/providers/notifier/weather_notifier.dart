import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_clean_architecture/core/failure/failure.dart';
import 'package:flutter_riverpod_clean_architecture/domain/usecases/get_weather_usecase.dart';
import 'package:flutter_riverpod_clean_architecture/presentation/views/weather/providers/state/weather_state.dart';


class WeatherNotifier extends StateNotifier<WeatherState> {
  final GetWeatherUseCase _getWeatherUseCase;

  WeatherNotifier(this._getWeatherUseCase) : super(const WeatherState());

  Future<void> getWeather(String city) async {
    state = state.copyWith(
      status: WeatherStatus.loading,
      city: city,
    );

    try {
      final weather = await _getWeatherUseCase(city);
      state = state.copyWith(
        status: WeatherStatus.success,
        weather: weather,
        failure: null,
      );
    } on Failure catch (e) {
      state = state.copyWith(
        status: WeatherStatus.error,
        failure: e,
      );
    }
  }
}