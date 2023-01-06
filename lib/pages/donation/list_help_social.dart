import 'package:ac/pages/category/social_aid/page_form/card.dart';
import 'package:ac/services/dato_supabase_help.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HelpSocial extends StatefulWidget {
  const HelpSocial({super.key});

  @override
  State<HelpSocial> createState() => _HelpSocialState();
}

class _HelpSocialState extends State<HelpSocial> {
  @override
  Widget build(BuildContext context) {

    final HelpService = Provider.of<HelpSeresvice>(context);

    if (HelpService.isLoading) {
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
            itemCount: HelpService.helpes.length,
            itemBuilder: (BuildContext context, int index) {
              final dato = HelpService.helpes[index];
              return CardCustom(
                onPressed: () {
                  HelpService.borrarHelp(dato);
                },
                onTap: () {
                  HelpService.seleccionarLugar2 =
                      HelpService.helpes[index].copyWith();

                  Navigator.pushNamed(context, 'page_update');
                },
                title: Text('${dato.nombre} '),
                subtitle: Text('${dato.hora} | ${dato.fecha}'),
              );
            },
          ),
        ),
      ),
    );
  }
}
