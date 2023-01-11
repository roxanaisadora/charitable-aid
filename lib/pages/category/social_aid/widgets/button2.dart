import 'package:ac/models/modelo_supabase.dart';
import 'package:ac/pages/category/social_aid/donation2_screen.dart';
import 'package:ac/services/dato_supabase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoundedButton2 extends StatelessWidget {
  final String ? postTitle;
  final String ? img;
  final String ? category;
  final double ? donationAmount;
  final String? qr1;
  final String? qr2;
  final String? qr3;
  final String socio;
  final int numero;
  final int? id;
  final int? personas;
  const RoundedButton2({
    Key? key,
    required this.onPressed, 
    this.postTitle, 
    this.category, 
    this.donationAmount, this.img, this.qr1, this.qr2, this.qr3, required this.socio, required this.numero, this.id, this.personas,
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
         donationService.seleccionarLugar = Donation(categoria: '$category', nombre: '$postTitle', precio:'$donationAmount', image:'$img');
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DonationPage2(
              img:img,
              qr1:qr1,
              qr2:qr2,
              qr3:qr3,
              socio:socio,
              numero:numero,
              id:id!,
              personas:personas!,
              donationAmount:donationAmount!
            ),
          ),
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