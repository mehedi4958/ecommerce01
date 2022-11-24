import 'package:e_commerce_01/models/clothes.dart';
import 'package:e_commerce_01/views/widgets/product_item.dart';
import 'package:flutter/material.dart';

class AllProducts extends StatelessWidget {
  AllProducts({Key? key}) : super(key: key);

  final clotheList = Clothes.generateClothes();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 280,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ProductItem(
                clothes: clotheList[index],
                index: index,
              ),
              separatorBuilder: (_, index) => const SizedBox(
                width: 5,
              ),
              itemCount: clotheList.length,
            ),
          ),
        ],
      ),
    );
  }
}
