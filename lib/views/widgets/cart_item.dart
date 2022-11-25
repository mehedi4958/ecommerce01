import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white70,
      ),
      child: Row(
        children: [
          Container(
            width: 130,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/arrival2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Product Name',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.delete_left,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: const [
                    Text(
                      'Price',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '\$600',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Text(
                      'Subtotal',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '\$1000',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      'Ship Free',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.minus_rectangle_fill,
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: const Center(
                          child: Text(
                            '1',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_box_rounded,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
