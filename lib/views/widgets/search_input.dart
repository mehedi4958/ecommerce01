import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: TextField(
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
