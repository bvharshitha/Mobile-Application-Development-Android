import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gambolspark/constants/app_theme.dart';
import 'package:gambolspark/constants/assets_url.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/view/auth_view/forgot_password.dart';
import 'package:gambolspark/view/auth_view/sign_up_view.dart';
import 'package:gambolspark/widgets/button_widget.dart';
import 'package:gambolspark/widgets/dialog_widget.dart';
import 'package:gambolspark/widgets/text_field_widget.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormBuilderState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: SizedBox(
          width: getWidth,
          child: Padding(
            padding: pAll16,
            child: FormBuilder(
              key: formKey,
              child: Column(
                children: [
                  Image.asset(loginImg),
                  SizedBox(
                    width: getWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Login", style: AppTheme.tsHeading30),
                        Text("Please login to continue",
                            style: AppTheme.tsLight),
                        vSpace20,
                        TextFormFieldWidget(
                          hintText: "Email ID",
                          labelText: "Email ID",
                          prefixIcon: Icons.email_rounded,
                          controller: regCtrl.emailCtrl,
                          keyboardType: TextInputType.emailAddress,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ]),
                        ),

                        vSpace5,
                        Obx(() => TextFormFieldWidget(
                              controller: regCtrl.passwordCtrl,
                              hintText: "Password",
                              labelText: "Password",
                              obscureText: regCtrl.isVisible.value,
                              prefixIcon: Icons.lock,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    regCtrl.isPasswordVisible();
                                  },
                                  icon: Icon(
                                    regCtrl.isVisible.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: s25,
                                  )),
                              validator: FormBuilderValidators.required(),
                            )),
                        vSpace8,
                        //*FORGOT PASSWORD SECTION
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            child: Text("Forgot Password ?",
                                style: AppTheme.tsLight),
                            onTap: () {
                              if (regCtrl.emailCtrl.text != '') {
                                Get.to(ForgotPasswordPage());
                              } else {
                                showErrorToast(
                                    message: "Enter Email ID Properly");
                              }
                            },
                          ),
                        ),
                        vSpace10,
                        elevatedButton("Login", onTap: () {
                          formKey.currentState?.save();
                          if (formKey.currentState!.validate()) {
                            regCtrl.login();
                          } else {
                            print("validation failed");
                          }
                        }),
                        vSpace10,
                        Align(
                          alignment: Alignment.center,
                          child: Text("-------- OR --------",
                              style:
                                  AppTheme.tsLight.copyWith(color: greyColor)),
                        ),
                        vSpace10,
                        Align(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                                text: 'New to Gambol Spark ? ',
                                children: [
                                  TextSpan(
                                      text: "Sign Up",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () =>
                                            Get.to(() => const SignUpView()),
                                      style: AppTheme.tsRegular.copyWith(
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: fs14))
                                ],
                                style: AppTheme.tsLight.copyWith()),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
