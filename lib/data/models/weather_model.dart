import 'package:flutter_riverpod_clean_architecture/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel({
    required super.temperature,
    required super.description,
    required super.humidity,
    required super.windSpeed,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperature: (json['main']['temp'] as num).toDouble(),
      description: json['weather'][0]['description'] as String,
      humidity: json['main']['humidity'] as int,
      windSpeed: (json['wind']['speed'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'main': {
        'temp': temperature,
        'humidity': humidity,
      },
      'weather': [{'description': description}],
      'wind': {'speed': windSpeed},
    };
  }
}