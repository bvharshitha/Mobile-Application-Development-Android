import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gambolspark/constants/color_constants.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("====LANDING VIEW====");
    return const Scaffold(
      // body: Center(child: CircularProgressIndicator()),
      body: SpinKitSquareCircle(
        color: primaryColor,
        size: 50.0,
      ),
    );
  }
}
