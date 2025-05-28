import 'package:docs_ui/constants/gradientScaffold/gradient_scaffold.dart';
import 'package:docs_ui/routes/app_pages.dart';
import 'package:docs_ui/screens/login_page.dart';
import 'package:docs_ui/screens/on_boarding.dart';
import 'package:docs_ui/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Docs UI',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.ONBOARDING,
      getPages: AppPages.routes,
    );
  }
}
