import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gambolspark/constants/app_theme.dart';
import 'package:gambolspark/constants/assets_url.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/controller/product_controller.dart';
import 'package:gambolspark/view/product_detail_view.dart';
import 'package:gambolspark/widgets/common_widget/drawer_widget.dart';
import 'package:gambolspark/widgets/dialog_widget.dart';
import 'package:gambolspark/widgets/product_widget.dart';
import 'package:get/get.dart';

class ProductView extends StatefulWidget {
  ProductView({Key? key}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  void initState() {
    super.initState();
    getProductData();
  }

  void getProductData() {
    productCtrl.getProductList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Product View",
            style: TextStyle(
              color: Colors.white,
              fontFamily: proxima,
            ),
            overflow: TextOverflow.ellipsis),
      ),
      body: GetBuilder<ProductController>(builder: (_) {
        return _.listOfProduct?.length == null
            ? circularProgress()
            : _.listOfProduct?.length == 0
                ? const Center(
                    child: Text("No Product Found"),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 3, crossAxisCount: 2),
                    physics: const ClampingScrollPhysics(),
                    itemCount: _.listOfProduct!.length,
                    itemBuilder: (context, index) => Hero(
                        tag: _.listOfProduct!.indexOf(_.listOfProduct![index]),
                        child: ProductWidget(
                          productName: _.listOfProduct![index].productName,
                          description: _.listOfProduct![index].shortDescription,
                          price: _.listOfProduct![index].price,
                          imageUrl: _.listOfProduct![index].images![0],
                          rating: _.listOfProduct![index].rating,
                          onCartPressed: () {},
                          onTap: () async {
                            Get.to(() => ProductDetailView(
                                  imageLength:
                                      _.listOfProduct![index].images!.length,
                                  index: index,
                                ));
                          },
                        )));
      }),
    );
  }
}
