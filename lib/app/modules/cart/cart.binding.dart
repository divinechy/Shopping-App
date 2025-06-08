import 'package:get/get.dart';
import 'package:shopping_app/app/controllers/cart_controller.dart';
import 'package:shopping_app/app/controllers/product_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<ProductController>(() => ProductController());
  }
}
