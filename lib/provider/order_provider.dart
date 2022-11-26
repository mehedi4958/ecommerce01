import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_01/constants.dart';
import 'package:e_commerce_01/models/order_attribute.dart';
import 'package:flutter/material.dart';

class Orders with ChangeNotifier {
  List<OrderAttribute> _orders = [];

  Future<void> fetchOrders() async {
    await fireStore
        .collection('orders')
        .where('userId', isEqualTo: firebaseAuth.currentUser!.uid)
        .get()
        .then((QuerySnapshot orderSnapshot) {
      _orders = [];
      for (var element in orderSnapshot.docs) {
        _orders.insert(
          0,
          OrderAttribute(
            orderId: element.get('orderId'),
            userId: element.get('userId'),
            title: element.get('title'),
            price: element.get('price'),
            imageUrl: element.get('imageUrl'),
            quantity: element.get('quantity'),
            orderDate: element.get('orderDate'),
          ),
        );
      }
    });
    notifyListeners();
  }

  List<OrderAttribute> get orders {
    return _orders;
  }
}
