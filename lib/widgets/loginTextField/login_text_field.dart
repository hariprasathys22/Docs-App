import 'package:docs_ui/constants/TextBox/text_box_field.dart';
import 'package:docs_ui/constants/button/button.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({super.key});

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Column(children: [
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
          SizedBox(height: 40),
          Button(
            name: 'Sign in',
            types: false,
            height: 50,
            width: screenWidth,
            onTap: () {},
          ),
      ],)
    );
  }
}
