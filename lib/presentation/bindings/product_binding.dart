import 'package:e_commerce_task/presentation/controllers/bottom_nav_controller.dart';
import 'package:e_commerce_task/presentation/controllers/category_controller.dart';
import 'package:get/get.dart';
import 'package:e_commerce_task/presentation/controllers/product_controller.dart';
import 'package:e_commerce_task/presentation/controllers/cart_controller.dart';


class ProductBinding extends Bindings {
  @override
  void dependencies() {
    // Initialize the ProductController with the GetAllProducts use case
    Get.lazyPut<ProductController>(() => ProductController());
    // Initialize the CartController
    Get.lazyPut<CartController>(() => CartController());
    // Initialize the bottom navigation
    Get.lazyPut<BottomNavController>(() => BottomNavController());
    // Initialize the category controller
    Get.lazyPut<CategoryController>(() => CategoryController());

  }
}
