import 'package:e_commerce_01/models/products.dart';
import 'package:e_commerce_01/views/widgets/feeds_products.dart';
import 'package:flutter/material.dart';

class FeedsScreen extends StatelessWidget {
  FeedsScreen({Key? key}) : super(key: key);

  List<Product> _products = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Feeds',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        childAspectRatio: 240 / 320,
        children: List.generate(
          _products.length,
          (index) => FeedsProducts(
            id: _products[index].id,
            title: _products[index].title,
            price: _products[index].price,
            imageUrl: _products[index].imageUrl,
          ),
        ),
      ),
    );
  }
}
