import 'package:flutter/material.dart';

class SecreenHelp extends StatelessWidget {
  const SecreenHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(child: const Text('Conocer mas')),
      ),
    );
    
  }
}