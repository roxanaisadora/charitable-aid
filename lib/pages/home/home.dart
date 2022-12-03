import 'package:flutter/material.dart';

class HomeScrean extends StatelessWidget {
  const HomeScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Container(
        color: Colors.greenAccent,
        child: Center(
          child: const Text('Screen home'),
        ),
      ),
    );
  }
}