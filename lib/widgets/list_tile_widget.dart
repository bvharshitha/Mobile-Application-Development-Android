import 'package:flutter/material.dart';
import 'package:gambolspark/constants/app_theme.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/widgets/image_icon_widget.dart';

class ListTileWidget extends StatelessWidget {
  final String icon;
  final String title;
  final Widget? trailing;
  final String? subtitle;
  final double? iconWidth;
  final double? iconHeight;

  final Function() onTap;
  const ListTileWidget(
      {Key? key,
      required this.icon,
      required this.title,
      this.subtitle,
      this.trailing,
      required this.onTap,
      this.iconWidth,
      this.iconHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        onTap: onTap,
        trailing: trailing ?? null,
        leading: ImageIconWidget(
          image: icon,
          width: iconWidth,
          height: iconHeight,
        ),
        title: Stack(
          children: [
            Text("$title",
                textAlign: TextAlign.start,
                style: AppTheme.tsBold
                    .copyWith(color: blackColor, fontSize: fs16)),
          ],
        ),
        subtitle: Text(
          subtitle == null ? "" : "$subtitle",
          style: Theme.of(context).textTheme.subtitle1,
        ));
  }
}
