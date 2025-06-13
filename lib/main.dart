import 'package:docs_ui/routes/app_pages.dart';
import 'package:docs_ui/services/service_initializer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize core services (currently just AuthService)
  await ServiceInitializer.initializeCoreServices();

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
