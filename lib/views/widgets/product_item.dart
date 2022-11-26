import 'package:badges/badges.dart';
import 'package:e_commerce_01/models/products.dart';
import 'package:e_commerce_01/views/screens/detail/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    return Container(
      margin: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(DetailScreen.id, arguments: product.id);
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
                        image: NetworkImage(
                          product.imageUrl,
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
                product.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 1.6,
                ),
              ),
              Text(
                '\$${product.price.toString()}',
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
