import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_01/views/screens/cart_screen.dart';
import 'package:e_commerce_01/views/screens/feeds_screen.dart';
import 'package:e_commerce_01/views/screens/home_screen.dart';
import 'package:e_commerce_01/views/screens/profile_screen.dart';
import 'package:e_commerce_01/views/screens/search_screen.dart';
import 'package:e_commerce_01/views/screens/upload_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

///colors
var backgroundColor = Colors.black;
var buttonColor = Colors.black;
var buttonTextColor = Colors.white;

///Firebase
var firebaseAuth = FirebaseAuth.instance;
var fireStore = FirebaseFirestore.instance;
var firebaseStorage = FirebaseStorage.instance;

///SnackBar
showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

///Pages
List pages = [
  const HomeScreen(),
  const FeedsScreen(),
  const SearchScreen(),
  const CartScreen(),
  const UploadScreen(),
  const ProfileScreen(),
];

///Tag List
const tagList = [
  'Woman',
  'T-shirt',
  'Dress',
];
