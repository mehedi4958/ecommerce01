import 'package:badges/badges.dart';
import 'package:e_commerce_01/models/clothes.dart';
import 'package:e_commerce_01/models/products.dart';
import 'package:e_commerce_01/provider/products.dart';
import 'package:e_commerce_01/views/screens/detail/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.clothes, required this.index})
      : super(key: key);

  final Clothes clothes;
  final int index;

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    List<Product> productList = productsProvider.products;

    return Container(
      margin: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                clothes: clothes,
              ),
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: 170,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(
                          productList[index].imageUrl.toString(),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 5,
                    top: 15,
                    child: Badge(
                      toAnimate: false,
                      shape: BadgeShape.square,
                      badgeColor: Colors.pink,
                      borderRadius: BorderRadius.circular(8),
                      badgeContent: const Text(
                        'New',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                productList[index].title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 1.6,
                ),
              ),
              Text(
                '\$${productList[index].price.toString()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
