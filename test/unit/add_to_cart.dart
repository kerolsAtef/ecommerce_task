import 'package:flutter_test/flutter_test.dart';
import 'package:e_commerce_task/presentation/controllers/cart_controller.dart';
import 'package:e_commerce_task/data/models/product_model.dart';

void main() {
  late CartController cartController;

  setUp(() {
    cartController = CartController();
  });

  test('should add product to cart', () {
    // Arrange
    final product = Product(
      id: 1,
      title: 'Test Product',
      price: 10.0,
      description: 'Test Description',
      category: 'Test Category',
      image: 'test.png',
      ratingRate: 4.5,
      ratingCount: 100,
    );

    // Act
    cartController.addProductToCart(product, 2);

    // Assert
    expect(cartController.cartItems.length, 1);
    expect(cartController.cartItems.first.product.title, 'Test Product');
    expect(cartController.cartItems.first.quantity, 2);
  });
}
