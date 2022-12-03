import 'package:flutter/material.dart';

class CategoryScrean extends StatelessWidget {
  const CategoryScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.greenAccent,
        child: Center(
          child: const Text('Screen Category'),
        ),
      ),
    );
  }
}