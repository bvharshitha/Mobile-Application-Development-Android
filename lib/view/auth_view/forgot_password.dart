import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';
import 'package:gambolspark/widgets/button_widget.dart';
import 'package:gambolspark/widgets/header_widget.dart';
import 'package:gambolspark/widgets/text_field_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (AppBar(
          backgroundColor: primaryColor,
        )),
        body: Padding(
            padding: EdgeInsets.all(spaceV10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const HeaderWidget(title: "Reset Password"),
                  vSpace10,
                  Form(
                    key: _formKey,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TextFormFieldWidget(
                        controller: regCtrl.emailCtrl,
                        hintText: "Email ID",
                        labelText: "Email ID",
                        prefixIcon: Icons.email,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                      ),
                    ),
                  ),
                  vSpace10,
                  Container(
                    width: 150.w,
                    child: elevatedButton("Login", onTap: () {
                      _formKey.currentState?.save();
                      if (_formKey.currentState!.validate()) {
                        regCtrl.sendPasswordResetEmail();
                      } else {
                        print("validation failed");
                      }
                    }),
                  )
                ])));
  }
}
