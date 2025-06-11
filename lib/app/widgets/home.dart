// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/app/controllers/product_controller.dart';
import 'package:shopping_app/app/modules/product/product_card.dart';
import 'package:shopping_app/app/theme/svgs.dart';
import 'package:shopping_app/app/widgets/app_header.dart';
import 'package:shopping_app/app/widgets/platform_svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();
    return Scaffold(
      appBar: AppHeader(),
      body: Column(
        children: [
          Container(
            height: 40,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                icon: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: PlatformSvg.asset(SEARCH, width: 20, height: 20),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Divider(height: 1, color: Colors.grey[300]),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios, size: 16),
                SizedBox(width: 8),
                Text(
                  'Technology',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF000000),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                ' Smartphones, Laptops &\n Accessories',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Obx(
              () => GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: productController.products.length,
                itemBuilder: (context, index) {
                  final product = productController.products[index];
                  return ProductCard(product: product);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
