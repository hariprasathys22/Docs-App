import 'package:docs_ui/constants/button.dart';
import 'package:docs_ui/widgets/onBoarding/on_boarding_card.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffFFFFFF),
              Color.fromARGB(255, 241, 216, 237),
              Color.fromARGB(255, 251, 242, 255),
              Color.fromARGB(255, 255, 255, 226),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Container(
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
                      child: const Icon(
                        Icons.cabin,
                        color: Color(0xffE500AC),
                        size: 40,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Smart AI Companion for Anytime Assistance",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
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

                /// ✅ Repeating vertical containers with text inside properly
                OnBoardingCard(),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(name: "Login", types: true, height: 10, width: 60),
                    Button(
                      name: "Register",
                      types: false,
                      height: 10,
                      width: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
