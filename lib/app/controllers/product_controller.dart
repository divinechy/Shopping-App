import 'package:get/get.dart';
import 'package:shopping_app/app/data/models/product.dart';

class ProductController extends GetxController {
  final products =
      <Product>[
        Product(
          id: '1',
          name: 'Apple iPhone 16 128GB|Teal',
          price: 700.00,
          image: 'assets/images/iPhone.png',
          description:
              'This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers. There will be no visible cosmetic imperfections when held at an arm\'s length.',
        ),
        Product(
          id: '2',
          name: 'M4 Macbook Air 13" 256GB|Sky blue',
          price: 1000.00,
          image: 'assets/images/macbook.png',
          description:
              'Latest M4 MacBook Air with 13-inch display and 256GB storage in beautiful Sky Blue color.',
        ),
        Product(
          id: '3',
          name: 'Google Pixel 9A 128GB|Iris',
          price: 499.00,
          image: 'assets/images/pixel.png',
          description:
              'Google Pixel 9A with advanced AI features and 128GB storage in Iris color.',
        ),
        Product(
          id: '4',
          name: 'Apple Airpods 4 Active Noise Cancellation',
          price: 129.00,
          image: 'assets/images/airpods.png',
          description:
              'Apple AirPods 4 with Active Noise Cancellation for immersive audio experience.',
        ),
      ].obs;
}
