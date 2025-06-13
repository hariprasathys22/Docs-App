# Configuration Documentation

This folder contains all the API and environment configuration for the application.

## Files

### `api_config.dart`
Contains base API configuration, headers, and timeout settings.

**Usage:**
```dart
import 'package:docs_ui/config/api_config.dart';

// Get base URL
final baseUrl = ApiConfig.baseUrl;

// Use headers
final headers = ApiConfig.defaultHeaders;
final authHeaders = ApiConfig.getAuthHeaders(token);

// Use timeout
.timeout(ApiConfig.requestTimeout)
```

### `auth_endpoints.dart`
Contains all authentication-related API endpoints.

**Usage:**
```dart
import 'package:docs_ui/config/auth_endpoints.dart';

// Use auth endpoints
final url = Uri.parse(AuthEndpoints.register);
final loginUrl = Uri.parse(AuthEndpoints.login);
```

### `user_endpoints.dart`
Contains all user-related API endpoints.

**Usage:**
```dart
import 'package:docs_ui/config/user_endpoints.dart';

// Use user endpoints
final url = Uri.parse(UserEndpoints.profile);
final updateUrl = Uri.parse(UserEndpoints.updateProfile);
```

### `environment_config.dart`
Manages different environment configurations (development, staging, production).

**Usage:**
```dart
import 'package:docs_ui/config/environment_config.dart';

// Check current environment
if (EnvironmentConfig.isDebugMode) {
  print("Running in debug mode");
}

// Get base URL for current environment
final baseUrl = EnvironmentConfig.baseUrl;
```

### `config.dart`
Index file that exports all configuration files for easy importing.

**Usage:**
```dart
import 'package:docs_ui/config/config.dart';

// Now you can use ApiConfig, AuthEndpoints, UserEndpoints, and EnvironmentConfig
```

## Changing Environments

To switch environments, modify the `currentEnvironment` in `environment_config.dart`:

```dart
static const Environment currentEnvironment = Environment.production;
```

## Available Endpoints

- **Auth Endpoints (`AuthEndpoints`):**
  - `AuthEndpoints.register`
  - `AuthEndpoints.login`
  - `AuthEndpoints.logout`
  - `AuthEndpoints.refreshToken`
  - `AuthEndpoints.forgotPassword`
  - `AuthEndpoints.resetPassword`
  - `AuthEndpoints.verifyEmail`
  - `AuthEndpoints.resendVerification`

- **User Endpoints (`UserEndpoints`):**
  - `UserEndpoints.profile`
  - `UserEndpoints.updateProfile`
  - `UserEndpoints.deleteProfile`
  - `UserEndpoints.changePassword`
  - `UserEndpoints.getUserById`
  - `UserEndpoints.getAllUsers`
  - `UserEndpoints.searchUsers`
  - `UserEndpoints.preferences`
  - `UserEndpoints.updatePreferences`
  - `UserEndpoints.uploadAvatar`
  - `UserEndpoints.deleteAvatar`

## Example Service Implementation

```dart
import 'package:docs_ui/config/api_config.dart';
import 'package:docs_ui/config/auth_endpoints.dart';

class AuthService extends GetxService {
  Future<void> login() async {
    final url = Uri.parse(AuthEndpoints.login);
    
    final response = await http.post(
      url,
      headers: ApiConfig.defaultHeaders,
      body: jsonEncode(data),
    ).timeout(ApiConfig.requestTimeout);
    
    // Handle response...
  }
}
```
