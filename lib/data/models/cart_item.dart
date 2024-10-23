import 'package:e_commerce_task/data/models/product_model.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity=0 });

  double get totalPrice => product.price * quantity;
}
