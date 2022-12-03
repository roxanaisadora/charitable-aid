import 'package:flutter/material.dart';

class ProfileScrean extends StatelessWidget {
  const ProfileScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.greenAccent,
        child: Center(
          child: const Text('Screen profile'),
        ),
      ),
    );
  }
}