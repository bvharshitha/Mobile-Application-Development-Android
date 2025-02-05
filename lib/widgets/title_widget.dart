import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gambolspark/constants/color_constants.dart';

class TitleWidget extends StatelessWidget {
  final String? title;
  final Color? color;
  final FontWeight? fontWeight;

  const TitleWidget({Key? key, this.title, this.color, this.fontWeight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text("$title",
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
            fontWeight: fontWeight == null ? FontWeight.w600 : fontWeight,
            color: color == null ? primaryColor : color));
  }
}
