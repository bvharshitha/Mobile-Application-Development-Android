import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gambolspark/constants/app_theme.dart';
import 'package:gambolspark/constants/assets_url.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/model/user_model.dart';
import 'package:gambolspark/widgets/button_widget.dart';
import 'package:gambolspark/widgets/common_widget/drawer_widget.dart';
import 'package:gambolspark/widgets/dialog_widget.dart';
import 'package:gambolspark/widgets/profile_list_tilewidget.dart';
import 'package:gambolspark/widgets/underlined_textfiled_widget.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key? key, this.appBar}) : super(key: key);
  final bool? appBar;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final formKey = GlobalKey<FormBuilderState>();
  final textStyle =
      TextStyle(color: blackColor, fontWeight: FontWeight.bold, fontSize: fs16);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: widget.appBar! ? DrawerWidget() : null,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Profile"),
      ),
      body: WillPopScope(
          onWillPop: () {
            if (regCtrl.isFieldEnable.value) {
              if (formKey.currentState!.validate() &&
                  regCtrl.isFieldEnable.value) {
                showToast(message: "Click on update first");
                return Future.value(false);
              } else {
                showToast(message: "Please update the fields");
                return Future.value(false);
              }
            }
            return Future.value(true);
          },
          child: SingleChildScrollView(
            child: Obx(() => Padding(
                padding: pH8,
                child: FormBuilder(
                    key: formKey,
                    child: Column(children: [
                      Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          //* PROFILE IMAGE
                          buildProfileImage(),
                          //*BUTTON TO PICK IMAGE
                          Positioned(bottom: 0, right: 0, child: cameraButton())
                        ],
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: outlinedBtn(
                              regCtrl.isFieldEnable.value ? "Update" : "Edit",
                              onTap: () {
                            regCtrl.setIsFieldEnable("Profile");
                            if (!regCtrl.isFieldEnable.value) {
                              if (formKey.currentState!.validate()) {
                                UserModel userModel = UserModel(
                                  userName: regCtrl.nameCtrl.text,
                                  phoneNumber: regCtrl.phoneNumCtrl.text,
                                  email: regCtrl.emailIdCtrl.text,
                                  addressLine1: regCtrl.addressLine1Ctrl.text,
                                  addressLine2: regCtrl.addressLine2Ctrl.text,
                                  city: regCtrl.cityCtrl.text,
                                  state: regCtrl.stateCtrl.text,
                                  pincode: regCtrl.pincodeCtrl.text,
                                  landmark: regCtrl.landmarkCtrl.text,
                                );
                                database.updateUserProfile(userModel);
                              } else {
                                regCtrl.setIsFieldEnable("Profile");
                              }
                            }
                          })),
                      ProfileListTileWidget(
                        title: "Name",
                        leading: Icons.person,
                        subtitle: regCtrl.isFieldEnable.value
                            ? UnderLinedTextFormField(
                                name: "Name",
                                controller: regCtrl.nameCtrl,
                                hintText: "Name",
                                enables: regCtrl.isFieldEnable.value,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              )
                            : Text("${regCtrl.firestoreUser.value!.userName}",
                                style: textStyle),
                      ),
                      ProfileListTileWidget(
                        title: "Email",
                        leading: Icons.email_rounded,
                        subtitle: regCtrl.isFieldEnable.value
                            ? UnderLinedTextFormField(
                                name: "Email",
                                controller: regCtrl.emailIdCtrl,
                                hintText: "Email",
                                enables: regCtrl.isFieldEnable.value,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              )
                            : Text("${regCtrl.firestoreUser.value!.email}",
                                style: textStyle),
                      ),
                      ProfileListTileWidget(
                        title: "Phone number",
                        leading: Icons.phone_android,
                        subtitle: regCtrl.isFieldEnable.value
                            ? UnderLinedTextFormField(
                                name: "Phone",
                                controller: regCtrl.phoneNumCtrl,
                                hintText: "Phone number",
                                enables: regCtrl.isFieldEnable.value,
                                keyboardType: TextInputType.number,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  // FormBuilderValidators.max(context, 10),
                                  FormBuilderValidators.minLength(10)
                                ]),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              )
                            : Text(
                                "${regCtrl.firestoreUser.value!.phoneNumber}",
                                style: textStyle),
                      ),
                      ProfileListTileWidget(
                        title: "AddressLine1",
                        leading: Icons.location_city,
                        subtitle: regCtrl.isFieldEnable.value
                            ? UnderLinedTextFormField(
                                name: "AddressLine1",
                                controller: regCtrl.addressLine1Ctrl,
                                hintText: "AddressLine1",
                                enables: regCtrl.isFieldEnable.value,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              )
                            : Text(
                                "${regCtrl.firestoreUser.value!.addressLine1}",
                                style: textStyle),
                      ),
                      ProfileListTileWidget(
                        title: "AddressLine2",
                        leading: Icons.location_city_rounded,
                        subtitle: regCtrl.isFieldEnable.value
                            ? UnderLinedTextFormField(
                                name: "AddressLine2",
                                controller: regCtrl.addressLine2Ctrl,
                                hintText: "AddressLine2",
                                enables: regCtrl.isFieldEnable.value,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              )
                            : Text(
                                "${regCtrl.firestoreUser.value!.addressLine2}",
                                style: textStyle),
                      ),
                      ProfileListTileWidget(
                        title: "City",
                        leading: Icons.stadium,
                        subtitle: regCtrl.isFieldEnable.value
                            ? UnderLinedTextFormField(
                                name: "City",
                                controller: regCtrl.cityCtrl,
                                hintText: "City",
                                enables: regCtrl.isFieldEnable.value,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              )
                            : Text("${regCtrl.firestoreUser.value!.city}",
                                style: textStyle),
                      ),
                      ProfileListTileWidget(
                        title: "State",
                        leading: Icons.star_outline,
                        subtitle: regCtrl.isFieldEnable.value
                            ? UnderLinedTextFormField(
                                name: "State",
                                controller: regCtrl.stateCtrl,
                                hintText: "State",
                                enables: regCtrl.isFieldEnable.value,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              )
                            : Text("${regCtrl.firestoreUser.value!.state}",
                                style: textStyle),
                      ),
                      ProfileListTileWidget(
                        title: "Pincode",
                        leading: Icons.location_pin,
                        subtitle: regCtrl.isFieldEnable.value
                            ? UnderLinedTextFormField(
                                name: "Pincode",
                                controller: regCtrl.pincodeCtrl,
                                hintText: "Pincode",
                                enables: regCtrl.isFieldEnable.value,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              )
                            : Text("${regCtrl.firestoreUser.value!.pincode}",
                                style: textStyle),
                      ),
                      ProfileListTileWidget(
                        title: "landmark",
                        leading: Icons.location_pin,
                        subtitle: regCtrl.isFieldEnable.value
                            ? UnderLinedTextFormField(
                                name: "landmark",
                                controller: regCtrl.landmarkCtrl,
                                hintText: "landmark",
                                enables: regCtrl.isFieldEnable.value,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              )
                            : Text("${regCtrl.firestoreUser.value!.landmark}",
                                style: textStyle),
                      ),
                    ])))),
          )),
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

  Widget cameraButton() {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          Container(
            width: getWidth,
            height: 150.w,
            decoration: BoxDecoration(
                color: cardBgColor1,
                borderRadius: BorderRadius.vertical(top: Radius.circular(s12))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                    regCtrl.pickProfileImage(source: ImageSource.camera);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(cameraSvg, width: 50.w),
                      Text("Camera"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    regCtrl.pickProfileImage(source: ImageSource.gallery);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(gallerySvg, width: 50.w),
                      Text("Gallery"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        width: 35.w,
        height: 35.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: primaryColor,
            border: Border.all(color: whiteColor, width: 3),
            shape: BoxShape.circle),
        child: Icon(
          Icons.camera_enhance,
          color: whiteColor,
          size: fs20,
        ),
      ),
    );
  }
}
