import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gambolspark/constants/app_theme.dart';
import 'package:gambolspark/constants/assets_url.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/controller/home_controller.dart';
import 'package:gambolspark/model/my_bookingmodel.dart';
import 'package:gambolspark/view/MybookingView.dart';
import 'package:gambolspark/widgets/button_widget.dart';
import 'package:gambolspark/widgets/dialog_widget.dart';
import 'package:gambolspark/widgets/header_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ManufacturingDetailView extends StatefulWidget {
  ManufacturingDetailView({
    this.index,
  });
  final int? index;

  @override
  _ManufacturingDetailViewState createState() =>
      _ManufacturingDetailViewState();
}

class _ManufacturingDetailViewState extends State<ManufacturingDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Manufacturing Details",
            style: TextStyle(
              color: Colors.white,
              fontFamily: proxima,
            ),
            overflow: TextOverflow.ellipsis),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: getWidth,
          padding: pAll8,
          child: Column(
            //mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                        "${homeCtrl.getManufacturingList[widget.index!].shopName}",
                        style: AppTheme.tsBold.copyWith(fontSize: fs20)),
                  ),
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(fs30),
                    child: Container(
                      color: blueColor,
                      width: 40.w,
                      height: 40.w,
                      child: GestureDetector(
                        onTap: () {
                          _makePhoneCall(
                              "${homeCtrl.getManufacturingList[widget.index!].phone}");
                        },
                        child: Icon(
                          Icons.call,
                          color: blackColor,
                          size: fs20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              vSpace5,
              Row(
                children: [
                  Text("Contact Person : ",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: fs16)),
                  Text(
                      "${homeCtrl.getManufacturingList[widget.index!].contactPerson}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: fs16)),
                ],
              ),
              vSpace5,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Description : ",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: fs16)),
                  Expanded(
                    child: Text(
                        "${homeCtrl.getManufacturingList[widget.index!].description}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: fs16)),
                  ),
                ],
              ),
              vSpace5,
              Row(
                children: [
                  Text("Email : ",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: fs16)),
                  Text("${homeCtrl.getManufacturingList[widget.index!].email}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: fs16)),
                ],
              ),
              vSpace5,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Address : ",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: fs16)),
                  Expanded(
                    child: Text(
                        "${homeCtrl.getManufacturingList[widget.index!].address}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: fs16)),
                  ),
                ],
              ),
              vSpace5,
              Row(
                children: [
                  Text("City : ",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: fs16)),
                  Text("${homeCtrl.getManufacturingList[widget.index!].city}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: fs16)),
                ],
              ),
              /*Divider(color: black54)
              vSpace20,
              elevatedButton("Book Now", onTap: () async {
                if (homeCtrl.startDate != 'Start Date') {
                  if (homeCtrl.timeSlotSelected.value != "") {
                    getPayment(
                        homeCtrl.getShopList[widget.index!].fees.toDouble(),
                        "description");
                  } else {
                    showErrorToast(message: "Select date properly");
                  }
                } else {
                  showErrorToast(message: "Select Time Slot Correctly");
                }
              })*/
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
