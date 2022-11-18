import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinity_box_shop/app/constants/color.dart';
import 'package:infinity_box_shop/app/constants/styles.dart';
import 'package:infinity_box_shop/app/controller/cart_controller.dart';
import '../widgets/back_button_widget.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            minimum: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        BackButtonWidget(),
                        Text(
                          "Cart",
                          style: kBoldSmallStyle,
                        ),
                        SizedBox()
                      ])),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
                width: double.infinity,
              ),
              Expanded(
                child: Obx(() => ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 6,
                        ),
                    itemCount: cartController.cartItems.length,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return Container(
                          height: 70,
                          width: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: kRed,
                              borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            title: Text(
                              "${cartController.cartItems[index].title}",
                              style: kTinyStyle,
                            ),
                            trailing: Text(
                              cartController.cartItems[index].price.toString(),
                              style: kSmallStyle,
                            ),
                            subtitle: InkWell(
                              onTap: () {
                                cartController.removeFromCart(
                                    cartController.cartItems[index].id
                                        .toString(),
                                    cartController.cartItems[index].title!,
                                    cartController.cartItems[index].price
                                        .toString());
                              },
                              child: const Text(
                                "Remove",
                                style: kSmallStyle,
                              ),
                            ),
                          ));
                    }))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(
                    () => Container(
                      height: 45,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: kGreen,
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                          " Total Price : ${cartController.totalPrice.toStringAsFixed(2)}"),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
                width: double.infinity,
              ),
            ])));
  }
}
