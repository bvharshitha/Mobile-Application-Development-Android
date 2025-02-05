import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gambolspark/constants/app_theme.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/widgets/dialog_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class ProductWidget extends StatelessWidget {
  final String? productName;
  final String? description;
  final dynamic price;
  final String? imageUrl;
  final bool? isItemAdded;
  final Function? onCartPressed;
  final Function()? onTap;
  final dynamic rating;

  ProductWidget({
    Key? key,
    this.productName,
    this.description,
    this.price,
    this.onCartPressed,
    this.imageUrl,
    this.rating,
    this.onTap,
    this.isItemAdded,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: s8, vertical: spaceV8),
          child: Column(
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: imageUrl!,
                  placeholder: (context, url) =>
                      Center(child: circularProgress()),
                  fit: BoxFit.contain,
                ),
              ),
              vSpace5,
              Container(
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$productName",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "$description",
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.tsRegular,
                      maxLines: 2,
                    ),
                    vSpace5,
                    Row(
                      children: [
                        Container(
                          width: 60.w,
                          padding: EdgeInsets.symmetric(horizontal: s8),
                          decoration: BoxDecoration(
                              color: greenColor,
                              borderRadius: BorderRadius.circular(1.5.w)),
                          child: Row(
                            children: [
                              Text(
                                "$rating",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(
                                      color: whiteColor,
                                    ),
                              ),
                              hSpace5,
                              Icon(
                                Icons.star,
                                color: whiteColor,
                                size: 15.w,
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "\u20b9 $price",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
