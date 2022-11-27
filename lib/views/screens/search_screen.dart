import 'package:e_commerce_01/models/products.dart';
import 'package:e_commerce_01/provider/products.dart';
import 'package:e_commerce_01/views/widgets/feeds_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> _searchedList = [];

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
        backgroundColor: Colors.white,
        title: TextField(
          controller: _searchController,
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
            suffixIcon: GestureDetector(
                onTap: () {
                  _searchController.clear();
                },
                child: const Icon(Icons.clear)),
          ),
          onChanged: (value) {
            _searchController.text.toLowerCase();
            setState(() {
              _searchedList = productData.searchQuery(_searchController.text);
            });
          },
        ),
      ),
      body: _searchedList.isEmpty
          ? const Center(
              child: Text(
                'Search Products',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 240 / 320,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: List.generate(
                _searchedList.length,
                (index) => ChangeNotifierProvider.value(
                  value: _searchedList[index],
                  child: const FeedsProducts(),
                ),
              ),
            ),
    );
  }
}
