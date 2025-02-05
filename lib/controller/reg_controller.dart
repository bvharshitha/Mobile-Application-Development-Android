import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/model/user_model.dart';
import 'package:gambolspark/routes/app_pages.dart';
import 'package:gambolspark/widgets/dialog_widget.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class RegController extends GetxController {
  static RegController instance = Get.find();
  final isVisible = true.obs;
  final formKey = GlobalKey<FormBuilderState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController fullNameCtrl = TextEditingController();
  TextEditingController phoneNumberCtrl = TextEditingController();

  Rxn<User> firebaseUser = Rxn<User>();

  Stream<User?> get userState => auth.authStateChanges();
  Future<User?> get getUser async => auth.currentUser;

  Rxn<UserModel> firestoreUser = Rxn<UserModel>();
  RxBool isFieldEnable = false.obs;

  @override
  void onReady() async {
    super.onReady();
    ever(firebaseUser, handleAuthChanged);
    firebaseUser.value = await getUser;
    firebaseUser.bindStream(userState);
  }

  handleAuthChanged(_firebaseUser) async {
    if (_firebaseUser != null) {
      firestoreUser.bindStream(getUserData()!);

      Get.offAllNamed(Routes.homeView);
    } else {
      Get.offAllNamed(Routes.loginView);
    }
  }

  Stream<UserModel>? getUserData() {
    if (firebaseUser.value?.uid != null) {
      return db
          .collection('users')
          .doc(firebaseUser.value?.uid)
          .snapshots()
          .map((snapshot) => UserModel.fromMap(snapshot.data()!));
    }
  }

  void login() async {
    try {
      Dialogs.showOverlayLoading(title: "Signing In");
      //showLoading(title: "Signing In", message: "Please wait...");
      await auth.signInWithEmailAndPassword(
          email: emailCtrl.text.trim(), password: passwordCtrl.text.trim());
      emailCtrl.clear();
      passwordCtrl.clear();
    } on FirebaseAuthException catch (e) {
      Get.back();
      showToast(message: handleFirebaseAuthErrors(e));
    }
  }

  void signUp() async {
    try {
      Dialogs.showOverlayLoading(title: "Creating account");
      //  showLoading(title: "Creating account", message: "Please wait...");
      await auth
          .createUserWithEmailAndPassword(
              email: emailCtrl.text.trim(), password: passwordCtrl.text.trim())
          .then((value) async {
        UserModel userModel = UserModel(
          uid: value.user?.uid,
          email: emailCtrl.text.trim(),
          userName: fullNameCtrl.text.trim(),
          phoneNumber: phoneNumberCtrl.text.trim(),
          accountDisable: false,
        );
        database.createUser(userModel, value.user!);
      });
    } on FirebaseAuthException catch (e) {
      Get.back();
      showToast(message: handleFirebaseAuthErrors(e));
    }
  }

//* THIS WILL RETURN THE ERRORS COMING FROM FIREBASE AUTH
  String handleFirebaseAuthErrors(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return "The email you entered is already in use";
      case 'invalid-email':
        return "You have entered an invalid email";
      case 'wrong-password':
        return "Invalid password. Please try again";
      case 'user-not-found':
        return "Invalid user. Please check your email id";
      case 'weak-password':
        return "Password length must be greater than 6";
      default:
        return e.code.toString();
    }
  }

  void signOut() async {
    Get.back();
    Dialogs.showOverlayLoading(title: "Signing out");
    // showLoading(title: "Signing out", message: "Please wait");
    await auth.signOut();
  }

  isPasswordVisible() {
    isVisible.value = !isVisible.value;
  }

  //password reset email
  Future<void> sendPasswordResetEmail() async {
    try {
      Dialogs.showOverlayLoading(title: "Sending link");
      await auth.sendPasswordResetEmail(email: emailCtrl.text.trim());
      showErrorDialog(
          title: "Link sent",
          message:
              "Check your email and follow the instructions to reset your password.",
          onConfirmText: "OK",
          onConfirm: () {
            Get.offAllNamed(Routes.loginView);
          });
      emailCtrl.clear();
      passwordCtrl.clear();
    } on FirebaseAuthException catch (e) {
      Get.back();
      showToast(message: handleFirebaseAuthErrors(e));
    }
  }

  Future<void> pickProfileImage({required ImageSource source}) async {
    final _picker = ImagePicker();
    XFile? image;

    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      if (source == ImageSource.camera)
        image = await _picker.pickImage(source: ImageSource.camera);
      if (source == ImageSource.gallery)
        image = await _picker.pickImage(source: ImageSource.gallery);
      print("IMage Data $image");
      if (image != null) {
        var file = File("${image.path}");

        final filePath = file.absolute.path;
        final lastIndex = filePath.lastIndexOf(new RegExp(r'.jp'));
        final splitted = filePath.substring(0, (lastIndex));
        final outPath = "${splitted}_out${filePath.substring(lastIndex)}";
        var result = await FlutterImageCompress.compressAndGetFile(
          file.absolute.path,
          outPath,
          quality: 10,
        );
        print("result Data $result");
        var snapshot = await storage
            .ref()
            .child('pic[${firebaseUser.value?.email}]')
            .putFile(result!);
        var imageUrl = await snapshot.ref.getDownloadURL();
        database.uploadProfileImage(imageUrl);
      } else {
        showToast(message: "No image selected");
      }
    } else {
      showToast(message: "Denied by user");
    }
    update();
  }

  setIsFieldEnable(String type) {
    if (type == "Profile") isFieldEnable.value = !isFieldEnable.value;
  }

  late TextEditingController nameCtrl =
      TextEditingController(text: firestoreUser.value?.userName);
  late TextEditingController emailIdCtrl =
      TextEditingController(text: firestoreUser.value?.email);
  late TextEditingController phoneNumCtrl =
      TextEditingController(text: firestoreUser.value?.phoneNumber);
  late TextEditingController addressLine1Ctrl =
      TextEditingController(text: firestoreUser.value?.addressLine1);
  late TextEditingController addressLine2Ctrl =
      TextEditingController(text: firestoreUser.value?.addressLine2);
  late TextEditingController cityCtrl =
      TextEditingController(text: firestoreUser.value?.city);
  late TextEditingController stateCtrl =
      TextEditingController(text: firestoreUser.value?.state);
  late TextEditingController pincodeCtrl =
      TextEditingController(text: firestoreUser.value?.pincode);
  late TextEditingController landmarkCtrl =
      TextEditingController(text: firestoreUser.value?.landmark);

  TextEditingController codeCtrl = TextEditingController();
}
