import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gambolspark/constants/app_theme.dart';
import 'package:gambolspark/constants/assets_url.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/routes/app_pages.dart';
import 'package:gambolspark/services/shared_pref.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    loadSplashScreen();
    myAppState();
  }

  bool isFirstTimeOpen = false;

  myAppState() {
    MySharedPreferences.instance
        .getBooleanValue("firstTimeOpen")
        .then((value) => setState(() {
              print("firstTimeOpen $isFirstTimeOpen");
              isFirstTimeOpen = value;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: 350.w, height: 350.w, child: Image.asset(logoImg)),
          vSpace20,
          Text(
            "Gambol Spark",
            style: TextStyle(
              color: primaryColor,
              fontFamily: proxima,
              fontSize: fs30,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      )),
    );
  }

  Future<Timer> loadSplashScreen() async {
    return Timer(const Duration(seconds: 3), onDoneLoadind);
  }

  onDoneLoadind() async {
    isFirstTimeOpen
        ? Get.offAllNamed(Routes.landing)
        : Get.offAllNamed(Routes.onboardingView);
    Get.offAllNamed(Routes.onboardingView);
  }
}
