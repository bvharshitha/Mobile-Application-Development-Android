import 'package:gambolspark/binding/home_binding.dart';
import 'package:gambolspark/binding/onboarding_binding.dart';
import 'package:gambolspark/binding/product_binding.dart';
import 'package:gambolspark/binding/reg_binding.dart';
import 'package:gambolspark/controller/home_controller.dart';
import 'package:gambolspark/controller/order_controller.dart';
import 'package:gambolspark/controller/product_controller.dart';
import 'package:gambolspark/view/auth_view/loginview.dart';
import 'package:gambolspark/view/home_view.dart';
import 'package:gambolspark/view/landing_view.dart';
import 'package:gambolspark/view/on_boarding_view.dart';
import 'package:gambolspark/view/product_view.dart';
import 'package:gambolspark/view/splash_screen.dart';
import 'package:get/get.dart';

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
      name: Routes.landing,
      page: () => const LandingView(),
      binding: RegBinding(),
    ),
    GetPage(
      name: Routes.loginView,
      page: () => const LoginView(),
    ),
    GetPage(
      name: Routes.homeView,
      page: () => const HomeView(),
      binding: BindingsBuilder(
        () {
          Get.put<HomeController>(HomeController(), permanent: true);
          Get.put<OrderController>(OrderController(), permanent: true);
        },
      ),
    ),
    GetPage(
      name: Routes.productView,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
  ];
}
