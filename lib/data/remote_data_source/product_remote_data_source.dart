import 'dart:convert';
import 'package:e_commerce_task/data/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDataSource {
  static const String baseUrl = "https://fakestoreapi.com";

  // Fetch all products
  Future<List<Product>> fetchAllProducts() async {
    final response = await http.get(Uri.parse("$baseUrl/products"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }


  // Fetch a single product by ID
  Future<Product> fetchProduct(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/products/$id"));
    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));

    } else {
      throw Exception("Failed to load product");
    }
  }

  // Fetch categories
  Future<List<String>> fetchCategories() async {
    final response = await http.get(Uri.parse("$baseUrl/products/categories"));
    if (response.statusCode == 200) {
      return List<String>.from(json.decode(response.body));
    } else {
      throw Exception("Failed to load categories");
    }
  }
}
