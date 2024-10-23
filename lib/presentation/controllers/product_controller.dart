import 'package:e_commerce_task/data/local_data_source/product_local_data_source.dart';
import 'package:e_commerce_task/data/remote_data_source/product_remote_data_source.dart';
import 'package:e_commerce_task/data/repositories/product_repository.dart';
import 'package:e_commerce_task/domain/use_cases/get_all_products.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  ProductRemoteDataSource productRemoteDataSource=ProductRemoteDataSource();
  ProductLocalDataSource productLocalDataSource=ProductLocalDataSource();
  late GetAllProducts getAllProducts;
  RxBool connected=true.obs;



  var products = [].obs;
  var isLoading = true.obs;
  final RxString searchText = ''.obs;


  @override
  void onInit() {
    ProductRepository productRepository=ProductRepository(remoteDataSource: productRemoteDataSource
        , localDataSource: productLocalDataSource);
    getAllProducts=GetAllProducts(productRepository);
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading.value = true;
      products.value = await getAllProducts.execute();

    } catch (e) {
      // Handle errors
    } finally {
      isLoading.value = false;
    }
  }
}
