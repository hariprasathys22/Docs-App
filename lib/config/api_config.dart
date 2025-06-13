import 'environment_config.dart';

class ApiConfig {
  // Base API URL - dynamically set based on environment
  static String get baseUrl => EnvironmentConfig.baseUrl;

  // Request timeout configuration
  static Duration get requestTimeout => EnvironmentConfig.requestTimeout;

  // Headers
  static Map<String, String> get defaultHeaders => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Map<String, String> getAuthHeaders(String token) => {
    ...defaultHeaders,
    'Authorization': 'Bearer $token',
  };
}
