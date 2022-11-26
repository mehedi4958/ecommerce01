import 'package:e_commerce_01/views/widgets/order_item.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  static const String id = 'orderScreen';

  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return const OrderItem();
        },
      ),
    );
  }
}
