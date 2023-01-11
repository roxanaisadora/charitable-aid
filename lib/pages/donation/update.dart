
import 'package:ac/pages/category/social_aid/donation_screen.dart';
import 'package:ac/pages/category/social_aid/page_form/textfild.dart';
import 'package:ac/providers/provider_supabase_help.dart';
import 'package:ac/services/dato_supabase_help.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class LugarPage extends StatelessWidget {
  const LugarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final helpService = Provider.of<HelpSeresvice>(context);
    return ChangeNotifierProvider(
      create: (_) => HelpFormProvider(helpService.seleccionarLugar2),
      child: lugarFormPage(helpService: helpService),
    );
  }
}

class lugarFormPage extends StatelessWidget {
  final HelpSeresvice helpService;

  const lugarFormPage({super.key, required this.helpService});

  _onBasicAlertPressed(context) {
    Alert(
      context: context,
      title: "Muchas Gracias",
      desc: "Por participar con nosotros",
      image: Image.asset("assets/image/amigos.jpg"),
      buttons: [
        DialogButton(
          // ignore: sort_child_properties_last
          child: const Text(
            "Cerrar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }
  
  @override
  Widget build(BuildContext context) {
    final lugarForm = Provider.of<HelpFormProvider>(context);
    final dato = lugarForm.help;


    return Scaffold(
      appBar: AppBar(
        title: const Text('Actualizar'),
      ),
      body: Form(
        key: lugarForm.formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DonationPostCard(
                      asset: 'https://www.trecebits.com/wp-content/uploads/2020/04/Ayuda-equipo-personas-800x445.jpg',
                      title: dato.nombre,
                      subtitle: '',
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Escoge tu horario de voluntariado',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
              const SizedBox(
                height: 10,
              ),
              PredefinedDonationButton(
                      donationAmount: const Text(
                        '07:00',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0XFF707089),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      colores: (lugarForm.dato1 == false)
                          ? Colors.white
                          : Colors.amber,
                      onPressed: () {
                        dato.hora = '07:00';
                        lugarForm.btncambiar();
                        if (lugarForm.dato1 == true) {
                          lugarForm.dato2 = false;
                          lugarForm.dato3 = false;
                          myController.text = '';
                        }
                        
                        print(myController.text);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PredefinedDonationButton(
                      donationAmount: const Text(
                        '09:00',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0XFF707089),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      colores: (lugarForm.dato2 == false)
                          ? Colors.white
                          : Colors.amber,
                      onPressed: () {
                        dato.hora = '09:00';
                        lugarForm.btncambiar2();
                        if (lugarForm.dato2 == true) {
                          lugarForm.dato3 = false;
                          lugarForm.dato1 = false;
                          myController.text = '';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PredefinedDonationButton(
                      colores: (lugarForm.dato3 == false)
                          ? Colors.white
                          : Colors.amber,
                      donationAmount: const Text(
                        '11:00',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0XFF707089),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        dato.hora = '11:00';
                        lugarForm.btncambiar3();
                        if (lugarForm.dato3 == true) {
                          lugarForm.dato2 = false;
                          lugarForm.dato1 = false;
                          myController.text = '';
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          helpService.crearOactualizar(lugarForm.help);
          Navigator.pushNamed(context, '/home');
          _onBasicAlertPressed(context);
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}