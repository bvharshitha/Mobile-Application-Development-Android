import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';


class RegController extends GetxController {
  static RegController instance = Get.find();
  final isVisible = true.obs;
  final formKey = GlobalKey<FormBuilderState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController fullNameCtrl = TextEditingController();
  TextEditingController phoneNumberCtrl = TextEditingController();

  // Rxn<User> firebaseUser = Rxn<User>();

  // Stream<User?> get userState => auth.authStateChanges();
  // Future<User?> get getUser async => auth.currentUser;

  // Rxn<UserModel> firestoreUser = Rxn<UserModel>();
  var isAccountDisabled = false.obs;
  var deviceType = 'Home'.obs;

  @override
  void onReady() async {
    super.onReady();

    //  ever(firebaseUser, handleAuthChanged);
    //  firebaseUser.value = await getUser;
    //  firebaseUser.bindStream(userState);
    // ever(isAccountDisabled, checkAccountDisable);
  }

  /*handleAuthChanged(_firebaseUser) async {
    if (_firebaseUser != null) {
      firestoreUser.bindStream(getUserData()!);
     // isAccountDisabled.bindStream(database.getAccountDisable());
    //  Get.offAllNamed(Routes.homeView);
      //   });
    } else {
    //  Get.offAllNamed(Routes.loginView);
    }
  }*/
  isPasswordVisible() {
    isVisible.value = !isVisible.value;
  }
}
