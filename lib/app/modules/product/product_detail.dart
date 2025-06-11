// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/app/controllers/cart_controller.dart';
import 'package:shopping_app/app/data/models/product.dart';
import 'package:shopping_app/app/theme/svgs.dart';
import 'package:shopping_app/app/widgets/app_header.dart';
import 'package:shopping_app/app/widgets/platform_svg.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    final Product product = Get.arguments;
    final Size media = Get.mediaQuery.size;

    return Scaffold(
      appBar: AppHeader(),
      body: Column(
        children: [
          SizedBox(height: 24),
          Divider(height: 1, color: Colors.grey[300]),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios, size: 16),
                      SizedBox(width: 8),
                      Text(
                        'Go back',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: media.height * 0.39,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFF8F5F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Spacer(),
                            Container(
                              height: 44,
                              width: 44,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: PlatformSvg.asset(
                                FAV,
                                fit: BoxFit.scaleDown,
                              ),
                            ).paddingOnly(right: 16, top: 16),
                          ],
                        ),
                        SizedBox(
                          height: media.height * 0.28,
                          child: Image.asset(
                            product.image,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Icon(
                                  Icons.image_not_supported,
                                  size: 80,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'About this item',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF999999),
                    ),
                  ),
                  Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF999999),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => cartController.addToCart(product),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Add to cart',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
