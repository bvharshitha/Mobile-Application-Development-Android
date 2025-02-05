import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gambolspark/constants/app_theme.dart';
import 'package:gambolspark/constants/assets_url.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/routes/app_pages.dart';
import 'package:gambolspark/view/Manufacturing_view.dart';
import 'package:gambolspark/view/Manufacturing_view.dart';
import 'package:gambolspark/view/Manufacturing_view.dart';
import 'package:gambolspark/view/sportzonelist.dart';
import 'package:gambolspark/widgets/button_widget.dart';
import 'package:gambolspark/widgets/text_field_widget.dart';
import 'package:lottie/lottie.dart';

import 'package:get/get.dart';

final TextStyle titleStyle = TextStyle(fontSize: fs18);
final TextStyle messageStyle = AppTheme.tsRegular;

// ----SHOW LOADING----
showLoading({required String title, required String message}) {
  Get.dialog(
    WillPopScope(
        child: Dialog(
          insetPadding: EdgeInsets.zero,
          elevation: 0,
          backgroundColor: Colors.black38,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          child: Container(
            width: getWidth,
            height: getHeight,
            color: transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset(
                  loadingImg,
                  width: 90.w,
                  height: 90.w,
                  fit: BoxFit.cover,
                ),
                vSpace10,
                Text("$title",
                    style:
                        titleStyle.copyWith(color: whiteColor, fontSize: fs30)),
                const Spacer(),
                Text("$message",
                    style: messageStyle.copyWith(color: whiteColor)),
                vSpace10,
              ],
            ),
          ),
        ),
        onWillPop: () => Future.value(false)),
    // barrierDismissible: false,
  );
}

class Dialogs {
  static void showOverlayLoading({required String title}) {
    Get.dialog(
      WillPopScope(
          child: Dialog(
            insetPadding: EdgeInsets.zero,
            elevation: 0,
            backgroundColor: Colors.black38,
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            child: Container(
              width: getWidth,
              height: getHeight,
              color: transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Lottie.asset(
                    loadingImg,
                    width: 90.w,
                    height: 90.w,
                    fit: BoxFit.cover,
                  ),
                  vSpace10,
                  Text(title,
                      style: titleStyle.copyWith(
                          color: whiteColor, fontSize: fs25)),
                  const Spacer(),
                  Text("Please wait...",
                      style: titleStyle.copyWith(
                          color: whiteColor, fontSize: fs16)),
                  vSpace20,
                ],
              ),
            ),
          ),
          onWillPop: () => Future.value(true)),
      // barrierDismissible: false,
    );
  }
}

showLoading2() {
  return Lottie.asset(
    loadingJson,
    width: 250.w,
    height: 250.w,
    // fit: BoxFit.cover,
  );
}

/*class Dialogs {
  static showLoading2() {
    return Lottie.asset(
      loadingJson,
      width: 250.w,
      height: 250.w,
      // fit: BoxFit.cover,
    );
  }
}*/

//*TOAST SUCCESS MESSAGE
showToast({String? message, Color? color}) {
  return Fluttertoast.showToast(
    msg: "$message",
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 1,
    backgroundColor: color ?? Colors.grey[700],
    textColor: whiteColor,
    fontSize: fs14,
  );
}
//*TOAST ERROR MESSAGE

showErrorToast({required String message}) {
  Fluttertoast.showToast(
      msg: "$message",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 3,
      textColor: Colors.white,
      backgroundColor: blackColor,
      fontSize: fs16,
      webPosition: 'center');
}

void showSnackBar({
  String? title,
  String? message,
  Color? color,
  TextButton? flatButton,
  SnackPosition? position,
  Duration? duration,
}) {
  Get.snackbar(
    "$title",
    "$message",
    snackPosition: position,
    snackStyle: SnackStyle.GROUNDED,
    backgroundColor: color,
    colorText: Colors.white,
    animationDuration: const Duration(seconds: 1),
    duration: duration == null ? Duration(seconds: 3) : duration,
    leftBarIndicatorColor: Colors.blue,
    maxWidth: Get.width,
    shouldIconPulse: false,
    mainButton: flatButton,
  );
}

