import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gambolspark/constants/app_theme.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/size_constants.dart';

class UnderLinedTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? isEmail;
  final bool? isPassword;
  final bool obscureText;
  final int? maxLength;
  final int maxLines;
  final bool enables;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? autoValidate;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final String? initialValue;
  final Color? fillColor;
  final double? lineHeight;
  final String name;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  const UnderLinedTextFormField({
    this.labelText,
    this.enables = true,
    this.hintText,
    this.onChanged,
    this.onSaved,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.isEmail,
    this.isPassword,
    this.obscureText = false,
    this.maxLength,
    this.focusNode,
    this.decoration,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.autoValidateMode,
    this.autoValidate,
    this.inputFormatters,
    this.maxLines = 1,
    this.textInputAction,
    this.initialValue,
    this.fillColor,
    this.lineHeight,
    this.name = "Enter Value",
    this.readOnly = false,
  });
  @override
  @override
  Widget build(BuildContext context) {
    final hintStyle = AppTheme.tsLight.copyWith(fontSize: fs16);
    final lableStyle = AppTheme.tsRegular.copyWith(fontSize: fs14);
    final errorStyle =
        AppTheme.tsRegular.copyWith(fontSize: fs12, color: redColor);
    return FormBuilderTextField(
      readOnly: readOnly,
      name: name,
      initialValue: initialValue,
      enabled: enables,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      textInputAction: textInputAction,
      validator: validator,
      maxLength: maxLength,
      maxLines: maxLines,
      cursorColor: primaryColor,
      style: AppTheme.tsRegular.copyWith(fontSize: fs16, color: blackColor),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: s5),
        isDense: true,
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        labelStyle: lableStyle,
        errorStyle: errorStyle,
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: greenColor)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: blackColor)),
        focusedErrorBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: redColor)),
        disabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: transparent)),
        errorBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: redColor)),
      ),
    );
  }
}
