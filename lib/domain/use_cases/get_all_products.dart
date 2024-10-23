import 'package:e_commerce_task/data/repositories/product_repository.dart';
import 'package:e_commerce_task/data/models/product_model.dart';

class GetAllProducts {
  final ProductRepository repository;

  GetAllProducts(this.repository);

  Future<List<Product>> execute() async {
    try {
      List<Product> products= await repository.fetchProducts();
      print(products.length);
      return products;
    } catch (e) {
      print("exception is $e");
      return await repository.getCachedProducts();
    }
  }
}
