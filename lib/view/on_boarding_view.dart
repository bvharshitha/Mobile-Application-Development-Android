import 'package:flutter/material.dart';
import 'package:gambolspark/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:gambolspark/constants/app_theme.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/controller/on_boarding_ctrl.dart';
import 'package:gambolspark/services/shared_pref.dart';
import 'package:gambolspark/widgets/button_widget.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  void initState() {
    super.initState();
    MySharedPreferences.instance.setBooleanValue("firstTimeOpen", true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: pAll12,
      child: GetBuilder<OnBoardingController>(
        init: OnBoardingController(),
        initState: (_) {},
        builder: (_) {
          return Column(
              //mainAxisAlignment:MainAxisAlignment.center,
              //crossAxisAlignment:CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: PageView.builder(
                  onPageChanged: _.selectedPageIndex,
                  itemCount: _.onBoadingList.length,
                  itemBuilder: (context, index) {
                    var data = _.onBoadingList[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //*IMAGE
                        Expanded(flex: 2, child: Lottie.asset(data.imageURL)),
                        vSpace20,
                        //*TITLE AND DESCRIPTION
                        Expanded(
                          child: Column(
                            children: [
                              Text(data.title, style: AppTheme.tsHeading25),
                              vSpace10,
                              Text(
                                data.subtitle,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: darkGreyColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                )),
                //*INDICATORS
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment:CrossAxisAlignment.center,
                    children: List.generate(
                      _.onBoadingList.length,
                      (index) => Obx(() {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.all(s2),
                          width: _.selectedPageIndex.value == index ? s20 : s10,
                          height: s10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(s10),
                            border: _.selectedPageIndex.value != index
                                ? Border.all(color: primaryColor, width: 1.5)
                                : Border.all(color: Colors.transparent),
                            color: _.selectedPageIndex.value == index
                                ? primaryColor
                                : Colors.white,
                          ),
                        );
                      }),
                    )),
                vSpace10,
                elevatedButton("Get Started",
                     onTap: () => Get.offAllNamed(Routes.loginView)
                  
              )
              ]);
        },
      ),
    )));
  }
}
