import 'package:e_commerce_task/core/utils/colors_manager.dart';
import 'package:e_commerce_task/presentation/controllers/category_controller.dart';
import 'package:e_commerce_task/presentation/controllers/product_controller.dart';
import 'package:e_commerce_task/presentation/pages/product_item_details.dart';
import 'package:e_commerce_task/presentation/widgets/category_item.dart';
import 'package:e_commerce_task/presentation/widgets/delivery_discount_banner.dart';
import 'package:e_commerce_task/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/utils/styles_manager.dart';
import '../widgets/search_bar.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({super.key});

  final TextEditingController searchController = TextEditingController();
  final CategoryController categoryController = Get.find<CategoryController>();
  final ProductController productController = Get.find<ProductController>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.backgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Update the search bar to use reactive search handling
                SearchTextFieldBar(
                  searchController: searchController,
                  onSearchChanged: (value) {
                    productController.searchText.value = value;  // Update the reactive search text
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                const DeliveryDiscountBanner(),
                SizedBox(
                  height: 25.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Categories",
                    style: FontStyles.bold16black,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CategoryItem(
                      path: "assets/images/electronics.png",
                      onTapFun: () {
                        categoryController.selectedCategoryIndex.value = "electronics";
                      },
                      selected: categoryController.selectedCategoryIndex.value == "electronics",
                    ),
                    CategoryItem(
                        path: "assets/images/jewellry.png",
                        onTapFun: () {
                          categoryController.selectedCategoryIndex.value = "jewelery";
                        },
                        selected: categoryController.selectedCategoryIndex.value == "jewelery"),
                    CategoryItem(
                        path: "assets/images/man_dressed.png",
                        onTapFun: () {
                          categoryController.selectedCategoryIndex.value = "men's clothing";
                        },
                        selected: categoryController.selectedCategoryIndex.value == "men's clothing"),
                    CategoryItem(
                        path: "assets/images/women_dressed.png",
                        onTapFun: () {
                          categoryController.selectedCategoryIndex.value = "women's clothing";
                        },
                        selected: categoryController.selectedCategoryIndex.value == "women's clothing"),
                  ],
                )),
                SizedBox(height: 25.w),
                Obx(() {
                  // If no products are available
                  if (productController.products.isEmpty) {
                    return const Center(child: Text('No products available.'));
                  } else {
                    // Filter products by category and search query
                    List filteredProducts = productController.products
                        .where((product) =>
                    product.category == categoryController.selectedCategoryIndex.value &&
                        product.title.toLowerCase().contains(productController.searchText.value.toLowerCase()))
                        .toList();
            
                    return SizedBox(
                      height: 300.h,
                      child: GridView.builder(
                        padding: EdgeInsets.all(10.w),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                          childAspectRatio: 0.5,
                        ),
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, index) {
                          final product = filteredProducts[index];
                          return GestureDetector(
                            onTap: () => Get.to(() => ProductItemDetails(product: product)),
                            child: ProductItemWidget(product: product),
                          );
                        },
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
