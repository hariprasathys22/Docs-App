import 'package:docs_ui/constants/roundedLogo/rounded_logo.dart';
import 'package:docs_ui/widgets/NavigationWrapper/navigation_wrapper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const NavigationWrapper(
      initialIndex: 0, // Home tab index
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedLogo(),
            SizedBox(height: 10),
            Text(
              "How may i assist you today?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
