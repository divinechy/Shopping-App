// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/app/data/models/cart_item.dart';
import 'package:shopping_app/app/data/models/product.dart';

class CartController extends GetxController {
  final cartItems = <CartItem>[].obs;

  int get cartCount => cartItems.fold(0, (sum, item) => sum + item.quantity);

  double get total => cartItems.fold(
    0,
    (sum, item) => sum + (item.product.price * item.quantity),
  );

  void addToCart(Product product) {
    final existingIndex = cartItems.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingIndex >= 0) {
      cartItems[existingIndex].quantity++;
    } else {
      cartItems.add(CartItem(product: product));
    }
    cartItems.refresh();
    _showCustomToast();
  }

  void _showCustomToast() {
    Get.showSnackbar(
      GetSnackBar(
        messageText: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(width: 4, color: Color(0xFF10B981)),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xFF10B981),
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 14,
                            color: Color(0xFF10B981),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Item has been added to cart',
                            style: TextStyle(
                              color: Color(0xFF374151),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'IBM Plex Sans',
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(
                            Icons.close,
                            color: Color(0xFF6B7280),
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        duration: Duration(seconds: 3),
        margin: EdgeInsets.all(16),
        borderRadius: 0,
        snackPosition: SnackPosition.TOP,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }

  void updateQuantity(String productId, int newQuantity) {
    final index = cartItems.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      if (newQuantity > 0) {
        cartItems[index].quantity = newQuantity;
        cartItems.refresh();
      } else {
        removeFromCart(productId);
        cartItems.refresh();
      }
    }
  }

  void removeFromCart(String productId) {
    cartItems.removeWhere((item) => item.product.id == productId);
    cartItems.refresh();
  }
}
