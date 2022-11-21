import 'package:e_commerce_01/models/clothes.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.clothes}) : super(key: key);

  final Clothes clothes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      clothes.imageUrl.toString(),
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
