import 'package:flutter/material.dart';

class TextBoxField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? icon;
  const TextBoxField({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        cursorColor: Color.fromARGB(255, 163, 163, 163),
        keyboardType: keyboardType,
        validator: validator,
        style: const TextStyle(color: Color.fromARGB(255, 163, 163, 163)),
        decoration: InputDecoration(
          hintText: label,
          labelStyle: const TextStyle(
            color: Color.fromARGB(179, 255, 248, 248),
          ),
          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          prefixIcon: icon != null ? Icon(icon, color: Colors.white70) : null,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
