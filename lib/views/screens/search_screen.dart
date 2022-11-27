import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
        backgroundColor: Colors.white,
        title: TextField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            hintText: 'Search Products',
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: Container(
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                'assets/icons/search.png',
                width: 15,
              ),
            ),
            suffixIcon: const Icon(Icons.clear),
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Search a product',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
