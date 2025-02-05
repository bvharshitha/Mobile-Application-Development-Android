import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gambolspark/constants/app_theme.dart';
import 'package:gambolspark/constants/assets_url.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/widgets/header_widget.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingDetailView extends StatefulWidget {
  BookingDetailView({
    this.index,
  });
  final int? index;

  @override
  _BookingDetailViewState createState() => _BookingDetailViewState();
}

class _BookingDetailViewState extends State<BookingDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Booking Details",
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
                  Text("${homeCtrl.getbookingList[widget.index!].phone}",
                      style: AppTheme.tsBold.copyWith(fontSize: fs16)),
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(fs30),
                    child: Container(
                      color: primaryColor2,
                      width: 40.w,
                      height: 40.w,
                      child: GestureDetector(
                        onTap: () {
                          _makePhoneCall(
                              "${homeCtrl.getbookingList[widget.index!].phone}");
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
                  const Text("Contact Person: "),
                  Text(
                      "${homeCtrl.getbookingList[widget.index!].contactPerson}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              vSpace5,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Description: "),
                  Expanded(
                    child: Text(
                        "${homeCtrl.getbookingList[widget.index!].description}",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              vSpace5,
              Row(
                children: [
                  Text("Email: "),
                  Text("${homeCtrl.getbookingList[widget.index!].email}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              vSpace5,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Address: "),
                  Expanded(
                    child: Text(
                        "${homeCtrl.getbookingList[widget.index!].address}",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              vSpace5,
              Row(
                children: [
                  Text("City: "),
                  Text("${homeCtrl.getbookingList[widget.index!].city}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Divider(color: black54),
              vSpace5,
              const HeaderWidget(title: "Joining Date & Time Slot"),
              vSpace10,
              Row(
                children: [
                  Text("Date: "),
                  Text(
                      "${homeCtrl.dateConversion(homeCtrl.getbookingList[widget.index!].joiningDate)}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              vSpace5,
              Row(
                children: [
                  Text("Time Slot: "),
                  Text("${homeCtrl.getbookingList[widget.index!].timeSlot}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              vSpace10,
              const HeaderWidget(title: "Payments details"),
              vSpace15,
              Row(
                children: [
                  Text("Payment Id: "),
                  Text("${homeCtrl.getbookingList[widget.index!].paymentId}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              vSpace5,
              Row(
                children: [
                  Text("Payment Amount: "),
                  Text(
                      "${homeCtrl.getbookingList[widget.index!].paymentAmount.toDouble()}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              vSpace5,
              Row(
                children: [
                  Text("Payment Status: "),
                  Text("Done", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              vSpace20,
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
