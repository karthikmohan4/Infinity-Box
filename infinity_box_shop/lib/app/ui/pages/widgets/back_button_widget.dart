import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinity_box_shop/app/constants/color.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      radius: 25,
      child: const InkWell(
        child: Icon(Icons.arrow_back_ios_outlined, color: kBlack),
      ),
    );
  }
}
