// lib/core/di/injection.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_clean_architecture/core/network/network_manager.dart';
import 'package:flutter_riverpod_clean_architecture/data/datasource/weather_remote_data_source.dart';
import 'package:flutter_riverpod_clean_architecture/data/repositories/weather_repository_impl.dart';
import 'package:flutter_riverpod_clean_architecture/domain/repositories/weather_repository.dart';
import 'package:flutter_riverpod_clean_architecture/domain/usecases/get_weather_usecase.dart';

final networkManagerProvider = Provider<NetworkManager>((ref) {
  return NetworkManager();
});

final weatherRemoteDataSourceProvider = Provider<WeatherRemoteDataSource>((ref) {
  final networkManager = ref.watch(networkManagerProvider);
  return WeatherRemoteDataSourceImpl(networkManager: networkManager);
});

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  final remoteDataSource = ref.watch(weatherRemoteDataSourceProvider);
  return WeatherRepositoryImpl(remoteDataSource: remoteDataSource);
});

final getWeatherUseCaseProvider = Provider<GetWeatherUseCase>((ref) {
  final repository = ref.watch(weatherRepositoryProvider);
  return GetWeatherUseCase(repository);
});