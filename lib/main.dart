import 'package:e_commerce_task/presentation/bindings/product_binding.dart';
import 'package:e_commerce_task/presentation/pages/cart.dart';
import 'package:e_commerce_task/presentation/pages/home_screen.dart';
import 'package:e_commerce_task/presentation/pages/product_list.dart';
import 'package:e_commerce_task/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return GetMaterialApp(
          initialBinding: ProductBinding(),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          getPages: [
            GetPage(name: '/productList', page:()=> ProductListPage()),
            GetPage(name: '/cart', page:()=> CartPage()),
            GetPage(name: '/', page: () => SplashScreen()),
            GetPage(name: '/home', page: () => HomeScreen()),
          ],
          theme: ThemeData.light(),
          home: child,
        );
      },
    );
  }
}

