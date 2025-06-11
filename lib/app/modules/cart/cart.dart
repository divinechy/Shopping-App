// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/app/controllers/cart_controller.dart';
import 'package:shopping_app/app/modules/cart/cart_item_card.dart';
import 'package:shopping_app/app/widgets/app_header.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return Scaffold(
      backgroundColor: Colors.white,
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
                  child: Icon(Icons.arrow_back_ios, size: 16),
                ),
                SizedBox(width: 8),
                Text(
                  'Your Cart',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (cartController.cartItems.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 64,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Your cart is empty',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartController.cartItems[index];
                  return CartItemCard(cartItem: cartItem).paddingOnly(top: 16);
                },
              );
            }),
          ),
          Obx(
            () =>
                cartController.cartItems.isNotEmpty
                    ? Container(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(0, -2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Order Info',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Subtotal', style: TextStyle(fontSize: 16)),
                              Text(
                                '\$${cartController.total.toStringAsFixed(2)}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Shipping', style: TextStyle(fontSize: 16)),
                              Text('\$10', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '\$${(cartController.total + 10).toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.snackbar(
                                  'Success',
                                  'Checkout completed!',
                                  snackPosition: SnackPosition.TOP,
                                  backgroundColor: Colors.green.withOpacity(
                                    0.1,
                                  ),
                                  colorText: Colors.green,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Checkout (\$${(cartController.total + 10).toStringAsFixed(0)})',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    : SizedBox(),
          ),
        ],
      ),
    );
  }
}
