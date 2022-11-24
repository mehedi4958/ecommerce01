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
}
