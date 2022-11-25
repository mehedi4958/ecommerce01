import 'package:e_commerce_01/views/widgets/cart_empty.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CartEmpty(),
    );
  }
}
