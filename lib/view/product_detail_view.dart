import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gambolspark/constants/app_theme.dart';
import 'package:gambolspark/constants/assets_url.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/view/placeorder_view.dart';
import 'package:gambolspark/widgets/button_widget.dart';
import 'package:gambolspark/widgets/dialog_widget.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({Key? key, this.imageLength, this.index})
      : super(key: key);
  final int? imageLength;
  final int? index;

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  final razorpay = Razorpay();

  int pageIndex = 0;
  @override
  /* void initState() {
    super.initState();
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, payWallet);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, paySuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, payError);
  }

  void paySuccess(PaymentSuccessResponse response) async {
    print(response.paymentId.toString());
    await homeCtrl.getBookingId();
  }

  void payWallet(ExternalWalletResponse response) {
    print(response.walletName);
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
      'description': description,
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print("error $e");
    }
  }*/

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Product Details",
            style: TextStyle(
              color: Colors.white,
              fontFamily: proxima,
            ),
            overflow: TextOverflow.ellipsis),
      ),
      body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Padding(
              padding: EdgeInsets.all(spaceV8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: Get.height / 3,
                            padding: EdgeInsets.symmetric(vertical: spaceV8),
                            child: PageView.builder(
                              onPageChanged: (val) {
                                setState(() {
                                  pageIndex = val;
                                });
                              },
                              physics: ClampingScrollPhysics(),
                              itemCount: widget.imageLength,
                              itemBuilder: (context, index) => Hero(
                                tag: widget.index!,
                                child: CachedNetworkImage(
                                  imageUrl: productCtrl
                                      .listOfProduct![widget.index!]
                                      .images![index],
                                  placeholder: (context, url) =>
                                      Center(child: circularProgress()),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -spaceV15,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                  widget.imageLength!,
                                  (index) => AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        margin: EdgeInsets.all(4.w),
                                        width: pageIndex == index ? 20.w : 10.w,
                                        height: 10.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(spaceV10),
                                          border: pageIndex != index
                                              ? Border.all(
                                                  color: greyColor, width: 1.5)
                                              : Border.all(
                                                  color: Colors.transparent),
                                          color: pageIndex == index
                                              ? Colors.grey
                                              : Colors.white,
                                        ),
                                      )),
                            ),
                          ),
                        ]),
                    vSpace10,
                    Divider(color: black54),
                    vSpace10,
                    Text(
                        "${productCtrl.listOfProduct![widget.index!].productName}",
                        style: AppTheme.tsBold.copyWith(fontSize: fs16)),
                    vSpace5,
                    Container(
                      width: 60.w,
                      padding: EdgeInsets.symmetric(horizontal: s8),
                      decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(1.5.w)),
                      child: Row(
                        children: [
                          Text(
                            "${productCtrl.listOfProduct![widget.index!].rating}",
                            style:
                                Theme.of(context).textTheme.subtitle1?.copyWith(
                                      color: whiteColor,
                                    ),
                          ),
                          Icon(
                            Icons.star,
                            size: 12.w,
                            color: whiteColor,
                          )
                        ],
                      ),
                    ),
                    vSpace10,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Description: "),
                        Expanded(
                          child: Text(
                              "${productCtrl.listOfProduct![widget.index!].description}",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    vSpace10,
                    Row(
                      children: [
                        Text("Price: "),
                        Text(
                            "\u{20B9} ${productCtrl.listOfProduct![widget.index!].price}",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    vSpace10,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Date of Delivery: "),
                        Expanded(
                          child: Text(
                              "${productCtrl.listOfProduct![widget.index!].deliveryDate}",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    vSpace10,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Replacement: "),
                        Expanded(
                          child: Text(
                              "${productCtrl.listOfProduct![widget.index!].replacement}",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    vSpace20,
                    ButtonBar(alignment: MainAxisAlignment.center, children: [
                      elevatedButton(
                        "COD",
                        onTap: () {
                          orderCtrl.orderType.value = 'COD';
                          orderCtrl.paymentTypeValue.value = 'COD';
                          orderCtrl.productName.value = productCtrl
                              .listOfProduct![widget.index!].productName!;
                          orderCtrl.productQuantity.value = 1;
                          orderCtrl.productCost.value = double.parse(productCtrl
                              .listOfProduct![widget.index!].price
                              .toString());
                          orderCtrl.productId.value = productCtrl
                              .listOfProduct![widget.index!].productId!;
                          orderCtrl.productPrice.value = double.parse(
                              productCtrl.listOfProduct![widget.index!].price
                                  .toString());
                          orderCtrl.productImage.value = productCtrl
                              .listOfProduct![widget.index!].images![0];
                          orderCtrl.deliveryDate.value = productCtrl
                              .listOfProduct![widget.index!].deliveryDate!;
                          print(orderCtrl.productPrice.value);
                          orderCtrl.calculateGrandAmt();
                          Get.to(() => PlaceOrderPage(type: "COD"));
                        },
                        width: 45.w,
                        color: yellowColor,
                      ),
                      hSpace20,
                      elevatedButton(
                        "Buy Now",
                        onTap: () {
                          orderCtrl.orderType.value = 'Buy';
                          orderCtrl.paymentTypeValue.value = 'Buy';
                          orderCtrl.productName.value = productCtrl
                              .listOfProduct![widget.index!].productName!;
                          orderCtrl.productQuantity.value = 1;
                          orderCtrl.productCost.value = double.parse(productCtrl
                              .listOfProduct![widget.index!].price
                              .toString());
                          orderCtrl.productId.value = productCtrl
                              .listOfProduct![widget.index!].productId!;
                          orderCtrl.productPrice.value = double.parse(
                              productCtrl.listOfProduct![widget.index!].price
                                  .toString());
                          orderCtrl.productImage.value = productCtrl
                              .listOfProduct![widget.index!].images![0];
                          orderCtrl.deliveryDate.value = productCtrl
                              .listOfProduct![widget.index!].deliveryDate!;
                          print(orderCtrl.productPrice.value);
                          orderCtrl.calculateGrandAmt();
                          Get.to(() => PlaceOrderPage(type: "Buy"));
                          /*getPayment(
                              productCtrl.listOfProduct![widget.index!].price
                                  .toDouble(),
                              "description");*/
                        },
                        width: 45.w,
                        color: addBtnColor,
                      )
                    ])
                  ]))),
    );
  }
}
