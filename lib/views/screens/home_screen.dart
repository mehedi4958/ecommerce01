import 'package:e_commerce_01/views/widgets/custom_app_bar.dart';
import 'package:e_commerce_01/views/widgets/search_input.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          CustomAppBar(),
          SearchInput(),
        ],
      ),
    );
  }
}
