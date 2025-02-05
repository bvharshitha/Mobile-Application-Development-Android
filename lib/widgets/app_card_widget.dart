import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCardWidget extends StatelessWidget {
  const AppCardWidget({
    Key? key,
    required this.image,
    required this.title,
    this.color,
    this.elevation,
    this.onPressed,
  }) : super(key: key);

  final String image;
  final String title;
  final Color? color;
  final double? elevation;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: whiteColor,
      child: GestureDetector(
        onTap: onPressed,
        child: Column(
          children: [
            AnimatedContainer(
              width: 150.w,
              // height: 150.w,
              duration: Duration(milliseconds: 250),
              padding: pAll30,
              decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(s5))),
              child: SvgPicture.asset(
                "$image",
                width: 180.w,
                height: 180.w,
              ),
            ),
            Padding(
              padding: pAll8,
              child: Text(
                "$title",
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
