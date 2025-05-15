import 'package:docs_ui/constants/button/button.dart';
import 'package:docs_ui/constants/roundedLogo/rounded_logo.dart';
import 'package:docs_ui/widgets/onBoarding/on_boarding_card.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: screenHeight - 80),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.08),
              const RoundedLogo(),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Neuralyfe",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Your smart AI companion, ready to assist with answers, advice and inspiration, keeping you informed and engaged anytime, anywhere you go.",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              const OnBoardingCard(),

              /// ✅ Replacing Spacer with a dynamic spacer
              const Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                    name: "Login",
                    types: true,
                    height: 40,
                    width: screenWidth / 3,
                  ),
                  Button(
                    name: "Register",
                    types: false,
                    height: 40,
                    width: screenWidth / 3,
                    onTap: () => Navigator.pushNamed(context, '/register'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
