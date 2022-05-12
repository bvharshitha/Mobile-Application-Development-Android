import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gambolspark/constants/assets_url.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key, this.size}) : super(key: key);
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Image.asset(logoImg, width: size ?? 150.w);
  }
}