//----SHOW CONFIRMATION DIALOG
showMyDialog(
    {String? title,
    Function()? onConfirm,
    Function()? onCancel,
    String? message,
    String? onCancelText,
    String? onConfirmText}) {
  Get.defaultDialog(
    actions: [
      TextButton(
          onPressed: onConfirm,
          child: Text("$onConfirmText",
              style: messageStyle.copyWith(
                  color: primaryColor, fontWeight: FontWeight.bold))),
      TextButton(
          onPressed: onCancel,
          child: Text("$onCancelText",
              style: messageStyle.copyWith(
                  color: blackColor, fontWeight: FontWeight.bold))),
    ],
    content: Column(children: [Text("$message", style: messageStyle)]),
    title: title!,
    radius: s5,
    // barrierDismissible: false,
  );
}

showDialogBox({required String title, required Widget child}) {
  Get.dialog(
      Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: fs30, vertical: fs30),
        child: Padding(
          padding: pH12,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  Text(
                    "$title",
                    style:
                        TextStyle(fontSize: fs20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.close_rounded, color: redColor),
                  ),
                ],
              ),
              Expanded(child: child),
            ],
          ),
        ),
      ),
      barrierDismissible: false);
}

Widget circularProgress() {
  Widget loading = SpinKitDualRing(
    color: primaryColor,
    size: height40,
    lineWidth: 3,
  );
  return loading;
}

//----SHOW ERROR DIALOG----
void showErrorDialog({
  required String title,
  required String onConfirmText,
  Function()? onConfirm,
  required String message,
}) {
  Get.defaultDialog(
    radius: 5.0,
    title: title,
    titleStyle: const TextStyle(color: Colors.red),
    barrierDismissible: false,
    middleText: message,
    content: SizedBox(
      width: Get.width,
      child: Text(
        message,
        textAlign: TextAlign.center,
      ),
    ),
    actions: [
      TextButton(
        style: TextButton.styleFrom(primary: Colors.blue),
        onPressed: onConfirm,
        child: Text(onConfirmText, style: AppTheme.tsRegular),
      ),
    ],
  );
}

class WillScopeDialog extends StatelessWidget {
  const WillScopeDialog(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.message,
      this.titleColor,
      required this.btnName})
      : super(key: key);
  final String title;

  final Function() onPressed;
  final String message;
  final String btnName;
  final Color? titleColor;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Dialog(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              vSpace10,
              Text("$title",
                  style: TextStyle(
                      color: titleColor ?? blackColor, fontSize: fs20)),
              vSpace10,
              Text("$message", textAlign: TextAlign.center),
              vSpace10,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: elevatedButton(title,
                    onTap: onPressed, color: primaryColor),
              ),
              vSpace10,
            ],
          ),
        ),
      ),
    );
  }
}

Future displayTextInputDialog(
    BuildContext context, String title, List<String> menuListValue) async {
  List<String> menuList = menuListValue;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text(title),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return DropdownButtonFormField<String>(
                  hint: Text("--Select--", style: AppTheme.tsLight),
                  items: menuList
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    homeCtrl.menuTypeSelected.value = val.toString();
                  },
                  value: "Select",
                );
              },
            ),
            actions: <Widget>[
              TextButton(
                child: Text("Confirm"),
                onPressed: () {
                  if (homeCtrl.menuTypeSelected.value == "Select") {
                    showToast(message: "Select options properly");
                  }
                  if (homeCtrl.menuTypeSelected.value == "Indoor") {
                    homeCtrl.menuTypeSelected.value = "Select";
                    Get.off(() => SportZoneList(
                        sportzonelist: homeCtrl.indoorList,
                        title: "Indoor Game List"));
                  }
                  if (homeCtrl.menuTypeSelected.value == "Outdoor") {
                    homeCtrl.menuTypeSelected.value = "Select";
                    Get.off(() => SportZoneList(
                        sportzonelist: homeCtrl.outdoorList,
                        title: "Outdoor Game List"));
                  }
                  if (homeCtrl.menuTypeSelected.value == "Buy Now") {
                    homeCtrl.menuTypeSelected.value = "Select";
                    Get.offNamed(Routes.productView);
                  }
                  if (homeCtrl.menuTypeSelected.value == "Manufacturing") {
                    homeCtrl.menuTypeSelected.value = "Select";
                    Get.off(() => ManufacturingView());
                  }
                },
              ),
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Get.back();
                },
              ),
            ]);
      });
}

