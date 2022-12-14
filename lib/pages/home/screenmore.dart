import 'package:flutter/material.dart';

class SecreenMore extends StatelessWidget {
  const SecreenMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(child: const Text('Conocer mas del perú')),
      ),
    );
    
  }
}