import 'package:cloud_firestore/cloud_firestore.dart';
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
