import 'package:dio/dio.dart';
import 'package:flutter_riverpod_clean_architecture/core/failure/failure.dart';
import 'package:flutter_riverpod_clean_architecture/data/models/weather_model.dart';
import 'package:flutter_riverpod_clean_architecture/core/network/network_manager.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather(String city);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final NetworkManager networkManager;

  WeatherRemoteDataSourceImpl({required this.networkManager});

  @override
  Future<WeatherModel> getWeather(String city) async {
    try {
      final response = await networkManager.get(
        'weather',
        queryParameters: {'q': city},
      );

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw ServerFailure(
          message: 'Failed to fetch weather data',
          code: response.statusCode.toString(),
        );
      }
    } on DioException catch (e) {
      throw NetworkFailure(
        message: e.message ?? 'Network error occurred',
        code: e.response?.statusCode.toString(),
      );
    } catch (e) {
      throw ServerFailure(
        message: e.toString(),
        code: '500',
      );
    }
  }
}