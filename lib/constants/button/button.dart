import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String name;
  final bool types;
  final double height;
  final double width;
  final Function()? onTap;

  const Button({
    super.key,
    required this.name,
    required this.types,
    required this.height,
    required this.width,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            types ? const Color(0xffFFFFFF) : const Color(0xffE500AC),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          ),
        ),
        child: Text(
          name,
          style: TextStyle(
            color: types ? Color(0xff000000) : Color(0xffFFFFFF),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
