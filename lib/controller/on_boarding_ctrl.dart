import 'package:gambolspark/constants/assets_url.dart';
import 'package:gambolspark/model/on_boarding_model.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  RxInt selectedPageIndex = 0.obs;

  List<OnBoardingModel> onBoadingList = [
    OnBoardingModel(
      title: "Sports Zone",
      subtitle:
          "The main aim is to provide all aspects of sports under one roof",
      imageURL: obImg1,
    ),
    OnBoardingModel(
      title: "Play Area",
      subtitle:
          "Users can find the accurate locations of sports venues within particular radius",
      imageURL: obImg2,
    ),
    OnBoardingModel(
        title: "Booking",
        subtitle:
            "This feature enables the customer to reduce the offline booking of slots and provides easier online booking",
        imageURL: obImg3),
    OnBoardingModel(
        title: "E-Commerce",
        subtitle:
            "This provides buying of accessories in online and payment option is integrated",
        imageURL: obImg4),
  ];
}
