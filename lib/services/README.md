# Service Architecture Documentation

This document explains the service initialization and management structure for the Docs UI application.

## Current Service Structure

### 📂 Services Folder
```
lib/services/
├── authService.dart         # Authentication service
├── service_initializer.dart # Service management
└── userService.dart        # User service (example)
```

## 🔧 Service Initializer

The `ServiceInitializer` class manages the lifecycle of all services in the application.

### Current Implementation

```dart
class ServiceInitializer {
  /// Initialize core services (currently just AuthService)
  static Future<void> initializeCoreServices() async {
    await Get.putAsync(() async => Authservice(), permanent: true);
    print("✅ Core services initialized");
  }
  
  /// For future user-specific services
  static Future<void> initializeUserServices() async {
    // Future expansion
  }
  
  /// Check if services are ready
  static bool get isInitialized => Get.isRegistered<Authservice>();
}
```

## 🚀 Usage in Main.dart

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize core services before app starts
  await ServiceInitializer.initializeCoreServices();
  
  runApp(const MyApp());
}
```

## 📱 Using Services in Widgets

### In Login TextField:
```dart
class _LoginTextFieldState extends State<LoginTextField> {
  final authService = Get.find<Authservice>();
  
  void loginUser() async {
    final result = await authService.loginUser(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    // Handle result...
  }
}
```

### In Register TextField:
```dart
class _RegisterTextFieldState extends State<RegisterTextField> {
  final authService = Get.find<Authservice>();
  
  void registerUser() async {
    await authService.registerUser(
      userName: userNameController.text.trim(),
      email: emailController.text.trim(),
      phoneNumber: phoneNumberController.text.trim(),
      password: passwordController.text.trim(),
    );
    // Handle success...
  }
}
```

## 🔮 Future Expansion

When adding new services, follow this pattern:

### 1. Create the Service
```dart
// lib/services/newService.dart
class NewService extends GetxService {
  @override
  Future<void> onInit() async {
    super.onInit();
    // Initialization logic
  }
}
```

### 2. Add to Service Initializer
```dart
// In service_initializer.dart
static Future<void> initializeCoreServices() async {
  await Get.putAsync(() async => Authservice(), permanent: true);
  await Get.putAsync(() async => NewService(), permanent: true);
  print("✅ Core services initialized");
}
```

### 3. Use in Widgets
```dart
// In your widget
final newService = Get.find<NewService>();
```

## 🎯 Benefits

1. **Centralized Management**: All services initialized in one place
2. **Predictable Lifecycle**: Services ready before app starts
3. **Easy Testing**: Mock services easily
4. **Memory Efficient**: Permanent services only when needed
5. **Future Ready**: Easy to add new services

## 📋 Current Routes

- `/` - Onboarding
- `/register` - Registration page
- `/login` - Login page  
- `/home` - Home page (after login)

## 🔒 Authentication Flow

1. User opens app → Onboarding
2. User navigates to Login/Register
3. On successful login → Navigate to Home
4. AuthService maintains authentication state
5. Home page allows logout → Back to Login

This structure ensures your app scales well as you add more features and services!
