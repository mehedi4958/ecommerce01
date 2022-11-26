import 'package:e_commerce_01/provider/order_provider.dart';
import 'package:e_commerce_01/provider/products.dart';
import 'package:e_commerce_01/views/widgets/all_products.dart';
import 'package:e_commerce_01/views/widgets/category.dart';
import 'package:e_commerce_01/views/widgets/category_list.dart';
import 'package:e_commerce_01/views/widgets/custom_app_bar.dart';
import 'package:e_commerce_01/views/widgets/search_input.dart';
import 'package:e_commerce_01/views/widgets/tag_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Products>(context);
    productProvider.fetchProducts();
    final orderProvider = Provider.of<Orders>(context);
    orderProvider.fetchOrders();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            const SearchInput(),
            const TagList(),
            const Category(),
            const CategoryList(),
            AllProducts(),
          ],
        ),
      ),
    );
  }
}
