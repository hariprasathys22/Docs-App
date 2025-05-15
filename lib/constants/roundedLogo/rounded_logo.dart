import 'package:flutter/material.dart';

class RoundedLogo extends StatelessWidget {
  const RoundedLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 130,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 253, 247, 252),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 100,
          width: 100,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          child: const Icon(Icons.cabin, color: Color(0xffE500AC), size: 40),
        ),
      ),
    );
  }
}
