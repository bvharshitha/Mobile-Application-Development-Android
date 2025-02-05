import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/widgets/dialog_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductHolderWidget extends StatelessWidget {
  final int? index;
  final String? type;
  final String? image;
  final String? name;
  final dynamic price;
  final int? quantity;
  final dynamic cost;

  ProductHolderWidget(
      {Key? key,
      this.index,
      this.type,
      this.image,
      this.name,
      this.price,
      this.quantity,
      this.cost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        height: 160.w,
        padding: EdgeInsets.all(spaceV12),
        child: Row(
          //mainAxisAlignment:MainAxisAlignment.center,
          //crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            Expanded(
              child: /*CachedNetworkImage(
              imageUrl: image!,
              placeholder: (context, url) => Center(child: circularProgress()),
              fit: BoxFit.contain,
            )*/
                  CachedNetworkImage(
                imageUrl: orderCtrl.productImage.value,
                placeholder: (context, url) =>
                    Center(child: circularProgress()),
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      vSpace20,
                      Text(
                        "${orderCtrl.productName}",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      vSpace5,
                      Text(
                        "\u20b9 ${orderCtrl.productPrice}",
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      vSpace10,
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //crossAxisAlignment:CrossAxisAlignment.center,
                        children: [
                          hSpace2,
                          InkWell(
                            onTap: () {
                              print("decreaseQuantity");
                              orderCtrl.decreaseQuantity();
                            },
                            borderRadius: BorderRadius.circular(spaceV15),
                            splashColor: Colors.grey.withOpacity(0.5),
                            child: Icon(
                              Icons.remove_circle,
                              color: greyColor,
                              size: fs22,
                            ),
                          ),
                          hSpace10,
                          Obx(() => Text(
                                "${orderCtrl.productQuantity}",
                                style: TextStyle(
                                    color: yellowColor,
                                    fontWeight: FontWeight.bold),
                              )),
                          hSpace10,
                          InkWell(
                            splashColor: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(spaceV15),
                            onTap: () {
                              print("increaseQuantity");
                              orderCtrl.increaseQuantity();
                            },
                            child: Icon(
                              Icons.add_circle,
                              color: greyColor,
                              size: fs22,
                            ),
                          ),
                          hSpace10,
                          Obx(() => Text(
                                "\u20b9 ${orderCtrl.productCost}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                              )),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }
}
