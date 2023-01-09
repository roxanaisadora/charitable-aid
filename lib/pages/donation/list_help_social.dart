import 'package:ac/pages/category/social_aid/page_form/card.dart';
import 'package:ac/services/dato_supabase_help.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HelpSocial extends StatefulWidget {
  const HelpSocial({super.key});

  @override
  State<HelpSocial> createState() => _HelpSocialState();
}

class _HelpSocialState extends State<HelpSocial> {
  @override
  Widget build(BuildContext context) {

    final HelpService = Provider.of<HelpSeresvice>(context);

    _onAlertButtonsPressed(context, dato) {
      Alert(
        context: context,
        type: AlertType.warning,
        title: "Eliminar",
        desc: "¿Estas seguro que desea eliminar su asistencia?",
        buttons: [
          DialogButton(
            // ignore: sort_child_properties_last
            child: const Text(
              "Aceptar",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: () {
              HelpService.borrarHelp(dato);
              Navigator.pop(context);
            },
            color: Color.fromARGB(255, 74, 168, 123),
          ),
          DialogButton(
            // ignore: sort_child_properties_last
            child: const Text(
              "Cancelar",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            gradient: const LinearGradient(colors: [
              Color.fromRGBO(116, 116, 191, 1.0),
              Color.fromRGBO(52, 138, 199, 1.0),
            ]),
          )
        ],
      ).show();
    }

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
                  _onAlertButtonsPressed(context, dato);
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
