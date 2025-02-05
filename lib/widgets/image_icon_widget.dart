import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gambolspark/constants/assets_url.dart';
import 'package:gambolspark/constants/size_constants.dart';

class ImageIconWidget extends StatelessWidget {
  const ImageIconWidget(
      {Key? key,
      required this.image,
      this.onPressed,
      this.color,
      this.isPNG = false,
      this.width,
      this.height})
      : super(key: key);
  final String image;
  final Function()? onPressed;
  final Color? color;
  final bool isPNG;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: s5),
        child: isPNG
            ? ImageIcon(AssetImage(image))
            : SvgPicture.asset(
                "$image",
                placeholderBuilder: (context) => Image.asset(shimmerImg),
                width: width ?? fs25,
                height: height ?? fs25,
                color: color,
              ),
      ),
    );
  }
}
