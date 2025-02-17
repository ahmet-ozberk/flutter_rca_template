import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_clean_architecture/presentation/views/weather/providers/provider/weather_provider.dart';
import 'package:flutter_riverpod_clean_architecture/presentation/views/weather/providers/state/weather_state.dart';

class WeatherView extends ConsumerWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(weatherProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter city name',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  ref.read(weatherProvider.notifier).getWeather(value);
                }
              },
            ),
            const SizedBox(height: 20),
            _buildWeatherContent(state),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherContent(WeatherState state) {
    switch (state.status) {
      case WeatherStatus.initial:
        return const Center(
          child: Text('Enter a city name to get weather information'),
        );
      case WeatherStatus.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case WeatherStatus.success:
        final weather = state.weather!;
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Weather in ${state.city}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text('Temperature: ${weather.temperature}°C'),
                Text('Description: ${weather.description}'),
                Text('Humidity: ${weather.humidity}%'),
                Text('Wind Speed: ${weather.windSpeed} m/s'),
              ],
            ),
          ),
        );
      case WeatherStatus.error:
        return Center(
          child: Text(
            'Error: ${state.failure?.message}',
            style: const TextStyle(color: Colors.red),
          ),
        );
    }
  }
}