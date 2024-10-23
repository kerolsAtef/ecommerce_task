import 'package:e_commerce_task/core/error/error_handling.dart';
import 'package:e_commerce_task/data/models/cart_item.dart';
import 'package:e_commerce_task/data/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  // Add product to cart
  void addProductToCart(Product product, int quantity) {
    // Check if the product already exists in the cart
    int index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index >= 0 && quantity != 0 &&  cartItems[index].quantity != quantity) {
      // Update the quantity of the existing product in the cart
      cartItems[index].quantity = quantity;
    } else if (index >= 0 && cartItems[index].quantity == quantity) {
      showCustomSnackbar("Warning", "This item is already in the cart with the same quantity", SnackbarType.warning);
    } else if (quantity == 0) {
      showCustomSnackbar("Alert", "Quantity is 0, please increase the quantity", SnackbarType.error);
    } else {
      // Add new product to the cart if it doesn't exist
      cartItems.add(CartItem(product: product, quantity: quantity));
    }
  }
  int getQuantityOfItem(Product product)
  {
    int index = cartItems.indexWhere((item) => item.product.id == product.id);
    if(index>=0)
      {
        return cartItems[index].quantity;
      }
    return 0;
  }
  void updateItemQuantity(Product product, quantity)
  {
    int index = cartItems.indexWhere((item) => item.product.id == product.id);
    if(index>=0)
    {
      cartItems[index].quantity=quantity;
    }
  }

  // Remove product from cart
  void removeProductFromCart(Product product) {
    int index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
        cartItems.removeAt(index);
      }
  }
  void restoreProductFromCart(Product product, int quantity) {
    int index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index < 0) {
      cartItems.add( CartItem(product: product, quantity: quantity));
    }
    // Trigger a UI update here if you're not using state management
    update();
  }


  // Calculate total price of the cart
  double get totalCartPrice {
    return cartItems.fold(0, (sum, item) => sum + item.totalPrice);
  }

  // Get total number of items in the cart
  int get totalCartItems => cartItems.length;

  // Clear the cart
  void clearCart() {
    cartItems.clear();
  }
}
