import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/product_controller.dart';

class SplashScreen extends StatelessWidget {
   ProductController controller = Get.find();

   SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child:  Lottie.asset('assets/jsons/loading.json'),
          );
        } else {
          Future.delayed(Duration.zero, () {
            Get.offNamed('/home');
          });
          return Container();
        }
      }),
    );
  }
}
