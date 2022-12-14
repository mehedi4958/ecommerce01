import 'package:e_commerce_01/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: backgroundColor,
        activeColor: buttonTextColor,
        // inactiveColor: Colors.white,
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.rss_feed, size: 30), label: 'Feeds'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 30), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag, size: 30), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.upload, size: 30), label: 'Upload'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30), label: 'Profile'),
        ],
      ),
    );
  }
}
