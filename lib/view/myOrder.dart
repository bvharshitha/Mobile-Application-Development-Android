import 'package:flutter/material.dart';
import 'package:gambolspark/constants/app_theme.dart';
import 'package:gambolspark/constants/assets_url.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/controller/order_controller.dart';
import 'package:gambolspark/widgets/common_widget/drawer_widget.dart';
import 'package:gambolspark/widgets/dialog_widget.dart';
import 'package:gambolspark/widgets/myorder_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:intl/intl.dart';

class MyOrderPage extends StatefulWidget {
  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  void initState() {
    super.initState();
    orderCtrl.getOrderList.bindStream(database.getOrder());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("My Order",
            style: TextStyle(
              color: Colors.white,
              fontFamily: proxima,
            ),
            overflow: TextOverflow.ellipsis),
      ),
      body: Padding(
        padding: EdgeInsets.all(spaceV8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetX<OrderController>(
              init: OrderController(),
              initState: (_) {},
              builder: (_) {
                if (_.getOrderList.length != 0) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _.getOrderList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MyOrderCard(
                          productName: "${_.getOrderList[index].productName}",
                          qty: "${_.getOrderList[index].quantity.toString()}",
                          productImage: "${_.getOrderList[index].image}",
                          price: "\u20b9 ${_.getOrderList[index].price}",
                          date: DateFormat('dd-MM-yyyy')
                              .format(_.getOrderList[index].orderDate!),
                          deliveryDate: _.getOrderList[index].deliveryDate!,
                          cancelDesc: _.getOrderList[index].cancelDesc,
                          status: "${_.getOrderList[index].deliveryStatus}",
                          onPressed: () {
                            /*cancelDialog(
                                context,
                                "Reason For Cancelling",
                                orderCtrl.cancelList,
                                _.getOrderList[index].orderId!);*/
                            cancelDialog2(context, "Reason for Cancelling",
                                _.getOrderList[index].orderId!);
                          },
                        );
                      }, //getture
                    ),
                  );
                } else {
                  return Center(
                    child: Text("No order available"),
                  );
                }
              },
            ),
          ],
        ),
      ),
    ));
  }
}
