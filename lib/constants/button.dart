import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String name;
  final bool types;
  final double height;
  final double width;
  const Button({
    super.key,
    required this.name,
    required this.types,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        name,
        style: TextStyle(color: types ? Color(0xff000000) : Color(0xffFFFFFF)),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: types ? Color(0xffFFFFFF) : Color(0xffE500AC),
        padding: EdgeInsets.symmetric(vertical: height, horizontal: width),
      ),
    );
  }
}
