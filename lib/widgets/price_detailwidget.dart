import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/widgets/title_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class PriceDetailCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: bgColor,
        child: Container(
            padding: EdgeInsets.all(spaceV8),
            width: double.infinity,
            child: Obx(() => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                        //crossAxisAlignment:CrossAxisAlignment.center,
                        children: [
                          TitleWidget(
                            title: "Total Price ",
                            color: darkBlue,
                            fontWeight: FontWeight.w600,
                          ),
                          hSpace10,
                          TitleWidget(
                            title: " \u20b9${orderCtrl.totalPrice.value}",
                            color: darkBlue,
                            fontWeight: FontWeight.w600,
                          ),
                        ]),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                        //crossAxisAlignment:CrossAxisAlignment.center,
                        children: [
                          TitleWidget(
                            title: "GST Price ",
                            color: darkBlue,
                            fontWeight: FontWeight.w400,
                          ),
                          hSpace30,
                          TitleWidget(
                            title: "\u20b9${orderCtrl.gstAmtValue.value}",
                            color: darkBlue,
                            fontWeight: FontWeight.w400,
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      //crossAxisAlignment:CrossAxisAlignment.center,
                      children: [
                        TitleWidget(
                          title: "Delivery Price ",
                          color: darkBlue,
                          fontWeight: FontWeight.w400,
                        ),
                        hSpace50,
                        TitleWidget(
                          title: "\u20b9 100",
                          color: darkBlue,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      //crossAxisAlignment:CrossAxisAlignment.center,
                      children: [
                        TitleWidget(
                          title: "Grand total ",
                          color: greenColor,
                          fontWeight: FontWeight.w600,
                        ),
                        hSpace10,
                        TitleWidget(
                          title: " \u20b9${orderCtrl.grandAmtValue.value}",
                          color: greenColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ],
                ))));
  }
}
