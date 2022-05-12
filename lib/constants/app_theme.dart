// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gambolspark/constants/assets_url.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';

class AppTheme {
  AppTheme._();

  //* TEXTSTYLE

  static final TextStyle tsLight = TextStyle(
      fontFamily: proxima,
      fontWeight: FontWeight.w300,
      color: greyTextColor,
      fontSize: fs14);
  static final TextStyle tsRegular = TextStyle(
      fontFamily: proxima,
      fontWeight: FontWeight.w400,
      color: blackColor,
      fontSize: fs16);
  static final TextStyle tsHeading16 = TextStyle(
      fontFamily: proxima,
      fontWeight: FontWeight.bold,
      color: blackColor,
      fontSize: fs16);
  static final TextStyle tsHeading30 = TextStyle(
      fontFamily: proxima,
      fontWeight: FontWeight.bold,
      color: blackColor,
      fontSize: fs30);
  static final TextStyle tsHeading25 = TextStyle(
      fontFamily: proxima,
      fontWeight: FontWeight.bold,
      color: blackColor,
      fontSize: fs25);
  static final TextStyle tsBold = TextStyle(
      fontFamily: proxima,
      fontWeight: FontWeight.bold,
      color: blackColor,
      fontSize: fs18);

  static final TextTheme _textTheme = TextTheme(
    headline1: tsBold,
    headline2: tsHeading16,
    headline6: tsRegular,
    bodyText2: tsRegular,
    subtitle1: tsRegular,
    subtitle2: tsLight,
    caption: tsLight,
  );

  // *---APP THEME DATA---
  static final ThemeData appTheme = ThemeData(
    iconTheme: IconThemeData(size: fs25, color: greyColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: whiteColor,
    textTheme: _textTheme,
    primaryColor: primaryColor,
    primarySwatch: Colors.green,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        sizeConstraints: BoxConstraints(minHeight: s50, minWidth: s50)),
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      color: whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(color: blackColor),
    ),
    // ---CARD THEME---
    cardTheme: CardTheme(
        color: cardColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(s5)))),

    // --INPUT TEXTFIELD DECORATION--
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(s5)),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: greyColor.withOpacity(0.5)),
        borderRadius: BorderRadius.all(Radius.circular(s5)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(s5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: greenColor.withOpacity(0.6)),
        borderRadius: BorderRadius.all(Radius.circular(s5)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: redColor),
        borderRadius: BorderRadius.all(Radius.circular(s5)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: redColor),
        borderRadius: BorderRadius.all(Radius.circular(s5)),
      ),
      fillColor: cardColor,
      filled: true,
    ),
  );
}
