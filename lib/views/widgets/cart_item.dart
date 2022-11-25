import 'package:e_commerce_01/models/cart_attribute.dart';
import 'package:e_commerce_01/provider/cart_provider.dart';
import 'package:e_commerce_01/views/screens/detail/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.productId}) : super(key: key);

  final String productId;

  @override
  Widget build(BuildContext context) {
    final cartAttr = Provider.of<CartAttribute>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    double subtotal = cartAttr.price * cartAttr.quantity;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailScreen.id, arguments: productId);
      },
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
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(cartAttr.imageUrl),
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
                        Text(
                          cartAttr.title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        IconButton(
                          onPressed: () {
                            cartProvider.removeCartItem(productId);
                          },
                          icon: const Icon(
                            CupertinoIcons.delete_left,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '\$${cartAttr.price}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        'Subtotal',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '\$${subtotal.toStringAsFixed(2)}',
                        style: const TextStyle(
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
                        onPressed: () {
                          cartProvider.reduceFromCart(productId, cartAttr.price,
                              cartAttr.title, cartAttr.imageUrl);
                        },
                        icon: const Icon(
                          CupertinoIcons.minus_rectangle_fill,
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child: Container(
                          width: 35,
                          height: 30,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              '${cartAttr.quantity}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          cartProvider.addToCart(productId, cartAttr.price,
                              cartAttr.title, cartAttr.imageUrl);
                        },
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
      ),
    );
  }
}
