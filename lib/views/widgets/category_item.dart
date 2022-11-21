import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({Key? key}) : super(key: key);

  List<Map<String, Object>> categories = [
    {
      'categoryName': 'Phones',
      'categoryImage': 'assets/images/CatPhones.png',
    },
    {
      'categoryName': 'Clothes',
      'categoryImage': 'assets/images/CatClothes.jpg',
    },
    {
      'categoryName': 'Laptop',
      'categoryImage': 'assets/images/CatLaptops.png',
    },
    {
      'categoryName': 'Shoes',
      'categoryImage': 'assets/images/CatShoes.jpg',
    },
    {
      'categoryName': 'Watch',
      'categoryImage': 'assets/images/CatWatches.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
