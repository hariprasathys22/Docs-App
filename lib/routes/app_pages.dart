import 'package:docs_ui/constants/gradientScaffold/gradient_scaffold.dart';
import 'package:docs_ui/screens/home_page.dart';
import 'package:docs_ui/screens/login_page.dart';
import 'package:docs_ui/screens/messages_page.dart';
import 'package:docs_ui/screens/on_boarding.dart';
import 'package:docs_ui/screens/profile_page.dart';
import 'package:docs_ui/screens/register_page.dart';
import 'package:docs_ui/screens/saved_page.dart';
import 'package:docs_ui/screens/voice_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const GradientScaffold(child: OnBoarding()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => GradientScaffold(child: RegisterPage()),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => GradientScaffold(child: LoginPage()),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: Routes.HOME,
      page: () => GradientScaffold(child: HomePage()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: Routes.MESSAGES,
      page: () => GradientScaffold(child: MessagesPage()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: Routes.VOICE,
      page: () => GradientScaffold(child: VoicePage()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 350),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: Routes.SAVED,
      page: () => GradientScaffold(child: SavedPage()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => GradientScaffold(child: ProfilePage()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 350),
      curve: Curves.easeIn,
    ),
  ];
}
