import 'package:get/get.dart';
import 'package:infinity_box_shop/app/bindings/cart_bindings.dart';
import 'package:infinity_box_shop/app/ui/pages/cart/cart_screen.dart';
import 'package:infinity_box_shop/app/ui/pages/home/home_screen.dart';
import 'package:infinity_box_shop/app/ui/pages/product/product_view_screen.dart';
import '../ui/pages/splash/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
        name: Routes.home, page: () => HomeScreen(), binding: CartBinding()),
    GetPage(
        name: Routes.productView,
        page: () => ProductViewScreen(),
        binding: CartBinding()),
    GetPage(
        name: Routes.cart, page: () => CartScreen(), binding: CartBinding()),
  ];
}
