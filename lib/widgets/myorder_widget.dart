import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/widgets/button_widget.dart';
import 'package:gambolspark/widgets/dialog_widget.dart';
import 'package:gambolspark/widgets/title_widget.dart';

class MyOrderCard extends StatelessWidget {
  final String? productName;
  final String? qty;
  final String? productImage;
  final String? date;
  final String? price;
  final String? status;
  final String? cancelDesc;
  final String? deliveryDate;
  final Function() onPressed;

  const MyOrderCard(
      {Key? key,
      this.productName,
      this.qty,
      this.productImage,
      this.date,
      this.price,
      this.status,
      this.cancelDesc,
      this.deliveryDate,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: bgColor,
        child: Column(children: [
          Container(
              padding: EdgeInsets.all(spaceV8),
              width: double.infinity,
              child: Row(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$productName",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(fontWeight: FontWeight.w600)),
                    TitleWidget(
                      title: "Qty : $qty",
                      color: darkBlue,
                      fontWeight: FontWeight.w600,
                    ),
                    Text("$date",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(fontWeight: FontWeight.w600)),
                    Text("$price",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(fontWeight: FontWeight.w600)),
                    TitleWidget(
                      title: "$status",
                      color: status == "Placed Order"
                          ? greenColor
                          : status == "Packed"
                              ? greenColor
                              : status == "Shipped"
                                  ? greenColor
                                  : status == "Delivered"
                                      ? greenColor
                                      : redColor,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
                Spacer(),
                CachedNetworkImage(
                  height: 90.w,
                  imageUrl: productImage!,
                  placeholder: (context, url) =>
                      Center(child: circularProgress()),
                  fit: BoxFit.contain,
                ),
              ])),
          Container(
            padding: EdgeInsets.all(spaceV8),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                      status == 'Cancelled'
                          ? "$cancelDesc"
                          : "Expected to delivery on $deliveryDate",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontWeight: FontWeight.w600,
                            color:
                                status == 'Cancelled' ? redColor : greenColor,
                          )),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(spaceV8),
            width: double.infinity,
            child: cancelButton(
              status == "Cancelled"
                  ? "Cancelled"
                  : status == "Delivered"
                      ? "Delivered"
                      : "Cancel Order",
              onTap: status == 'Cancelled' || status == 'Delivered'
                  ? null
                  : onPressed,
            ),
          ),
        ]));
  }
}
