import 'package:e_commerce_01/models/cart_attribute.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartAttribute> _cartItems = {};

  Map<String, CartAttribute> get getCartItems {
    return {..._cartItems};
  }

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void addToCart(
      String productId, double price, String title, String imageUrl) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (existingCartItem) => CartAttribute(
            id: existingCartItem.id,
            title: existingCartItem.title,
            quantity: existingCartItem.quantity + 1,
            price: existingCartItem.price,
            imageUrl: existingCartItem.imageUrl),
      );
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => CartAttribute(
            id: DateTime.now().toString(),
            title: title,
            quantity: 1,
            price: price,
            imageUrl: imageUrl),
      );
    }
    notifyListeners();
  }

  void reduceFromCart(
      String productId, double price, String title, String imageUrl) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (existingCartItem) => CartAttribute(
            id: existingCartItem.id,
            title: existingCartItem.title,
            quantity: existingCartItem.quantity - 1,
            price: existingCartItem.price,
            imageUrl: existingCartItem.imageUrl),
      );
    }
    notifyListeners();
  }

  void removeCartItem(productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearCartData() {
    _cartItems.clear();
    notifyListeners();
  }
}
