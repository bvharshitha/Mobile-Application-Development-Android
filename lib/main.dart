import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:gambolspark/routes/app_pages.dart';
import 'package:gambolspark/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context) => GetMaterialApp(
        defaultTransition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 300),
        debugShowCheckedModeBanner: false,
        getPages: AppPages.routes,
        initialRoute: AppPages.initialRoute,
        localizationsDelegates: const [FormBuilderLocalizations.delegate],
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        //  theme: AppTheme.appTheme,
        //  home: SplashView(),
      ),
    );
  }
}
