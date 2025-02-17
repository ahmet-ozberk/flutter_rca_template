import 'package:flutter_riverpod_clean_architecture/domain/entities/weather_entity.dart';
import 'package:flutter_riverpod_clean_architecture/domain/repositories/weather_repository.dart';

class GetWeatherUseCase {
  final WeatherRepository repository;

  GetWeatherUseCase(this.repository);

  Future<WeatherEntity> call(String city) async {
    return await repository.getWeather(city);
  }
}