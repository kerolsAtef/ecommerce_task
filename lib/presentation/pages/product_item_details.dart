
import 'package:e_commerce_task/core/utils/colors_manager.dart';
import 'package:e_commerce_task/core/utils/styles_manager.dart';
import 'package:e_commerce_task/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/product_model.dart';

class ProductItemDetails extends StatelessWidget {

  Product product;

   ProductItemDetails({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double imageSize = screenWidth * 0.3;
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      appBar: CustomAppBar(
        title: 'Riyadh City, Saudi Arabia',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 100.h,),
            Container(
              width: imageSize,
              height: imageSize,
              margin: EdgeInsets.all(10.w),
              child: FadeInImage(
                placeholder: AssetImage('assets/images/placeholder_image.png'),
                image: NetworkImage(product.image),
                fit: BoxFit.contain,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/images/error_image.png');
                },
              ),
            ),
             SizedBox(height: 8.h),
            Text(
              product.title,
              style: FontStyles.bold16black,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: Colors.green,
                  ),
                ),
                SizedBox(width: 50.w,),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 16.sp,
                ),
                 SizedBox(width: 4.w),
                Text(
                  product.ratingRate.toString(),
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 25.h),
            Text(
              product.description,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
