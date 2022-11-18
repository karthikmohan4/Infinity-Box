import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:infinity_box_shop/app/constants/urls.dart';
import 'package:infinity_box_shop/app/data/models/product_list_model.dart';

class ApiCall {
  Future<List<ProductList>> getProducts() async {
    try {
      final url = Uri.parse(productUrl);
      final http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        return productResponseFromJSON(response.body);
      } else {
        return [];
      }
    } catch (e) {
      Get.snackbar("Shop-Zone", e.toString());
    }
    return [];
  }

  Future getProductDetails(String id) async {
    try {
      final url = Uri.parse("$productdetailUrl$id");
      final http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        Map d = json.decode(response.body);
        List detail = d.values.toList();
        return detail;
      } else {
        return [];
      }
    } catch (e) {
      Get.snackbar("Shop-Zone", e.toString());
    }
    return [];
  }
}
