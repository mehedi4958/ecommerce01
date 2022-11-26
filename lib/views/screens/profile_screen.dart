import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_01/constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _name;
  String? _email;

  void getUserData() async {
    DocumentSnapshot userData = await fireStore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .get();

    setState(() {
      _name = userData.get('username');
      _email = userData.get('email');
    });
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_name'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await firebaseAuth.signOut();
          },
          child: const Text(
            'Sign out',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
