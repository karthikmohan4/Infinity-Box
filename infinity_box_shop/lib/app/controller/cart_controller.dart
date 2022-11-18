import 'package:get/get.dart';
import 'package:infinity_box_shop/app/data/models/cart_model.dart';
import 'package:infinity_box_shop/app/data/models/product_list_model.dart';
import 'package:infinity_box_shop/app/data/provider/provider.dart';
import '../routes/app_routes.dart';

class CartController extends GetxController {
  RxList<ProductList> products = <ProductList>[].obs;
  RxList productDetail = [].obs;
  RxList<CartItems> cartItems = <CartItems>[].obs;
  var totalPrice = 0.0.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() {
    try {
      ApiCall()
          .getProducts()
          .then((response) => products.value = response.toList());
    } catch (e) {
      Get.snackbar("Shop-Zone", e.toString());
    }
  }

  void fetchProductDetial(String id) {
    try {
      ApiCall().getProductDetails(id).then((response) {
        productDetail.value = response;
        Get.toNamed(Routes.productView);
      });
    } catch (e) {
      Get.snackbar("Shop-Zonw", e.toString());
    }
  }

  void addToCart(int id, String productName, dynamic price) {
    double amount = double.parse(price);
    var data = CartItems(id, amount, productName);
    cartItems.add(data);
    totalPrice.value += amount;
    Get.snackbar("Shop-Zone", "Added to cart");
  }

  void removeFromCart(String id, String productName, String price) {
    double amount = double.parse(price);

    cartItems.removeWhere((element) => element.id.toString() == id);
    totalPrice.value -= amount;
    cartItems.refresh();
  }
}
