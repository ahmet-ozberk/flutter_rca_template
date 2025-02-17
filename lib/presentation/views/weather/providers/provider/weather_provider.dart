import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/di/injection.dart';
import '../notifier/weather_notifier.dart';
import '../state/weather_state.dart';

final weatherProvider = StateNotifierProvider<WeatherNotifier, WeatherState>((ref) {
  final useCase = ref.watch(getWeatherUseCaseProvider);
  return WeatherNotifier(useCase);
});