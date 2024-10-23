import 'package:e_commerce_task/core/utils/colors_manager.dart';
import 'package:e_commerce_task/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // If you don't want the back button
      backgroundColor: ColorsManager.white, // Customize this as needed
      elevation: 0, // Remove shadow if you want flat style
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              color:ColorsManager.discountColor,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.discount_outlined, color: ColorsManager.blackIcon),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Delivery Address",
                style:FontStyles.semiBold16grey1,
              ),
              Text(
                title,
                style: FontStyles.semiBold17black
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                  color: ColorsManager.grey.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.notification_important, color: ColorsManager.blackIcon),
              ),
              Positioned(
                  left: 28.w,
                  child: Container(
                width: 12.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: ColorsManager.red,
                  shape:  BoxShape.circle,
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
