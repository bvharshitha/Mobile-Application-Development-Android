import 'package:get/get.dart';
import 'package:gambolspark/constants/assets_url.dart';
import 'package:gambolspark/model/on_boarding_model.dart';

class OnBoardingController extends GetxController {
  RxInt selectedPageIndex = 0.obs;

  // setPageIndex(int index) {
  //   selectedPageIndex = index;
  //   update();
  // }

  List<OnBoardingModel> onBoadingList = [
    OnBoardingModel(
      title: "Sports zone",
      subtitle:
          "The main aim is to provide all aspects of sports under one roof",
      imageURL: obImg1,
    ),
    OnBoardingModel(
      title: "Sport Locations",
      subtitle:
          "The users can find the accurate locations of sports venues within particular radius",
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
            "This provides buying of the sports accessories in online and payment gateway is provided",
        imageURL: obImg4),
    /*   OnBoardingModel(
        title: "Yoga",
        subtitle: "It is good for health and mind",
        imageURL: obImg4),*/
  ];
}
