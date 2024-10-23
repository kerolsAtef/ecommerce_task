import 'package:e_commerce_task/core/utils/colors_manager.dart';
import 'package:e_commerce_task/core/utils/styles_manager.dart';
import 'package:e_commerce_task/presentation/controllers/cart_controller.dart';
import 'package:e_commerce_task/presentation/pages/product_list.dart';
import 'package:e_commerce_task/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:e_commerce_task/presentation/controllers/bottom_nav_controller.dart';

import 'cart.dart';

class HomeScreen extends StatelessWidget {
  final BottomNavController bottomNavController = Get.put(BottomNavController());
  final cartController=Get.find<CartController>();

  // List of pages to show when different tabs are selected
  final List<Widget> pages = [
    ProductListPage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      appBar: CustomAppBar(
        title: 'Riyadh City, Saudi Arabia',
      ),
      body: Obx(() => pages[bottomNavController.selectedIndex.value]),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          currentIndex: bottomNavController.selectedIndex.value,
          onTap: (index) {
            bottomNavController.changeIndex(index);
          },
          items:  [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  Container(
                      width:35.w,
                      height: 35.h,
                        color: Colors.transparent,
                      child: const Icon(Icons.shopping_cart)),
                  Positioned(
                      top: -3.h,
                      right: -1.w,
                      child: Text(cartController.totalCartItems>0?
                                        cartController.totalCartItems.toString():'',
                        style: FontStyles.bold13Red,
                                        ))
                ],
              ),
              label: 'Cart',
            ),
          ],
        ),
      ),
    );
  }
}
