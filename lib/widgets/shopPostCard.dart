import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/widgets/button_widget.dart';
import 'package:gambolspark/widgets/text_icon_widget.dart';

class ShopPostCard extends StatelessWidget {
  final String? shopName;
  final String? location;
  final String? category;
  final Function() onPressed;

  const ShopPostCard(
      {Key? key,
      this.shopName,
      this.location,
      this.category,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: bgColor,
        padding: pAll8,
        width: double.infinity,
        child: Row(
          //mainAxisAlignment:MainAxisAlignment.center,
          //crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Wrap(
                direction: Axis.vertical,
                spacing: s5,
                children: [
                  Text("$shopName",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.w600)),
                  TextIconWidget(
                      title: "$location", icon: Icons.location_on_rounded),
                  TextIconWidget(
                      title: "$category",
                      icon: Icons.settings_accessibility_rounded),
                ],
              ),
            ),
            Expanded(
              child: Column(
                //mainAxisAlignment:MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 30.h),
                  elevatedButton(
                    "View",
                    onTap: onPressed,
                    width: 45.w,
                    color: primaryColor,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
