import 'package:docs_ui/constants/gradientScaffold/gradient_scaffold.dart';
import 'package:docs_ui/screens/login_page.dart';
import 'package:docs_ui/screens/on_boarding.dart';
import 'package:docs_ui/screens/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Docs UI',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case '/register':
            page = const RegisterPage();
            break;
          case '/login':
            page = const LoginPage();
            break;

          case '/':
          default:
            page = const OnBoarding();
        }
        return MaterialPageRoute(
          builder: (_) => GradientScaffold(child: page),
          settings: settings,
        );
      },
    );
  }
}
