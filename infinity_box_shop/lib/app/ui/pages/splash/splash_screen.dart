import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinity_box_shop/app/constants/images.dart';
import 'package:infinity_box_shop/app/constants/styles.dart';
import '../../../constants/color.dart';
import '../../../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () => Get.offAndToNamed(Routes.home),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage(
                  logo,
                ),
                height: 450,
                width: 400,
              ),
              SizedBox(
                  height: 40,
                  width: 90,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Shop-Zone",
                      style: kBoldMediumStyle,
                    ),
                  )),
              CircularProgressIndicator(
                strokeWidth: 2,
                color: kPrimaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
