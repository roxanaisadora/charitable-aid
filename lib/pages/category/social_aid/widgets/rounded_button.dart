import 'package:ac/providers/provider_donation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoundedButton extends StatelessWidget {
  final String? postTitle;
  final String? category;
  final double? donationAmount;
  const RoundedButton({
    Key? key,
    required this.onPressed,
    this.postTitle,
    this.category,
    this.donationAmount,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<ProductoProvider>(context);
    final nombreController = postTitle;
    final categoriaController = category;
    final precioController = '$donationAmount';
    return MaterialButton(
      minWidth: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.greenAccent.shade700,
      onPressed: () {
        productoProvider.insertProduct(
          nombreController,
          categoriaController,
          precioController,
        );
      },
      child: const Text(
        'Donar Ahora',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
