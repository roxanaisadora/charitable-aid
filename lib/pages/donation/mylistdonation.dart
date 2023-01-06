// ignore_for_file: unnecessary_string_interpolations

import 'package:ac/pages/category/social_aid/page_form/card2.dart';
import 'package:ac/services/dato_supabase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrductoHome extends StatelessWidget {
  const PrductoHome({super.key});

  @override
  Widget build(BuildContext context) {
    final DonationService = Provider.of<DonationesService>(context);

    if (DonationService.isLoading) {
      return const Material(
        color: Colors.transparent,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(126, 105, 240, 175),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: ListView.builder(
            itemCount: DonationService.donationes.length,
            itemBuilder: (BuildContext context, int index) {
              final dato = DonationService.donationes[index];
              return CardCustom2(
                title: Text('${dato.nombre} '),
                subtitle: Text('Donacion: s/. ${dato.precio}'),
                leading: SizedBox(height: 60,width: 60,child: Image.network('${dato.image}',
                  fit: BoxFit.cover,
                ),),
              );
            },
          ),
        ),
      ),
    );
  }
}
