enum Environment { development, staging, production }

class EnvironmentConfig {
  static const Environment currentEnvironment = Environment.development;

  static String get baseUrl {
    switch (currentEnvironment) {
      case Environment.development:
        return "http://192.168.56.1:5000";
      case Environment.staging:
        return "https://staging-api.yourapp.com";
      case Environment.production:
        return "https://api.yourapp.com";
    }
  }

  static bool get isDebugMode {
    return currentEnvironment == Environment.development;
  }

  static Duration get requestTimeout {
    switch (currentEnvironment) {
      case Environment.development:
        return const Duration(seconds: 30);
      case Environment.staging:
      case Environment.production:
        return const Duration(seconds: 15);
    }
  }
}
