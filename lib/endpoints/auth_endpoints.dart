import '../config/api_config.dart';

class AuthEndpoints {
  // Auth base URL
  static String get authBaseUrl => "${ApiConfig.baseUrl}/api/auth";

  // Auth endpoints
  static String get register => "$authBaseUrl/register";
  static String get login => "$authBaseUrl/login";
  static String get logout => "$authBaseUrl/logout";
  static String get refreshToken => "$authBaseUrl/refresh";
  static String get forgotPassword => "$authBaseUrl/forgot-password";
  static String get resetPassword => "$authBaseUrl/reset-password";
  static String get verifyEmail => "$authBaseUrl/verify-email";
  static String get resendVerification => "$authBaseUrl/resend-verification";
}
