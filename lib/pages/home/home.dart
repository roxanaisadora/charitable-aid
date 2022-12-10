import 'package:ac/widget/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScrean extends StatelessWidget {
  const HomeScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.greenAccent,
        elevation: 0,

      ),
       drawer: const CustomDrawerWidget(),
      body: Container(
        color: Colors.greenAccent,
        child: const Center(
          child: Text('Screen home'),
        ),
      ),
    );
  }
}