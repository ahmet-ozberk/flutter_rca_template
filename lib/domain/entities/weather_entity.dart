import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final double temperature;
  final String description;
  final int humidity;
  final double windSpeed;

  const WeatherEntity({
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
  });

  @override
  List<Object?> get props => [temperature, description, humidity, windSpeed];
}