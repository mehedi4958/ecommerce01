import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_01/constants.dart';
import 'package:e_commerce_01/provider/cart_provider.dart';
import 'package:e_commerce_01/views/widgets/cart_empty.dart';
import 'package:e_commerce_01/views/widgets/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return cartProvider.getCartItems.isNotEmpty
        ? Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                'Cart (${cartProvider.getCartItems.length})',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    cartProvider.clearCartData();
                  },
                  icon: const Icon(
                    CupertinoIcons.trash,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: cartProvider.getCartItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ChangeNotifierProvider.value(
                  value: cartProvider.getCartItems.values.toList()[index],
                  child: CartItem(
                    productId: cartProvider.getCartItems.keys.toList()[index],
                  ),
                );
              },
            ),
            bottomSheet: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () async {
                        cartProvider.getCartItems
                            .forEach((key, orderValue) async {
                          await fireStore
                              .collection('orders')
                              .doc('11111')
                              .set({
                            'orderId': '11111',
                            'userId': firebaseAuth.currentUser!.uid,
                            'title': orderValue.title,
                            'price': orderValue.price,
                            'imageUrl': orderValue.imageUrl,
                            'quantity': orderValue.quantity,
                            'orderDate': Timestamp.now(),
                          });
                        });
                      },
                      child: const Text(
                        'Checkout',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Total:',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '\$${cartProvider.totalAmount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          )
        : const Scaffold(
            body: CartEmpty(),
          );
  }
}
