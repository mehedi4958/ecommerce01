import 'package:e_commerce_01/models/products.dart';
import 'package:e_commerce_01/provider/products.dart';
import 'package:e_commerce_01/views/widgets/feeds_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    List<Product> productList = productsProvider.products;

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
          productList.length,
          (index) => ChangeNotifierProvider.value(
              value: productList[index], child: const FeedsProducts()),
        ),
      ),
    );
  }
}
