import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gambolspark/constants/app_theme.dart';
import 'package:gambolspark/constants/color_constants.dart';

import '../constants/size_constants.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final bool isPrefix;
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
  final Widget? suffixIcon;
  final bool? autoValidate;
  final bool autofocus;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final String? initialValue;
  final Color? fillColor;
  final double? lineHeight;
  final String name;
  final bool readOnly;
  final Widget? counter;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final double? fontSize;
  final Function(String?)? onSubmitted;
  const TextFormFieldWidget({
    Key? key,
    this.labelText,
    this.hintText,
    this.isPrefix = true,
    this.onChanged,
    this.onSaved,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.isEmail,
    this.isPassword,
    this.obscureText = false,
    this.maxLength,
    this.maxLines = 1,
    this.enables = true,
    this.focusNode,
    this.decoration,
    this.prefixIcon,
    this.suffixIcon,
    this.autoValidate,
    this.autofocus = false,
    this.textInputAction,
    this.validator,
    this.autoValidateMode,
    this.initialValue,
    this.fillColor,
    this.lineHeight,
    this.name = "Enter value",
    this.readOnly = false,
    this.counter,
    this.errorText,
    this.onSubmitted,
    this.inputFormatters,
    this.fontSize,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final hintStyle = AppTheme.tsLight;
    final labelStyle = AppTheme.tsLight;
    final errorStyle =
        AppTheme.tsLight.copyWith(color: redColor, fontSize: fs12);
    return FormBuilderTextField(
      readOnly: readOnly,
      name: name,
      initialValue: initialValue,
      enabled: enables,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      autofocus: autofocus,
      obscureText: obscureText,
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      textInputAction: textInputAction,
      validator: validator,
      maxLength: maxLength,
      maxLines: maxLines,
      cursorColor: primaryColor,
      onSubmitted: onSubmitted,
      style: AppTheme.tsRegular
          .copyWith(fontSize: fontSize ?? fs14, color: blackColor),
      decoration: InputDecoration(
          counter: counter,
          contentPadding: EdgeInsets.symmetric(horizontal: s12, vertical: s12),
          filled: true,
          fillColor: fillColor ?? cardColor,
          hintText: hintText,
          hintStyle: hintStyle,
          labelText: labelText,
          labelStyle: labelStyle,
          prefixIcon: isPrefix ? Icon(prefixIcon, size: fs18) : null,
          suffixIcon: suffixIcon,
          errorStyle: errorStyle,
          errorText: errorText,
          errorMaxLines: 2),
    );
  }
}
