import 'package:ac/models/modelo_supabase.dart';
import 'package:ac/services/dato_supabase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoundedButton extends StatelessWidget {
  final String ? postTitle;
  final String ? category;
  final double ? donationAmount;
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
    final donationService = Provider.of<DonationesService>(context);
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
         donationService.seleccionarLugar = Donation(categoria: '$category', nombre: '$postTitle', precio:'$donationAmount');
          Navigator.pushNamed(context, 'page_pago');
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