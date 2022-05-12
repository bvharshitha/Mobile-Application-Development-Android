import 'package:flutter/material.dart';

class AppBarWidget extends AppBar {
  AppBarWidget(
      {Key? key,
      required Widget? title,
      Widget? leading,
      List<Widget>? action,
      bool centerTitle = true})
      : super(
            key: key,
            title: title,
            centerTitle: centerTitle,
            leading: leading,
            actions: action);
}
