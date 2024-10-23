import 'package:e_commerce_task/core/utils/colors_manager.dart';
import 'package:e_commerce_task/core/utils/styles_manager.dart';
import 'package:e_commerce_task/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:e_commerce_task/presentation/controllers/cart_controller.dart';

class ProductItemWidget extends StatelessWidget {
  final Product product;
  RxInt itemQuantity=0.obs;
  final cartController = Get.find<CartController>();
  ProductItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    itemQuantity.value=cartController.getQuantityOfItem(product);
    return Container(
      margin: EdgeInsets.all(10.w),
      padding: EdgeInsets.only(top: 3.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.r,
            spreadRadius: 2.r,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 62.h,
            width: double.infinity,
            child: FadeInImage(
              placeholder: AssetImage('assets/images/placeholder_image.png'), // Placeholder image asset
              image: NetworkImage(product.image),
              fit: BoxFit.contain,
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/images/error_image.png'); // Error image to display
              },
            ),
          ),
          SizedBox(height: 2.h),
          // Product Title, Price, and Description
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  product.title,
                  style: FontStyles.bold16black,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h),
                // Price
                Text(
                  '\$${product.price.toString()}',
                  style: FontStyles.semiBold16grey1
                ),
                SizedBox(height: 2.h),
                // Description
                Text(
                  product.description,
                  style: FontStyles.regular15Black,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ),
          StarRating(
            rating: product.ratingRate,
            allowHalfRating: true,
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Obx(()=>Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    if(itemQuantity.value>0) {
                      itemQuantity.value--;
                    }
                  },
                  child: Container(width: 40.w,height: 30.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsManager.grey.withOpacity(0.3)
                    ),
                    alignment: Alignment.center,
                    child: Icon(Icons.remove, color: ColorsManager.black,),
                  ),
                ),
                SizedBox(width: 10.w,),
                Text(itemQuantity.value.toString(),style: FontStyles.bold16black,),
                SizedBox(width: 10.w,),
                GestureDetector(
                  onTap: (){
                    itemQuantity.value++;
                  },
                  child: Container(width: 40.w,height: 30.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsManager.grey.withOpacity(0.3)
                    ),
                    alignment: Alignment.center,
                    child: Icon(Icons.add, color: ColorsManager.black,),
                  ),
                )
              ],
            )),
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: ElevatedButton(
              onPressed: () {
                cartController.addProductToCart(product, itemQuantity.value);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Center(
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
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
