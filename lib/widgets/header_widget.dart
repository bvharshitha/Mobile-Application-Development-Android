import 'package:flutter/material.dart';
import 'package:gambolspark/constants/app_theme.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth,
      padding: pAll10,
      color: darkGreyColor,
      child: Center(
          child: Text(title.toUpperCase(),
              textAlign: TextAlign.center,
              style:
                  AppTheme.tsBold.copyWith(color: whiteColor, fontSize: fs16))),
    );
  }
}
