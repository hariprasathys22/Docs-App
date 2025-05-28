import 'package:docs_ui/constants/gradientScaffold/gradient_scaffold.dart';
import 'package:docs_ui/screens/login_page.dart';
import 'package:docs_ui/screens/on_boarding.dart';
import 'package:docs_ui/screens/register_page.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const GradientScaffold(child: OnBoarding()),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => GradientScaffold(child: RegisterPage()),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => GradientScaffold(child: LoginPage()),
    ),
  ];
}
