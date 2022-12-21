
import 'package:ac/models/modelo_supabase.dart';
import 'package:ac/pages/category/social_aid/page_form/card.dart';
import 'package:ac/services/dato_supabase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HelpSocial extends StatelessWidget {
  const HelpSocial({super.key});

  @override
  Widget build(BuildContext context) {
    final DonationService = Provider.of<DonationesService>(context);

    if (DonationService.isLoading) {
      return const Material(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      body: Container(
        color: Colors.greenAccent,
        child: ListView.builder(
          itemCount: DonationService.donationes.length,
          itemBuilder: (BuildContext context, int index) {
            final dato = DonationService.donationes[index];
            return CardCustom(
              onPressed:(){
                DonationService.borrarDonation(dato);
              },
              onTap: () {
                DonationService.seleccionarLugar =
                    DonationService.donationes[index].copyWith();

                Navigator.pushNamed(context, 'page_update');
              },
              title: Text('${dato.nombre} | ${dato.categoria} '),
              subtitle: Text('s/. ${dato.precio}'),
            );
          },
        ),
      ),
      
    );
  }
}