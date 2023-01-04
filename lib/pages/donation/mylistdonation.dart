
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
        color: Colors.greenAccent,
        child: ListView.builder(
          itemCount: DonationService.donationes.length,
          itemBuilder: (BuildContext context, int index) {
            final dato = DonationService.donationes[index];
            return CardCustom2(
              title: Text('${dato.nombre} | ${dato.categoria} '),
              subtitle: Text('s/. ${dato.precio}'),
            );
          },
        ),
      ),
    );
  }
}