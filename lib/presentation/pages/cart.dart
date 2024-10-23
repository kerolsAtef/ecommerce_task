import 'package:e_commerce_task/core/error/error_handling.dart';
import 'package:e_commerce_task/core/utils/colors_manager.dart';
import 'package:e_commerce_task/core/utils/styles_manager.dart';
import 'package:e_commerce_task/presentation/controllers/bottom_nav_controller.dart';
import 'package:e_commerce_task/presentation/controllers/cart_controller.dart';
import 'package:e_commerce_task/presentation/widgets/bill_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            height: 500.h,
            child: Obx(() {
              if (cartController.cartItems.isEmpty) {
                return Center(child: Text('Your cart is empty.'));
              }
              return ListView.builder(
                itemCount: cartController.cartItems.length, // Ensure the correct length is used
                itemBuilder: (BuildContext context, int index) {
                  var cartItem = cartController.cartItems[index];
                  var itemQuantity = cartItem.quantity.obs; // Observable quantity

                  return Dismissible(
                    background: Container(
                      width: 100.w,
                      color: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      alignment: AlignmentDirectional.centerEnd, // Align the icon to the right
                      child: Icon(
                        Icons.delete, // Basket or delete icon
                        color: Colors.white,
                        size: 30.sp,
                      ),
                    ),
                    key: Key(cartItem.product.id.toString()),
                    onDismissed: (direction) {
                      // Remove the item from the cart
                      var removedItem = cartController.cartItems.removeAt(index);
                      cartController.removeProductFromCart(removedItem.product);

                      // Optionally show a snackbar or dialog to undo the action
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${removedItem.product.title} dismissed"),
                          action: SnackBarAction(
                            label: "Undo",
                            onPressed: () {
                              // Restore the dismissed item
                              cartController.restoreProductFromCart(removedItem.product, removedItem.quantity);
                            },
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 150.h,
                      margin: EdgeInsets.symmetric(vertical: 10.h), // Added margin for spacing
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        color: ColorsManager.itemBackgroundColor,
                      ),
                      child: Row(
                        children: [
                          // Product Image
                          Container(
                            width: 120.w,
                            height: 120.h,
                            margin: EdgeInsets.all(10.w), // Added margin for image padding
                            child: FadeInImage(
                              placeholder: AssetImage('assets/images/placeholder_image.png'), // Placeholder image asset
                              image: NetworkImage(cartItem.product.image),
                              fit: BoxFit.contain,
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Image.asset('assets/images/error_image.png'); // Error image to display
                              },
                            ),
                          ),
                          // Product Info and Controls
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 10.w), // Padding on the right for controls
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Product Title with overflow handling
                                  Text(
                                    cartItem.product.title,
                                    style: FontStyles.bold16black,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 10.h),
                                  // Price and Quantity Controls
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjusted for right alignment
                                    children: [
                                      // Price
                                      Text(
                                        '\$${cartItem.product.price.toStringAsFixed(2)}',
                                        style: FontStyles.regular15Black,
                                      ),
                                      // Add/Remove Icons
                                      Row(
                                        children: [
                                          // Remove Icon
                                          GestureDetector(
                                            onTap: () {
                                              if (itemQuantity.value > 1) {
                                                itemQuantity.value--;
                                                cartController.updateItemQuantity(cartItem.product, itemQuantity.value);
                                              } else {
                                                // Optionally: Remove the product if the quantity reaches zero
                                                cartController.removeProductFromCart(cartItem.product);
                                              }
                                            },
                                            child: Container(
                                              width: 30.w,
                                              height: 30.h,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: ColorsManager.grey.withOpacity(0.3),
                                              ),
                                              alignment: Alignment.center,
                                              child: Icon(
                                                Icons.remove,
                                                color: ColorsManager.black,
                                                size: 18.sp,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          // Quantity
                                          Obx(() => Text(
                                            itemQuantity.value.toString(),
                                            style: FontStyles.regular15Black,
                                          )),
                                          SizedBox(width: 10.w),
                                          // Add Icon
                                          GestureDetector(
                                            onTap: () {
                                              itemQuantity.value++;
                                              cartController.updateItemQuantity(cartItem.product, itemQuantity.value);
                                            },
                                            child: Container(
                                              width: 30.w,
                                              height: 30.h,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: ColorsManager.grey.withOpacity(0.3),
                                              ),
                                              alignment: Alignment.center,
                                              child: Icon(
                                                Icons.add,
                                                color: ColorsManager.black,
                                                size: 18.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          Visibility(
            visible: cartController.totalCartItems>0,
            child: GestureDetector(
              onTap: ()
              {
                if(cartController.totalCartItems>0)
                  {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => BillBottomSheet(),
                    );
                  }
                else
                  {
                   showCustomSnackbar("Take Care", "Cart is Empty!!!",SnackbarType.info);
                  }
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                height: 60.h,
                width: 300.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: ColorsManager.discountColor
                ),
                child: Text("Continue",style: FontStyles.bold16black,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
