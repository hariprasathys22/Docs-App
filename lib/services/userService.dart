import 'dart:convert';
import 'package:docs_ui/config/api_config.dart';
import 'package:docs_ui/endpoints/user_endpoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserService extends GetxService {
  Future<Map<String, dynamic>> getUserProfile({required String token}) async {
    final url = Uri.parse(UserEndpoints.profile);

    try {
      final response = await http
          .get(url, headers: ApiConfig.getAuthHeaders(token))
          .timeout(ApiConfig.requestTimeout);

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("✅ Profile fetched successfully: $responseData");
        return responseData;
      } else {
        final error = jsonDecode(response.body);
        print(
          "❌ Failed to fetch profile: ${error['message'] ?? 'Unknown error'}",
        );
        throw Exception(error['message'] ?? 'Failed to fetch profile');
      }
    } catch (e) {
      print("Error in getUserProfile: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> updateUserProfile({
    required String token,
    required Map<String, dynamic> profileData,
  }) async {
    final url = Uri.parse(UserEndpoints.updateProfile);

    final body = jsonEncode(profileData);
    print("Updating profile with data: $body");

    try {
      final response = await http
          .put(url, headers: ApiConfig.getAuthHeaders(token), body: body)
          .timeout(ApiConfig.requestTimeout);

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("✅ Profile updated successfully: $responseData");
        return responseData;
      } else {
        final error = jsonDecode(response.body);
        print(
          "❌ Failed to update profile: ${error['message'] ?? 'Unknown error'}",
        );
        throw Exception(error['message'] ?? 'Failed to update profile');
      }
    } catch (e) {
      print("Error in updateUserProfile: $e");
      rethrow;
    }
  }
}
