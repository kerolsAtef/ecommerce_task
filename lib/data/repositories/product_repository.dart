
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce_task/data/models/product_model.dart';
import 'package:e_commerce_task/data/local_data_source/product_local_data_source.dart';
import 'package:e_commerce_task/presentation/controllers/product_controller.dart';
import 'package:get/get.dart';
import '../remote_data_source/product_remote_data_source.dart';

class ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  late StreamSubscription _streamSubscription;
  final Connectivity _connectivity = Connectivity();


  ProductRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  Future<List<Product>> fetchProducts() {
    Completer<List<Product>> completer = Completer<List<Product>>();

    _streamSubscription = _connectivity.onConnectivityChanged.listen((result) async {
      List<Product> products = [];
      if (result[0] != ConnectivityResult.none) {
        products = await remoteDataSource.fetchAllProducts();
        // Cache products locally for offline use
        await localDataSource.cacheProducts(products);
      } else {
        products = await getCachedProducts();
      }
      if (!completer.isCompleted) {
        completer.complete(products);
      }
    });
    return completer.future;
  }

  Future<List<Product>> getCachedProducts() async {
    return await localDataSource.getCachedProducts();
  }
}