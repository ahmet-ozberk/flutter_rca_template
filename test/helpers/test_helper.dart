import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

/// Test utilities and mock setup for unit tests
class TestHelper {
  /// Creates a ProviderContainer for testing Riverpod providers
  static ProviderContainer createContainer({
    List<Override> overrides = const [],
  }) {
    final container = ProviderContainer(
      overrides: overrides,
      observers: [],
    );

    addTearDown(container.dispose);

    return container;
  }

  /// Creates a mock Dio client for testing API calls
  static Dio createMockDio() {
    final dio = Dio();
    dio.options.baseUrl = 'https://api.example.com'; // Replace with your API base URL
    return dio;
  }
}