import 'package:docs_ui/constants/TextBox/text_box_field.dart';
import 'package:docs_ui/constants/button/button.dart';
import 'package:docs_ui/services/authService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({super.key});

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final authService = Get.find<Authservice>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void loginUser() async {
    if (_formKey.currentState!.validate()) {
      if (emailController.text.trim().isEmpty ||
          passwordController.text.trim().isEmpty) {
        Get.snackbar(
          "Error",
          "All fields are required",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      try {
        // Show loading indicator
        Get.dialog(
          Center(child: CircularProgressIndicator()),
          barrierDismissible: false,
        );

        final result = await authService.loginUser(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        // Close loading dialog
        Get.back();

        // Check if login was successful
        if (result['token'] != null) {
          Get.snackbar(
            "Login",
            "Login successful!",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          // Navigate to home page
          Get.offAllNamed('/home');
        } else {
          Get.snackbar(
            "Login",
            "Login failed",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } catch (e) {
        // Close loading dialog if open
        if (Get.isDialogOpen ?? false) {
          Get.back();
        }

        Get.snackbar(
          "Login",
          "Login failed: $e",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextBoxField(
            label: "Email",
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Enter your email";
              }
              if (!GetUtils.isEmail(value.trim())) {
                return "Enter a valid email format";
              }
              return null;
            },
          ),
          SizedBox(height: 15),
          TextBoxField(
            label: "Password",
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter Password";
              }
              if (value.length < 6) {
                return "Password must be at least 6 characters";
              }
              return null;
            },
            obscureText: true,
          ),
          SizedBox(height: 40),
          Button(
            name: 'Sign in',
            types: false,
            height: 50,
            width: screenWidth,
            onTap: loginUser,
          ),
        ],
      ),
    );
  }
}
