import 'package:e_commerce_01/provider/order_provider.dart';
import 'package:e_commerce_01/views/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const String id = 'orderScreen';

  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<Orders>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: orderProvider.orders.length,
        itemBuilder: (BuildContext context, int index) {
          return ChangeNotifierProvider.value(
            value: orderProvider.orders[index],
            child: const OrderItem(),
          );
        },
      ),
    );
  }
}