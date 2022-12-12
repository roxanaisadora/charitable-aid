import 'package:ac/providers/provider_donation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<ProductoProvider>(context);
    const nombreController = 'ayuda puno';
    const categoriaController = 'ayuda social';
    const precioController = '2.85';
    return MaterialButton(
      minWidth: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.greenAccent.shade700,
      onPressed: (){
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
