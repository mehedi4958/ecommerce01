import 'package:flutter/material.dart';

import '../models/products.dart';

class Products with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: 'Gucci Over Sized',
      title: 'Gucci Over Sized',
      description: 'Gucci is one of the best selling clothes in the world',
      price: 9.99,
      imageUrl: 'assets/images/arrival1.png',
      productCategoryName: 'clothes',
      quantity: 2,
    ),
    Product(
      id: 'T-Shirt Over Sized',
      title: 'T-Shirt Over Sized',
      description: 'T-Shirt is one of the best selling clothes in the world',
      price: 19.99,
      imageUrl: 'assets/images/arrival2.png',
      productCategoryName: 'clothes',
      quantity: 2,
    ),
  ];

  List<Product> get products {
    return _products;
  }
}
