import 'package:flutter_riverpod_clean_architecture/data/datasource/weather_remote_data_source.dart';
import 'package:flutter_riverpod_clean_architecture/domain/entities/weather_entity.dart';
import 'package:flutter_riverpod_clean_architecture/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<WeatherEntity> getWeather(String city) async {
    try {
      final weatherModel = await remoteDataSource.getWeather(city);
      return weatherModel;
    } catch (e) {
      rethrow;
    }
  }
}