import 'package:gambolspark/binding/reg_binding.dart';
import 'package:gambolspark/controller/reg_controller.dart';
import 'package:gambolspark/view/auth_view/login_view.dart';
import 'package:get/get.dart';
import 'package:gambolspark/binding/onboarding_binding.dart';
import 'package:gambolspark/view/on_boarding_view.dart';
import 'package:gambolspark/view/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initialRoute = Routes.splashView;
  static final routes = [
    GetPage(
      name: initialRoute,
      page: () => const SplashView(),
    ),
    GetPage(
      name: Routes.onboardingView,
      page: () => const OnBoardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: Routes.loginView,
      page: () => const LoginView(),
      binding: RegBinding(),
    ),
  ];

}
