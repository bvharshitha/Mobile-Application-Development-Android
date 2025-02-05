import 'package:flutter/material.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';

class TextIconWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  const TextIconWidget({Key? key, required this.title, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: greyColor, size: fs16),
        hSpace10,
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        )
      ],
    );
  }
}
