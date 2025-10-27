import 'package:flutter/material.dart';

import 'category/categorydetails.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Home"))),
      body: CategoryDetails(),
    );
  }
}
