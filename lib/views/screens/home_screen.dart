import 'package:e_commerce_01/views/widgets/all_products.dart';
import 'package:e_commerce_01/views/widgets/category_list.dart';
import 'package:e_commerce_01/views/widgets/custom_app_bar.dart';
import 'package:e_commerce_01/views/widgets/search_input.dart';
import 'package:e_commerce_01/views/widgets/tag_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const SearchInput(),
          const TagList(),
          const CategoryList(),
          AllProducts(),
        ],
      ),
    );
  }
}
