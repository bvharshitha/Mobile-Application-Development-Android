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

class ShopDetailView extends StatefulWidget {
  ShopDetailView({
    this.index,
  });
  final int? index;

  @override
  _ShopDetailViewState createState() => _ShopDetailViewState();
}

class _ShopDetailViewState extends State<ShopDetailView> {
  final razorpay = Razorpay();
  @override
  void initState() {
    super.initState();
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, payWallet);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, paySuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, payError);
  }

  void payWallet(ExternalWalletResponse response) {
    print(response.walletName);
  }

  void paySuccess(PaymentSuccessResponse response) async {
    print(response.paymentId.toString());
    await homeCtrl.getBookingId();
    MyBookingModel myBookingModel = MyBookingModel(
      bookingId: homeCtrl.bookingId.value,
      idCount: homeCtrl.idCount,
      bookingDate: DateTime.now(),
      shopName: homeCtrl.getShopList[widget.index!].shopName,
      category: homeCtrl.getShopList[widget.index!].category,
      description: homeCtrl.getShopList[widget.index!].description,
      contactPerson: homeCtrl.getShopList[widget.index!].contactPerson,
      city: homeCtrl.getShopList[widget.index!].city,
      address: homeCtrl.getShopList[widget.index!].address,
      phone: homeCtrl.getShopList[widget.index!].phone,
      email: homeCtrl.getShopList[widget.index!].email,
      joiningDate: homeCtrl.currentDate,
      timeSlot: homeCtrl.timeSlotSelected.value,
      customerName: regCtrl.firestoreUser.value!.userName,
      customerPhone: regCtrl.firestoreUser.value!.phoneNumber,
      paymentId: response.paymentId.toString(),
      paymentAmount: homeCtrl.getShopList[widget.index!].fees.toDouble(),
      paymentStatus: "Done",
      uid: regCtrl.firebaseUser.value?.uid,
    );
    database.createBooking(myBookingModel);
    homeCtrl.updateStartDate();
    Get.offAll(() => BookingPostView(
          title: "football",
        ));
  }

  void payError(PaymentFailureResponse response) {
    print(response.message! + response.code.toString());
  }

  void getPayment(double amount, String description) {
    var options = {
      "key": "rzp_test_ttJ5X5jNUpGX3Z",
      "amount": amount * 100,
      "receipt": "controller.getInvoiceHeader[widget.indexVal].invoiceId",
      "prefill": {
        "contact": regCtrl.firestoreUser.value?.phoneNumber,
        "email": regCtrl.firestoreUser.value?.email,
      },
      "currency": "INR",
      "status": "created",
      'Order ID': "order_EMBFqjDHEEn80l", // Generate order_id using Orders API
      'description': "Slot Booking",
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print("error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Sports Club Details",
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
                        "${homeCtrl.getShopList[widget.index!].shopName}",
                        style: AppTheme.tsBold.copyWith(fontSize: fs16)),
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
                              "${homeCtrl.getShopList[widget.index!].phone}");
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
                  const Text("Contact Person : "),
                  Text("${homeCtrl.getShopList[widget.index!].contactPerson}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              vSpace5,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Description : "),
                  Expanded(
                    child: Text(
                        "${homeCtrl.getShopList[widget.index!].description}",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              vSpace5,
              Row(
                children: [
                  Text("Email: "),
                  Text("${homeCtrl.getShopList[widget.index!].email}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              vSpace5,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Address : "),
                  Expanded(
                    child: Text(
                        "${homeCtrl.getShopList[widget.index!].address}",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              vSpace5,
              Row(
                children: [
                  Text("City: "),
                  Text("${homeCtrl.getShopList[widget.index!].city}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              vSpace5,
              Row(
                children: [
                  Text("fees: "),
                  Text("${homeCtrl.getShopList[widget.index!].fees}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Divider(color: black54),
              const HeaderWidget(title: "Select Joining Date & Time Slot"),
              vSpace20,
              GetBuilder<HomeController>(
                  init: HomeController(),
                  builder: (_) {
                    return GestureDetector(
                      onTap: () {
                        _.pickStartDate(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: cardColor,
                            borderRadius: BorderRadius.circular(s5)),
                        height: s56,
                        child: Row(
                          children: [
                            hSpace10,
                            Icon(Icons.event_available_rounded,
                                size: fs20, color: greyColor),
                            hSpace10,
                            Text(
                              "${_.startDate}",
                              style: AppTheme.tsRegular
                                  .copyWith(fontSize: fs14, color: blackColor),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              vSpace10,
              DropdownButtonFormField<String>(
                hint: Text("--Select--", style: AppTheme.tsLight),
                items: homeCtrl.timeSlotList
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (val) {
                  homeCtrl.timeSlotSelected.value = val.toString();
                },
                value: "Select Time Slot",
              ),
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
              })
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
