import 'package:flutter/material.dart';

class CustomSnackbbar {
  static GlobalKey<ScaffoldMessengerState> msgkey =
      GlobalKey<ScaffoldMessengerState>();

  static verSnackbar(String msg) {
    final snackBar = SnackBar(
      backgroundColor: Colors.blue,
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );

    msgkey.currentState!.showSnackBar(snackBar);
  }
}