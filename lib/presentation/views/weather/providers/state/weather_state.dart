import 'package:flutter_riverpod_clean_architecture/core/failure/failure.dart';
import 'package:flutter_riverpod_clean_architecture/domain/entities/weather_entity.dart';

enum WeatherStatus {
  initial,
  loading,
  success,
  error
}

class WeatherState {
  final WeatherStatus status;
  final WeatherEntity? weather;
  final Failure? failure;
  final String city;

  const WeatherState({
    this.status = WeatherStatus.initial,
    this.weather,
    this.failure,
    this.city = '',
  });

  WeatherState copyWith({
    WeatherStatus? status,
    WeatherEntity? weather,
    Failure? failure,
    String? city,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
      failure: failure ?? this.failure,
      city: city ?? this.city,
    );
  }
}