import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gambolspark/constants/app_theme.dart';
import 'package:gambolspark/constants/assets_url.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/controller/home_controller.dart';
import 'package:gambolspark/view/shop_detail_view.dart';
import 'package:gambolspark/widgets/button_widget.dart';
import 'package:gambolspark/widgets/common_widget/drawer_widget.dart';
import 'package:gambolspark/widgets/dialog_widget.dart';
import 'package:gambolspark/widgets/shopPostCard.dart';
import 'package:get/get.dart';

class ShopPostView extends StatefulWidget {
  const ShopPostView({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<ShopPostView> createState() => _ShopPostViewState();
}

class _ShopPostViewState extends State<ShopPostView> {
  @override
  void initState() {
    getLocation();
    super.initState();
  }

  getLocation() {
    print(widget.title);
    homeCtrl.getShopList.bindStream(database.getShop(widget.title));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("${widget.title} Sports Clubs",
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
            vSpace5,
            Row(
              children: [
                Expanded(
                  child: GetBuilder<HomeController>(
                    init: HomeController(),
                    initState: (_) {
                      homeCtrl.getAllCitiesList();
                      homeCtrl.getAllCities.sort();
                    },
                    builder: (_) {
                      return DropdownSearch<String>(
                        validator: (v) => v == null ? "Required field" : null,
                        hint: "City",
                        mode: Mode.MENU,
                        showSelectedItem: true,
                        searchBoxController: _.cityCtrl,
                        items: _.getAllCities,
                        showSearchBox: true,
                        showAsSuffixIcons: true,
                        onChanged: (val) {
                          homeCtrl.setStateCitySelected(
                              value: "$val", type: "City");
                        },
                        dropdownSearchDecoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: bgColor,
                            prefixIcon: Icon(Icons.location_on),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: greyColor),
                                gapPadding: 0)),
                        searchFieldProps: TextFieldProps(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor)),
                            labelText: "Search City",
                          ),
                        ),
                      );
                    },
                  ),
                ),
                hSpace5,
                elevatedButton(
                  "Search",
                  onTap: () {
                    if (homeCtrl.selectedCity != null) {
                      homeCtrl.getShopList.bindStream(database.searchByArea(
                          widget.title, homeCtrl.selectedCity!));
                    } else {
                      showToast(message: "No result found");
                    }
                  },
                  width: 45.w,
                  color: blueColor,
                )
              ],
            ),
            vSpace10,
            Expanded(
              flex: 2,
              child: Container(
                child: GetX<HomeController>(
                  init: HomeController(),
                  initState: (_) {},
                  builder: (_) {
                    if (_.getShopList.isNotEmpty) {
                      return ListView.separated(
                        separatorBuilder: (context, index) =>
                            Divider(color: transparent, height: s5),
                        shrinkWrap: true,
                        itemCount: _.getShopList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ShopPostCard(
                            shopName: _.getShopList[index].shopName!,
                            location: _.getShopList[index].city!,
                            category: _.getShopList[index].category!,
                            onPressed: () {
                              Get.to(() => ShopDetailView(
                                    index: index,
                                  ));
                            },
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text("${widget.title} not found"),
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
