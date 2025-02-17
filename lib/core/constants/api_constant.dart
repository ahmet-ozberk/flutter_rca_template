// lib/core/constants/api_constants.dart
class ApiConstants {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/';
  static const String apiKey = 'YOUR_API_KEY'; // API anahtarınızı buraya ekleyin
  
  static const Duration connectionTimeout = Duration(seconds: 5);
  static const Duration receiveTimeout = Duration(seconds: 3);
}