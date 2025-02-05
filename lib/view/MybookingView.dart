import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gambolspark/constants/app_theme.dart';
import 'package:gambolspark/constants/assets_url.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/controller/home_controller.dart';
import 'package:gambolspark/view/mybooking_detail_view.dart';
import 'package:gambolspark/view/shop_detail_view.dart';
import 'package:gambolspark/widgets/button_widget.dart';
import 'package:gambolspark/widgets/common_widget/drawer_widget.dart';
import 'package:gambolspark/widgets/shopPostCard.dart';
import 'package:get/get.dart';

class BookingPostView extends StatefulWidget {
  const BookingPostView({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<BookingPostView> createState() => _BookingPostViewState();
}

class _BookingPostViewState extends State<BookingPostView> {
  @override
  void initState() {
    getLocation();
    super.initState();
  }

  getLocation() {
    homeCtrl.getbookingList.bindStream(database.getBooking());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("My Booking",
            style: TextStyle(
              color: Colors.white,
              fontFamily: proxima,
            ),
            overflow: TextOverflow.ellipsis),
      ),
      body: Padding(
        padding: pH10,
        child: Column(
          // shrinkWrap: true,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            vSpace5,
            //* DROPDOWN

            vSpace10,
            Expanded(
              flex: 2,
              child: Container(
                child: GetX<HomeController>(
                  init: HomeController(),
                  initState: (_) {},
                  builder: (_) {
                    if (_.getbookingList.isNotEmpty) {
                      return ListView.separated(
                        separatorBuilder: (context, index) =>
                            Divider(color: transparent, height: s5),
                        shrinkWrap: true,
                        itemCount: _.getbookingList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ShopPostCard(
                            shopName: _.getbookingList[index].bookingId!,
                            location: _.getbookingList[index].category!,
                            category:
                                "${_.dateConversion(_.getbookingList[index].joiningDate)}",
                            onPressed: () {
                              Get.to(() => BookingDetailView(
                                    index: index,
                                  ));
                            },
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text("Booking not found"),
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