Future cancelDialog(
  BuildContext context,
  String title,
  List<String> menuListValue,
  String orderId,
) async {
  List<String> menuList = menuListValue;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text(title),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Expanded(
                  child: DropdownButtonFormField<String>(
                    hint: Text("--Select--", style: AppTheme.tsLight),
                    items: menuList
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      orderCtrl.cancelTypeSelected.value = val.toString();
                    },
                    value: '--Select Option--',
                  ),
                );
              },
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Confirm'),
                onPressed: () {
                  Get.back();
                  database.cancelOrder(
                      orderCtrl.cancelTypeSelected.value, orderId);
                },
              ),
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Get.back();
                },
              ),
            ]);
      });
}

Widget dropDownWidget(
    {List<DropdownMenuItem<dynamic>>? items,
    Function(dynamic)? onChanged,
    dynamic value}) {
  return Container(
    padding: EdgeInsets.only(left: spaceV10),
    decoration: BoxDecoration(
        color: bgColor, borderRadius: BorderRadius.circular(spaceV2)),
    child: DropdownButtonHideUnderline(
      child: DropdownButton(
        value: value,
        onChanged: onChanged,
        isExpanded: true,
        items: items,
      ),
    ),
  );
}

Future codDialog(
  BuildContext context,
  dynamic code,
) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Center(child: Text("Enter code for confirm the order")),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Wrap(
                  children: [
                    vSpace20,
                    Center(
                      child: Text(code,
                          style: AppTheme.tsBold,
                          overflow: TextOverflow.ellipsis),
                    ),
                    vSpace20,
                    TextFormFieldWidget(
                      name: "Code",
                      hintText: "Enter Code",
                      labelText: "Enter Code",
                      prefixIcon: Icons.dock_outlined,
                      controller: regCtrl.codeCtrl,
                      validator: FormBuilderValidators.required(),
                    ),
                  ],
                );
              },
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Confirm'),
                onPressed: () {
                  if (regCtrl.codeCtrl.text != "") {
                    if (regCtrl.codeCtrl.text == code) {
                      orderCtrl.createOrder("");
                      Get.back();
                    } else {
                      showToast(message: "Enter Code Properly");
                    }
                  } else {
                    showToast(message: "Enter Code Properly");
                  }
                },
              ),
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Get.back();
                },
              ),
            ]);
      });
}

Future cancelDialog2(
  BuildContext context,
  String msgStatus,
  String orderId,
) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text('Reason for Cancellation'),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return dropDownWidget(
                    onChanged: (val) {
                      setState(() {
                        orderCtrl.cancelTypeSelected.value = val.toString();
                      });
                    },
                    value: orderCtrl.cancelTypeSelected.value,
                    items: orderCtrl.cancelList
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList());
              },
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Confirm'),
                onPressed: () {
                  if (orderCtrl.cancelTypeSelected.value !=
                      '--Select Option--') {
                    database.cancelOrder(
                        orderCtrl.cancelTypeSelected.value, orderId);
                    Get.back();
                  } else {
                    showToast(message: "select properly");
                  }
                },
              ),
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Get.back();
                },
              ),
            ]);
      });
}
