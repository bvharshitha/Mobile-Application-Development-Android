import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gambolspark/constants/app_theme.dart';
import 'package:gambolspark/constants/assets_url.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/controller/order_controller.dart';
import 'package:gambolspark/view/myOrder.dart';
import 'package:gambolspark/view/profile_vew.dart';
import 'package:gambolspark/widgets/address_widget.dart';

import 'package:gambolspark/widgets/button_widget.dart';
import 'package:gambolspark/widgets/dialog_widget.dart';
import 'package:gambolspark/widgets/price_detailwidget.dart';
import 'package:gambolspark/widgets/product_holder.dart';
import 'package:gambolspark/widgets/title_widget.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PlaceOrderPage extends StatefulWidget {
  @override
  final String type;
  _PlaceOrderPageState createState() => _PlaceOrderPageState();
  const PlaceOrderPage({Key? key, required this.type}) : super(key: key);
}

class _PlaceOrderPageState extends State<PlaceOrderPage> {
  final razorpay = Razorpay();
  @override
  void initState() {
    super.initState();
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, payWallet);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, paySuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, payError);
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }

  void payWallet(ExternalWalletResponse response) {
    print(response.walletName);
  }

  void paySuccess(PaymentSuccessResponse response) async {
    print(response.paymentId.toString());
    //  showLoading(title: "Updating", message: "Please wait...");
    print("Create Order");
    orderCtrl.createOrder(response.paymentId.toString());
    Get.to(() => MyOrderPage());
  }

  void payError(PaymentFailureResponse response) {
    print(response.message! + response.code.toString());
  }

  void getPayment() {
    var options = {
      "key": "rzp_test_ttJ5X5jNUpGX3Z",
      "amount": orderCtrl.grandAmtValue.value * 100,
      "receipt": "controller.getInvoiceHeader[widget.indexVal].invoiceId",
      "prefill": {
        "contact": regCtrl.firestoreUser.value?.phoneNumber,
        "email": regCtrl.firestoreUser.value?.email,
      },
      "currency": "INR",
      "status": "created",
      'Order ID': "order_EMBFqjDHEEn80l", // Generate order_id using Orders API
      'description': orderCtrl.productName.value,
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print("error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    final textStyle = TextStyle(
        color: blackColor, fontWeight: FontWeight.bold, fontSize: fs16);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Place Order",
            style: TextStyle(
              color: Colors.white,
              fontFamily: proxima,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis),
      ),
      body: Container(
          width: Get.width,
          padding: EdgeInsets.all(spaceV10),
          child: ListView(
            //mainAxisAlignment:MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: ProductHolderWidget(
                type: 'Buy',
              )),
              vSpace5,
              TitleWidget(
                title: "Delivery address",
                color: blackColor,
                fontWeight: FontWeight.w900,
              ),
              vSpace5,
              Container(child: AddressCard(
                onPressed: () {
                  regCtrl.isFieldEnable.value = true;
                  Get.to(() => ProfileView(appBar: false));
                },
              )),
              vSpace10,
              TitleWidget(
                title: "Payment Details",
                color: blackColor,
                fontWeight: FontWeight.w900,
              ),
              Container(child: PriceDetailCard()),
              vSpace80,
              elevatedButton("Proceed", onTap: () async {
                if (widget.type == "Buy") {
                  getPayment();
                } else {
                  Random random = Random();
                  dynamic code = 1000 + random.nextInt(9999 - 1000);
                  codDialog(context, code.toString());
                }
              }),
            ],
          )),
    );
  }
}
