import 'package:e_commerce_task/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem(
      {super.key,
      required this.path,
      required this.onTapFun,
      required this.selected});
  String path;
  VoidCallback onTapFun;
  bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFun,
      child: Container(
        alignment: Alignment.center,
        width: 80.w,
        height: 100.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorsManager.grey.withOpacity(0.3),
            border: Border.all(
                color:
                    selected ? ColorsManager.borderColor : Colors.transparent,
                width: 1.sp)),
        child: Image.asset(
          path,
          width: 60.w,
          height: 60.h,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
