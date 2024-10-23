import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce_task/core/utils/colors_manager.dart';
import 'package:e_commerce_task/presentation/controllers/product_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_task/presentation/controllers/bottom_nav_controller.dart';
import 'package:e_commerce_task/presentation/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/error/error_handling.dart';
import '../../core/utils/styles_manager.dart';

class BillBottomSheet extends StatelessWidget {
  final cartController = Get.find<CartController>();
  final navController = Get.find<BottomNavController>();

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.5,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 25.h),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartController.totalCartItems + 1,
                itemBuilder: (context, index) {
                  if (index == cartController.totalCartItems) {
                    return Column(
                      children: [
                        Divider(
                          thickness: 3.h,
                          color: ColorsManager.black,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Total       ${cartController.totalCartPrice} \$",
                            style: FontStyles.bold16black,
                          ),
                        )
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        Text(
                          cartController.cartItems[index].product.title,
                          style: FontStyles.bold16black,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 30.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorsManager.grey.withOpacity(0.3),
                              ),
                              child: Text(
                                "${cartController.cartItems[index].quantity}",
                                style: FontStyles.semiBold12Red,
                              ),
                            ),
                            Text(
                              "${cartController.cartItems[index].product.price} \$",
                              style: FontStyles.regular15lightGrey,
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.red,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: ColorsManager.white),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.grey.withOpacity(0.3),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 20.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () {
                          showCustomSnackbar(
                              "Confirmation",
                              "Your request confirmed successfully ",
                              SnackbarType.info);
                          cartController.clearCart();
                          navController.selectedIndex.value = 0;
                          Navigator.pop(context);
                    },
                    child: Text(
                      "Confirm",
                      style: FontStyles.bold16black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
