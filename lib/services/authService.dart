import 'dart:convert';

import 'package:docs_ui/config/api_config.dart';
import 'package:docs_ui/endpoints/auth_endpoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Authservice extends GetxService {
  Future<void> registerUser({
    required String userName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    final url = Uri.parse(AuthEndpoints.register);

    // Convert phone number to integer if it's all digits
    int? phoneNumberInt;
    try {
      phoneNumberInt = int.parse(phoneNumber);
    } catch (e) {
      throw Exception('Phone number must contain only digits');
    }
    final body = jsonEncode({
      'username': userName,
      'email': email,
      'mobile': phoneNumberInt, // Backend expects 'mobile' field
      'password': password,
    });

    print("Request body: $body");

    try {
      final response = await http
          .post(url, headers: ApiConfig.defaultHeaders, body: body)
          .timeout(ApiConfig.requestTimeout);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        print("✅ User registered successfully: $responseData");
      } else {
        final error = jsonDecode(response.body);
        print("❌ Registration Failed: ${error['message'] ?? 'Unknown error'}");
        throw Exception(error['message'] ?? 'Registration failed');
      }
    } catch (e) {
      print("Error in registerUser: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(AuthEndpoints.login);

    print("Sending login data:");
    print("email: '$email'");
    print("password length: ${password.length}");

    final body = jsonEncode({'email': email, 'password': password});

    print("Request body: $body");

    try {
      final response = await http
          .post(url, headers: ApiConfig.defaultHeaders, body: body)
          .timeout(ApiConfig.requestTimeout);

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("✅ User logged in successfully: $responseData");
        return responseData;
      } else {
        final error = jsonDecode(response.body);
        print("❌ Login Failed: ${error['message'] ?? 'Unknown error'}");
        throw Exception(error['message'] ?? 'Login failed');
      }
    } catch (e) {
      print("Error in loginUser: $e");
      rethrow;
    }
  }

  Future<void> logoutUser({required String token}) async {
    final url = Uri.parse(AuthEndpoints.logout);

    try {
      final response = await http
          .post(url, headers: ApiConfig.getAuthHeaders(token))
          .timeout(ApiConfig.requestTimeout);

      if (response.statusCode == 200) {
        print("✅ User logged out successfully");
      } else {
        final error = jsonDecode(response.body);
        throw Exception(error['message'] ?? 'Logout failed');
      }
    } catch (e) {
      print("Error in logoutUser: $e");
      rethrow;
    }
  }
}
