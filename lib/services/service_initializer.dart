import 'package:get/get.dart';
import 'authService.dart';

class ServiceInitializer {
  /// Initialize core services that should be available throughout the app
  static Future<void> initializeCoreServices() async {
    // Authentication Service - Always needed for login/register functionality
    await Get.putAsync(() async => Authservice(), permanent: true);

    print("✅ Core services initialized");
  }

  /// Initialize services when user logs in (for future expansion)
  static Future<void> initializeUserServices() async {
    // Future user-specific services can be added here
    // Example: UserService, NotificationService, etc.

    print("✅ User services ready");
  }

  /// Clean up services when user logs out (for future expansion)
  static void cleanupUserServices() {
    // Future cleanup logic for user-specific services

    print("🧹 User services cleaned up");
  }

  /// Check if core services are initialized
  static bool get isInitialized {
    return Get.isRegistered<Authservice>();
  }
}
