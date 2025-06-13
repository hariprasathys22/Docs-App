import 'package:docs_ui/constants/TextBox/text_box_field.dart';
import 'package:docs_ui/constants/button/button.dart';
import 'package:docs_ui/services/authService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterTextField extends StatefulWidget {
  const RegisterTextField({super.key});

  @override
  State<RegisterTextField> createState() => _RegisterTextFieldState();
}

class _RegisterTextFieldState extends State<RegisterTextField> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final authService = Get.find<Authservice>();

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  void registerUser() async {
    if (_formKey.currentState!.validate()) {
      // Check if passwords match
      if (passwordController.text != confirmPasswordController.text) {
        Get.snackbar(
          "Password",
          "Passwords do not match",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      // Additional validation to ensure all fields have content
      if (userNameController.text.trim().isEmpty ||
          emailController.text.trim().isEmpty ||
          phoneNumberController.text.trim().isEmpty ||
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

        await authService.registerUser(
          userName: userNameController.text.trim(),
          email: emailController.text.trim(),
          phoneNumber: phoneNumberController.text.trim(),
          password: passwordController.text.trim(),
        );

        // Close loading dialog
        Get.back();

        Get.snackbar(
          "Register",
          "User registered successfully",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Navigate to login page after successful registration
        Get.offNamed('/login');
      } catch (e) {
        // Close loading dialog if open
        if (Get.isDialogOpen ?? false) {
          Get.back();
        }

        Get.snackbar(
          "Register",
          "Registration failed: $e",
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
            label: "User name",
            controller: userNameController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Enter User name";
              }
              if (value.trim().length < 3) {
                return "Username must be at least 3 characters";
              }
              return null;
            },
          ),
          SizedBox(height: 15),
          TextBoxField(
            label: "Email",
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Enter valid email";
              }
              if (!GetUtils.isEmail(value.trim())) {
                return "Enter a valid email format";
              }
              return null;
            },
          ),
          SizedBox(height: 15),
          TextBoxField(
            label: "Phone Number",
            controller: phoneNumberController,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Enter Phone Number";
              }
              if (value.trim().length < 10) {
                return "Enter a valid phone number";
              }
              // Check if phone number contains only digits
              if (!RegExp(r'^\d+$').hasMatch(value.trim())) {
                return "Phone number must contain only digits";
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
          SizedBox(height: 15),
          TextBoxField(
            label: "Confirm Password",
            controller: confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Confirm Password";
              }
              if (value != passwordController.text) {
                return "Passwords do not match";
              }
              return null;
            },
            obscureText: true,
          ),
          SizedBox(height: 40),
          Button(
            name: 'Register',
            types: false,
            height: 40,
            width: screenWidth,
            onTap: registerUser,
          ),
        ],
      ),
    );
  }
}
