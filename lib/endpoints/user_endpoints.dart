import '../config/api_config.dart';

class UserEndpoints {
  // User base URL
  static String get userBaseUrl => "${ApiConfig.baseUrl}/api/user";

  // User profile endpoints
  static String get profile => "$userBaseUrl/profile";
  static String get updateProfile => "$userBaseUrl/update";
  static String get deleteProfile => "$userBaseUrl/delete";
  static String get changePassword => "$userBaseUrl/change-password";

  // User data endpoints
  static String get getUserById => "$userBaseUrl"; // + /{id}
  static String get getAllUsers => "$userBaseUrl/all";
  static String get searchUsers => "$userBaseUrl/search";

  // User preferences endpoints
  static String get preferences => "$userBaseUrl/preferences";
  static String get updatePreferences => "$userBaseUrl/preferences/update";

  // User avatar endpoints
  static String get uploadAvatar => "$userBaseUrl/avatar/upload";
  static String get deleteAvatar => "$userBaseUrl/avatar/delete";
}
