// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/app/controllers/cart_controller.dart';
import 'package:shopping_app/app/data/models/cart_item.dart';
import 'package:shopping_app/app/theme/svgs.dart';
import 'package:shopping_app/app/widgets/platform_svg.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;
  CartItemCard({super.key, required this.cartItem});
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFF8F5F5),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Color(0xFFF8F5F5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                cartItem.product.image,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 24,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.product.name,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Text(
                  '\$${cartItem.product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF334155),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'In stock',
                  style: TextStyle(color: Color(0xFF10B981), fontSize: 12),
                ).paddingOnly(bottom: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:
                          () => cartController.updateQuantity(
                            cartItem.product.id,
                            cartItem.quantity - 1,
                          ),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.remove, size: 20),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Text(
                        '${cartItem.quantity}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap:
                          () => cartController.updateQuantity(
                            cartItem.product.id,
                            cartItem.quantity + 1,
                          ),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.add, size: 20),
                      ),
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: PlatformSvg.asset(
                        DELETE,
                        fit: BoxFit.scaleDown,
                        onTap:
                            () => {
                              cartController.removeFromCart(
                                cartItem.product.id,
                              ),
                            },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
