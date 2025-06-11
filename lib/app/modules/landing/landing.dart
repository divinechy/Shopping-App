import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/app/controllers/cart_controller.dart';
import 'package:shopping_app/app/routes/pages.dart';
import 'package:shopping_app/app/theme/svgs.dart';
import 'package:shopping_app/app/widgets/home.dart';
import 'package:shopping_app/app/widgets/platform_svg.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    final RxInt currentIndex = 0.obs;

    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: currentIndex.value,
          children: [
            Home(),
            SizedBox(),
            SizedBox(child: Center(child: Text('Favorites'))),
            SizedBox(child: Center(child: Text('Profile'))),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: currentIndex.value == 1 ? 0 : currentIndex.value,
          onTap: (index) {
            if (index == 1) {
              Get.toNamed(Routes.cart);
            } else {
              currentIndex.value = index;
            }
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Color(0xFF000000),
          items: [
            BottomNavigationBarItem(
              icon: PlatformSvg.asset(
                HOME,
                color:
                    currentIndex.value == 0 ? Colors.blue : Color(0xFF000000),
                width: 20,
                height: 20,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  PlatformSvg.asset(
                    CART,
                    color:
                        currentIndex.value == 1
                            ? Colors.blue
                            : Color(0xFF000000),
                    width: 20,
                    height: 20,
                  ),
                  if (cartController.cartCount > 0)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '${cartController.cartCount}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: PlatformSvg.asset(
                FAV,
                color:
                    currentIndex.value == 2 ? Colors.blue : Color(0xFF000000),
                width: 20,
                height: 20,
              ),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: PlatformSvg.asset(
                PROFILE,
                color:
                    currentIndex.value == 3 ? Colors.blue : Color(0xFF000000),
                width: 20,
                height: 20,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
