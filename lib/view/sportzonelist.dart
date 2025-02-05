import 'package:flutter/material.dart';
import 'package:gambolspark/constants/assets_url.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/view/shop_post_view.dart';
import 'package:gambolspark/widgets/header_widget.dart';
import 'package:get/get.dart';

class SportZoneList extends StatelessWidget {
  const SportZoneList(
      {Key? key, required this.sportzonelist, required this.title})
      : super(key: key);
  final List<String> sportzonelist;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Sports List",
            style: TextStyle(
              color: Colors.white,
              fontFamily: proxima,
            ),
            overflow: TextOverflow.ellipsis),
      ),
      body: Column(children: [
        HeaderWidget(title: title),
        Expanded(
            child: Padding(
                padding: pAll10,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      Divider(color: transparent, height: s5),
                  itemCount: sportzonelist.length,
                  itemBuilder: (context, index) => ListTile(
                    tileColor: cardColor,
                    trailing: Icon(Icons.arrow_forward_ios_rounded,
                        size: s16, color: greyColor),
                    title: Text(sportzonelist[index]),
                    onTap: () async {
                      Get.to(() => ShopPostView(title: sportzonelist[index]));
                    },
                  ),
                )))
      ]),
    );
  }
}
