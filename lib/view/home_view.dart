import 'dart:io';
import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gambolspark/constants/app_theme.dart';
import 'package:gambolspark/constants/assets_url.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/controller/home_controller.dart';
import 'package:gambolspark/view/MybookingView.dart';
import 'package:gambolspark/view/shop_post_view.dart';
import 'package:gambolspark/widgets/app_card_widget.dart';
import 'package:gambolspark/widgets/common_widget/drawer_widget.dart';
import 'package:gambolspark/widgets/dialog_widget.dart';
import 'package:gambolspark/widgets/image_icon_widget.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> homeImgList = [homeImg1, homeImg2, homeImg3, homeImg4];
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(logoImg, width: 20.w),
            hSpace5,
            Text(
              "Gambol Spark",
              style: TextStyle(
                color: Colors.white,
                fontFamily: proxima,
              ),
              textDirection: TextDirection.ltr,
              overflow: TextOverflow.ellipsis,
            )
            /*Text("Gambol Spark",
                style: AppTheme.tsRegular, overflow: TextOverflow.ellipsis)*/
          ],
        ),
        centerTitle: true,
        actions: [
          hSpace20,
          ImageIconWidget(
            image: logoutImg,
            onPressed: () async {
              showMyDialog(
                  title: "Logout",
                  message: "Are you sure ?",
                  onCancelText: "No",
                  onConfirmText: "Yes",
                  /*uid:dCg2TfR5oeTqcpx3gnTma9nwLz02*/
                  onCancel: () => Get.back(),
                  onConfirm: () => regCtrl.signOut());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
            width: getWidth,
            child: GetBuilder<HomeController>(
              init: HomeController(),
              initState: (_) {},
              builder: (_) {
                return Column(
                  children: [
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 180.w,
                        viewportFraction: 0.8,
                        initialPage: _.getHomeImgIndex,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          _.setHomeImgIndex(index);
                        },
                      ),
                      itemCount: homeImgList.length,
                      itemBuilder: (BuildContext context, int index,
                              int pageViewIndex) =>
                          ClipRRect(
                        borderRadius: BorderRadius.circular(s5),
                        child: SizedBox(
                          width: getWidth,
                          child:
                              Image.asset(homeImgList[index], fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    vSpace10,
                    GetBuilder<HomeController>(
                      init: HomeController(),
                      initState: (_) {},
                      builder: (_) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              homeImgList.length,
                              (index) => AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: EdgeInsets.all(s2),
                                    width:
                                        _.getHomeImgIndex == index ? s20 : s10,
                                    height: s10,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(s10),
                                      border: _.getHomeImgIndex != index
                                          ? Border.all(
                                              color: primaryColor, width: 1.5)
                                          : Border.all(
                                              color: Colors.transparent),
                                      color: _.getHomeImgIndex == index
                                          ? primaryColor
                                          : Colors.white,
                                    ),
                                  )),
                        );
                      },
                    ),
                    vSpace10,
                    Text("Top Categories ", style: AppTheme.tsBold),
                    vSpace10,
                    Container(
                      color: whiteColor,
                      height: getHeight / 2,
                      child: ListView(
                        children: [
                          Wrap(
                            alignment: WrapAlignment.center,
                            runSpacing: s5,
                            spacing: s5,
                            children: [
                              AppCardWidget(
                                  onPressed: () {
                                    displayTextInputDialog(
                                        context,
                                        'Select Sports Ground',
                                        homeCtrl.groundList);
                                  },
                                  /*print("Sports Zone");
                                    Get.to(() =>
                                        ShopPostView(title: "Indoor sports2"));*/

                                  title: "Sports Zone",
                                  image: artImg),
                              AppCardWidget(
                                  onPressed: () {
                                    displayTextInputDialog(
                                        context,
                                        'Select Shop List',
                                        homeCtrl.ecommerceList);

                                    /*print("Sports Accessories");*/
                                  },
                                  title: "Sports Accessories",
                                  image: singingImg),
                              /*AppCardWidget(
                                  onPressed: () {
                                    print("Locations");
                                  },
                                  title: "Locations",
                                  image: dancingImg),
                              AppCardWidget(
                                  onPressed: () {
                                    print("Sports Accessories");
                                  },
                                  title: "Sports Accessories",
                                  image: singingImg),*/
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}
