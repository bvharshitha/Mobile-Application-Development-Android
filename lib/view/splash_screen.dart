import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gambolspark/constants/assets_url.dart';
import 'package:gambolspark/routes/app_pages.dart';
import 'package:gambolspark/services/shared_pref.dart';

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
      //  backgroundColor: primaryColor,
      body: Center(
        child: Image.asset(logoImg, width: 350.w),
      ),
    );
  }

  Future<Timer> loadSplashScreen() async {
    return Timer(const Duration(seconds: 3), onDoneLoadind);
  }

  onDoneLoadind() async {
    /*  isFirstTimeOpen
        ? Get.offAllNamed(Routes.landing)
        : Get.offAllNamed(Routes.onboardingView);*/
    Get.offAllNamed(Routes.onboardingView);
  }
}
