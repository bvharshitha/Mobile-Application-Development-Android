import 'package:get/get.dart';
import 'package:gambolspark/controller/reg_controller.dart';

class RegBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RegController>(RegController());
  }
}