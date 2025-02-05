import 'package:flutter/material.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';

class ProfileListTileWidget extends StatelessWidget {
  final String title;
  final Widget? subtitle;
  final String? date;
  final IconData leading;
  final Color? tileColor;
  final EdgeInsetsGeometry? contentPadding;
  const ProfileListTileWidget({
    Key? key,
    required this.title,
    this.subtitle,
    required this.leading,
    this.date,
    this.contentPadding,
    this.tileColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        color: blackColor, fontWeight: FontWeight.bold, fontSize: fs16);
    return ListTile(
      minLeadingWidth: 0,
      tileColor: tileColor,
      contentPadding: contentPadding,
      leading: Icon(leading, size: fs18),
      title: Text("$title", style: TextStyle(color: black54)),
      subtitle: subtitle ??
          Text(
            "$date",
            style: textStyle,
          ),
    );
  }
}
