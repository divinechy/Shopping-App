import 'package:get/get.dart';
import 'package:shopping_app/app/modules/cart/cart.binding.dart';
import 'package:shopping_app/app/modules/cart/cart.dart';
import 'package:shopping_app/app/modules/landing/landing.dart';
import 'package:shopping_app/app/modules/landing/landing_binding.dart';
import 'package:shopping_app/app/modules/product/product_binding.dart';
import 'package:shopping_app/app/modules/product/product_detail.dart';

part 'routes.dart';

class Pages {
  Pages._();

  static const initial = Routes.landing;

  static final routes = [
    GetPage(
      name: Routes.landing,
      page: () => Landing(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: Routes.productDetail,
      page: () => ProductDetail(),
      binding: ProductBinding(),
    ),
    GetPage(name: Routes.cart, page: () => Cart(), binding: CartBinding()),
  ];
}
