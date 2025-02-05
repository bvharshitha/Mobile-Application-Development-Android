import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/widgets/button_widget.dart';
import 'package:gambolspark/widgets/title_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class AddressCard extends StatelessWidget {
  final Function()? onPressed;
  AddressCard({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor,
      child: Container(
          padding: EdgeInsets.all(spaceV8),
          width: double.infinity,
          child: Obx(() => Row(
                //mainAxisAlignment:MainAxisAlignment.center,
                //crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Wrap(
                      direction: Axis.vertical,
                      spacing: spaceV5,
                      children: [
                        TitleWidget(
                          title: "${regCtrl.firestoreUser.value?.userName}",
                          color: darkBlue,
                          fontWeight: FontWeight.w700,
                        ),
                        TitleWidget(
                          title: "${regCtrl.firestoreUser.value?.phoneNumber}",
                          color: darkBlue,
                          fontWeight: FontWeight.w700,
                        ),
                        TitleWidget(
                            title:
                                "${regCtrl.firestoreUser.value?.addressLine1}",
                            color: darkBlue,
                            fontWeight: FontWeight.w700),
                        TitleWidget(
                          title: "${regCtrl.firestoreUser.value?.addressLine2}",
                          color: darkBlue,
                          fontWeight: FontWeight.w700,
                        ),
                        TitleWidget(
                          title: "${regCtrl.firestoreUser.value?.landmark}",
                          color: darkBlue,
                          fontWeight: FontWeight.w600,
                        ),
                        TitleWidget(
                          title:
                              "${regCtrl.firestoreUser.value?.city}  ${regCtrl.firestoreUser.value?.state}",
                          color: darkBlue,
                          fontWeight: FontWeight.w600,
                        ),
                        TitleWidget(
                          title: "${regCtrl.firestoreUser.value?.pincode}",
                          color: darkBlue,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 130.h),
                      outlinedBtn("Edit", onTap: onPressed)
                    ],
                  ),
                ],
              ))),
    );
  }
}
