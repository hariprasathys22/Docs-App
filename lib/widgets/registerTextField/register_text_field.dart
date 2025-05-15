import 'package:docs_ui/constants/TextBox/text_box_field.dart';
import 'package:docs_ui/constants/button/button.dart';
import 'package:flutter/material.dart';

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

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Form(
      child: Column(
        children: [
          TextBoxField(
            label: "User name",
            controller: userNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter User name";
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
              if (value == null || value.isEmpty) {
                return "Enter valid email";
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
              return null;
            },
            obscureText: true,
          ),
          SizedBox(height: 15),
          TextBoxField(
            label: "Confirm Password",
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter Password";
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
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
