import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinity_box_shop/app/constants/color.dart';
import 'package:infinity_box_shop/app/constants/styles.dart';
import 'package:infinity_box_shop/app/controller/cart_controller.dart';
import '../../../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            minimum: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 10,
                width: double.infinity,
              ),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                          height: 40,
                          width: 90,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "Shop-Zone",
                              style: kSmallStyle,
                            ),
                          )),
                      InkWell(
                        onTap: () => Get.toNamed(Routes.cart),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Container(
                            height: 50,
                            width: 50,
                            padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: kGreen),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Row(children: [
                                const Icon(
                                  Icons.shopping_cart_rounded,
                                  size: 30,
                                ),
                                Obx(
                                  () => (cartController.cartItems.length > 9)
                                      ? const Text("9+", style: kSmallStyle)
                                      : Text(
                                          cartController.cartItems.length
                                              .toString(),
                                          style: kSmallStyle),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              const Divider(
                thickness: 2,
              ),
              Obx((() => Expanded(
                    child: GridView.builder(
                        itemCount: cartController.products.length,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 6.0,
                                crossAxisSpacing: 2.0),
                        itemBuilder: ((context, index) {
                          const CircularProgressIndicator();
                          return Container(
                            height: 70,
                            width: 80,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: gradientPrimary, width: 2)),
                            child: InkWell(
                              onTap: (() => cartController.fetchProductDetial(
                                  cartController.products[index].id
                                      .toString())),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    height: 70,
                                    width: 60,
                                    child: Image.network(
                                      cartController.products[index].image,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 140,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        cartController.products[index].title,
                                        style: kTinyStyle,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 80,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        " \u{20B9}${cartController.products[index].price}",
                                        style: kTinyStyle,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })),
                  )))
            ])));
  }
}
