import 'package:e_commerce_task/core/utils/colors_manager.dart';
import 'package:e_commerce_task/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryDiscountBanner extends StatelessWidget {
  const DeliveryDiscountBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          // margin: EdgeInsets.symmetric(horizontal: 12.w),
            alignment: Alignment.center,
            height: 60.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: ColorsManager.itemBackgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Delivery Now ", style: FontStyles.semiBold17black),
                Image.asset(
                  "assets/images/fire.png",
                  fit: BoxFit.cover,
                  width: 80.w,
                  height: 80.h,
                ),
                Text("Cheaper ", style: FontStyles.semiBold17black),
              ],
            ),
          );
  }
}
