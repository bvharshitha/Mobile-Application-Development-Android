import 'package:get/get.dart';
import 'package:gambolspark/controller/on_boarding_ctrl.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OnBoardingController>(OnBoardingController());
  }
}
