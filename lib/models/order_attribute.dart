import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderAttribute with ChangeNotifier {
  OrderAttribute({
    required this.orderId,
    required this.userId,
    this.productId,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    required this.orderDate,
  });

  final String orderId;
  final String userId;
  final String? productId;
  final String title;
  final double price;
  final String imageUrl;
  final int quantity;
  final Timestamp orderDate;
}
