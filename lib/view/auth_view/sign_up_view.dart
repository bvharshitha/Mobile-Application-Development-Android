import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:gambolspark/constants/app_theme.dart';
import 'package:gambolspark/constants/assets_url.dart';
import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/widgets/button_widget.dart';
import 'package:gambolspark/widgets/dialog_widget.dart';
import 'package:gambolspark/widgets/text_field_widget.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isAgree = false;
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
            child: Column(
              children: [
                SizedBox(child: Image.asset(signUpImg), width: getWidth / 1.5),
                SizedBox(
                  width: getWidth,
                  child: FormBuilder(
                    key: regCtrl.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sign Up", style: AppTheme.tsHeading30),
                        Text("Please Sign Up to continue",
                            style: AppTheme.tsLight),
                        vSpace20,
                        TextFormFieldWidget(
                          name: "Full name",
                          hintText: "Full name",
                          labelText: "Full name",
                          prefixIcon: Icons.person_rounded,
                          controller: regCtrl.fullNameCtrl,
                          validator: FormBuilderValidators.required(),
                        ),
                        vSpace5,
                        TextFormFieldWidget(
                          name: "Mobile number",
                          hintText: "Mobile number",
                          labelText: "Mobile number",
                          prefixIcon: Icons.phone_android_rounded,
                          controller: regCtrl.phoneNumberCtrl,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(10),
                          ]),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.phone,
                        ),
                        vSpace5,
                        TextFormFieldWidget(
                          name: "Email ID",
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
                              name: "Password",
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
                        vSpace10,
                        elevatedButton("Sign Up", onTap: () {
                          if (isAgree) {
                            regCtrl.formKey.currentState?.save();
                            if (regCtrl.formKey.currentState!.validate()) {
                              // regCtrl.signUp();
                            } else {
                              print("validation failed");
                            }
                          } else {
                            showErrorToast(
                                message: "Please check the Privacy Policy");
                          }
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
