import 'package:e_commerce_task/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showCustomSnackbar(String title, String message, SnackbarType type) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM, // Show at the bottom of the screen
    backgroundColor: _getSnackbarColor(type),
    icon: Icon(
      _getSnackbarIcon(type),
      color: ColorsManager.white,
    ),
    colorText: Colors.white,
    borderRadius: 8,
    margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
    duration: const Duration(seconds: 3),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}

enum SnackbarType { warning, info, error }

Color _getSnackbarColor(SnackbarType type) {
  switch (type) {
    case SnackbarType.warning:
      return Colors.orangeAccent;
    case SnackbarType.info:
      return Colors.blueAccent;
    case SnackbarType.error:
      return Colors.redAccent;
    default:
      return Colors.black;
  }
}

IconData _getSnackbarIcon(SnackbarType type) {
  switch (type) {
    case SnackbarType.warning:
      return Icons.warning_amber_rounded;
    case SnackbarType.info:
      return Icons.info_outline;
    case SnackbarType.error:
      return Icons.error_outline;
    default:
      return Icons.info_outline;
  }
}
