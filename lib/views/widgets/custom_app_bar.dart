import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Howdy, What are you\n looking for?  ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '👀',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.grey,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
