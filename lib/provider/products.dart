import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_01/constants.dart';
import 'package:flutter/material.dart';

import '../models/products.dart';

class Products with ChangeNotifier {
  List<Product> _products = [];

  Future<void> fetchProducts() async {
    await fireStore
        .collection('products')
        .get()
        .then((QuerySnapshot productSnapshot) {
      _products = [];
      for (var element in productSnapshot.docs) {
        _products.insert(
          0,
          Product(
            id: element.get('id'),
            title: element.get('title'),
            description: element.get('description'),
            price: double.parse(element.get('price')),
            imageUrl: element.get('imageUrl'),
            productCategoryName: element.get('productCategoryName'),
            quantity: int.parse(element.get('quantity')),
          ),
        );
      }
    });
  }

  List<Product> get products {
    return _products;
  }

  Product findById(String productId) {
    return _products.firstWhere((element) => element.id == productId);
  }

  List<Product> findByCategory(String categoryName) {
    List categoryList = _products
        .where((element) => element.productCategoryName
            .toLowerCase()
            .contains(categoryName.toLowerCase()))
        .toList();
    return [...categoryList];
  }

  List<Product> searchQuery(String searchText) {
    List searchedList = _products
        .where((element) =>
            element.title.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    return [...searchedList];
  }
}
