import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:gambolspark/constants/app_theme.dart';
import 'package:gambolspark/constants/assets_url.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/constants/string_constants.dart';
import 'package:gambolspark/controller/home_controller.dart';
import 'package:gambolspark/view/MybookingView.dart';
import 'package:gambolspark/view/home_view.dart';
import 'package:gambolspark/view/myOrder.dart';
import 'package:gambolspark/view/profile_vew.dart';
import 'package:gambolspark/widgets/dialog_widget.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 0,
        child: Column(
          children: [
            Container(
                width: getWidth,
                padding: pAll10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 70.w,
                      height: 70.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor,
                      ),
                      child: buildProfileImage(),
                    ),
                    vSpace10,
                    Text("${regCtrl.firestoreUser.value?.userName}",
                        style: AppTheme.tsRegular,
                        overflow: TextOverflow.ellipsis),
                    vSpace5,
                    Text("${regCtrl.firestoreUser.value?.email}",
                        style: AppTheme.tsLight,
                        overflow: TextOverflow.ellipsis),
                  ],
                )),
            Divider(color: greyColor, height: s2, indent: s16),
            //*LIST OF MENU ITEMS
            GetBuilder<HomeController>(
              init: HomeController(),
              initState: (_) {},
              builder: (_) {
                return Expanded(
                  child: ListView.separated(
                      physics: const ScrollPhysics(),
                      separatorBuilder: (context, index) => Divider(
                            color: greyColor,
                            height: s2,
                            indent: s16,
                          ),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListTile(
                            title: Text(_.menuItemsList[index],
                                style: AppTheme.tsRegular.copyWith(
                                  color: _.menuItemsList[index] == logoutTxt
                                      ? primaryColor
                                      : null,
                                )),
                            trailing: _.menuItemsList[index] == logoutTxt
                                ? Icon(Icons.exit_to_app_rounded,
                                    color: redColor, size: s16)
                                : Icon(Icons.arrow_forward_ios_rounded,
                                    size: s16, color: greyColor),
                            onTap: () {
                              _.setMenuIndex(index);
                              gotToView(index);
                            },
                          ),
                      itemCount: _.menuItemsList.length),
                );
              },
            ),
            vSpace40,
          ],
        ),
      ),
    );
  }

  Widget buildProfileImage() {
    return ClipOval(
      child: Container(
        width: 120.w,
        height: 120.w,
        child: regCtrl.firestoreUser.value?.profileUrl != ''
            ? FadeInImage.assetNetwork(
                placeholder: imageLoadingGif,
                width: 60.w,
                height: 60.w,
                fit: BoxFit.cover,
                image: "${regCtrl.firestoreUser.value?.profileUrl}")
            : Icon(
                Icons.person,
                size: 60.w,
                color: greyColor,
              ),
      ),
    );
  }

  void gotToView(int index) {
    switch (index) {
      case 0:
        Get.off(() => const HomeView());
        break;

      case 1:
        Get.offAll(() => ProfileView(appBar: true));
        break;

      case 2:
        Get.offAll(() => BookingPostView(title: "Cricket"));
        break;

      case 3:
        Get.offAll(() => MyOrderPage());
        break;

      case 4:
        showMyDialog(
            title: "Logout",
            message: "Are you sure ?",
            onCancelText: "No",
            onConfirmText: "Yes",
            onCancel: () => Get.back(),
            onConfirm: () => regCtrl.signOut());
        break;

      default:
    }
  }
}
