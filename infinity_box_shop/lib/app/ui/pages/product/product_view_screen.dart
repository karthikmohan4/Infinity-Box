import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinity_box_shop/app/constants/color.dart';
import 'package:infinity_box_shop/app/controller/cart_controller.dart';
import 'package:infinity_box_shop/app/ui/pages/widgets/back_button_widget.dart';
import '../../../constants/styles.dart';

class ProductViewScreen extends StatelessWidget {
  ProductViewScreen({Key? key}) : super(key: key);
  final CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      minimum: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
            width: double.infinity,
          ),
          SizedBox(
              height: 40,
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    BackButtonWidget(),
                  ])),
          const Divider(
            thickness: 2,
          ),
          Obx(
            (() => Expanded(
                  child: SizedBox(
                    height: 110,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            height: 40,
                            width: 300,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                cartController.productDetail[1].toString(),
                                style: kBoldMediumStyle,
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 200,
                          width: 150,
                          child: Image.network(
                              cartController.productDetail[5].toString(),
                              fit: BoxFit.cover),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: gradientPrimary,
                                borderRadius: BorderRadius.circular(25)),
                            height: 40,
                            width: 220,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Price : \u{20b9} ${cartController.productDetail[2].toString()} ",
                                style: kSmallStyle,
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: gradientSecondary,
                                borderRadius: BorderRadius.circular(25)),
                            height: 180,
                            width: 290,
                            child: Text(
                              cartController.productDetail[3].toString(),
                              style: kSmallStyle,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: gradientPrimary,
                                    borderRadius: BorderRadius.circular(18)),
                                height: 30,
                                width: 120,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    "Rating:${cartController.productDetail[6]['rate'].toString()} ",
                                    style: kSmallStyle,
                                  ),
                                )),
                            Container(
                                decoration: BoxDecoration(
                                    color: gradientPrimary,
                                    borderRadius: BorderRadius.circular(18)),
                                height: 30,
                                width: 140,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    "Remaining:${cartController.productDetail[6]['count'].toString()} ",
                                    style: kSmallStyle,
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          ),
          SizedBox(
              height: 40,
              width: double.infinity,
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                // (cartController.cartItems.forEach((element) {element.id.toString().contains(cartController.productDetail[0])}));
                ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: kRed),
                    onPressed: () {
                      cartController.addToCart(
                        cartController.productDetail[0],
                        cartController.productDetail[1],
                        cartController.productDetail[2].toString(),
                      );
                    },
                    child: const Text(
                      "Add to cart",
                      style: kSmallStyle,
                    ))
              ])),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }
}
