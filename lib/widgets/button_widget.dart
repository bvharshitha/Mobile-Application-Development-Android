import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gambolspark/constants/app_theme.dart';
import 'package:gambolspark/constants/color_constants.dart';

import '../constants/size_constants.dart';

// Widget iconButton(
//     {required Function() onTap,
//     bool isCircle = false,
//     Color? color,
//     Color? iconColor,
//     double? width,
//     double? height,
//     double? iconSize,
//     required IconData icon}) {
//   return ElevatedButton(
//     onPressed: onTap,
//     child: Icon(icon, color: iconColor ?? blackColor, size: iconSize ?? fs25),
//     style: ElevatedButton.styleFrom(
//         primary: color ?? primaryColor,
//         minimumSize:
//             isCircle ? Size(width ?? s50, width ?? s50) : Size(width ?? 30.w, height ?? 30.w),
//         shape: isCircle
//             ? const CircleBorder()
//             : RoundedRectangleBorder(borderRadius: BorderRadius.circular(s5))),
//   );
// }

Widget elevatedButton(String title,
    {required Function() onTap, double? width, Color? color}) {
  return ElevatedButton(
    onPressed: onTap,
    child: Text(title, style: AppTheme.tsRegular.copyWith(color: whiteColor)),
    style: ElevatedButton.styleFrom(
        primary: color ?? primaryColor,
        minimumSize: Size(width ?? getWidth, s40)),
  );
}

Widget outlinedBtn(String title,
    {required Function()? onTap, double? width, Color color = primaryColor}) {
  return OutlinedButton(
    onPressed: onTap,
    child: Text(title, style: AppTheme.tsRegular.copyWith(color: color)),
    style: OutlinedButton.styleFrom(
        side: BorderSide(color: color), minimumSize: Size(width ?? s80, s40)),
  );
}

Widget iconButton(
    {Function()? onTap,
    bool isCircle = false,
    Color? color,
    Color? iconColor,
    double? width,
    double? height,
    double? iconSize,
    IconData? icon}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
        height: isCircle ? s30 : s40,
        width: isCircle ? s30 : s40,
        child: Icon(icon,
            color: iconColor ?? whiteColor, size: isCircle ? s16 : s16),
        decoration: BoxDecoration(
          color: color ?? primaryColor,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isCircle ? null : BorderRadius.circular(s5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              blurRadius: 3,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        )),
  );
}

Widget outlinedButton(
    {required Function() onTap,
    bool isCircle = false,
    Color color = blackColor,
    double? width,
    double? height,
    double? iconSize,
    required IconData icon}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
        height: isCircle ? s30 : s40,
        width: isCircle ? s30 : s40,
        child: Icon(icon, color: color, size: isCircle ? s16 : s20),
        decoration: BoxDecoration(
          border: Border.all(color: color),
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isCircle ? null : BorderRadius.circular(s5),
        )),
  );
}

Widget backButton() {
  return Padding(
    padding: pAll10,
    child:
        iconButton(icon: Icons.arrow_back_ios_rounded, onTap: () => Get.back()),
  );
}
