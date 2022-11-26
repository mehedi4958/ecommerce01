import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
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
                  image: AssetImage('assets/images/arrival1.png'),
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
                          'Gucci',
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
                        '100',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
