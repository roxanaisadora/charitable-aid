
import 'package:ac/providers/provider_supabase_help.dart';
import 'package:ac/services/dato_supabase_help.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class TimePage extends StatelessWidget {
  final String? img;
  final String? lugar;
  final int id;
  final int asistiran;
  const TimePage({super.key, this.img, this.lugar, required this.id, required this.asistiran});

  @override
  Widget build(BuildContext context) {
    final helpService = Provider.of<HelpSeresvice>(context);
    return ChangeNotifierProvider(
      create: (_) => HelpFormProvider(helpService.seleccionarLugar2),
      child: DonationScreen(helpService: helpService, img: img, lugar: lugar, id:id, asistiran:asistiran),
    );
  }
}

class DonationScreen extends StatelessWidget {
  final HelpSeresvice helpService;
  final String? img;
  final String? lugar;
  final int id;
  final int asistiran;
  const DonationScreen({super.key, required this.helpService, this.img, this.lugar, required this.id, required this.asistiran});

  _onBasicAlertPressed(context) {
    Alert(
      context: context,
      title: "Muchas Gracias",
      desc: "Por participar con nosotros",
      image: Image.asset("assets/image/amigos.jpg"),
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          width: 120,
          child: const Text(
            "Cerrar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    final donationForm = Provider.of<HelpFormProvider>(context);
    final dato = donationForm.help;
    int asistiranfinal = 1;

    Future<String> updateDonation() async {
    final String msg;
    String apikey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwanV1eXl2YnFsam1vZW9qd2FnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwNTM4MDIsImV4cCI6MTk4NjYyOTgwMn0.6lULs4mfwr7jw4nBNFCmGjEPxD90rsL5ZPAq4rJVP2o';
    String autorizacion = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwanV1eXl2YnFsam1vZW9qd2FnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwNTM4MDIsImV4cCI6MTk4NjYyOTgwMn0.6lULs4mfwr7jw4nBNFCmGjEPxD90rsL5ZPAq4rJVP2o';
    Map<String,String> header = {
          'apikey':apikey,
          'Authorization':autorizacion,
          'Content-Type': 'application/json; charset=UTF-8'
        };
     print('entro');
    final response = await http.put(
      Uri.parse('https://qpjuuyyvbqljmoeojwag.supabase.co/rest/v1/search?id=eq.${id}'),
      headers:header,
      body: jsonEncode(<String, dynamic>{
        'id': id,
        'asistiran':asistiranfinal ,
      }),
    );
    print(response.statusCode);
    
    if (response.statusCode == 204) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print('se actualizo');
      msg = 'Se actualizo';
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      msg = 'no se actualizo';
    }
    return msg;
  }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Confirmar Voluntariado'),
        ),
        body: Form(
          key: donationForm.formkey,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ).copyWith(
                  bottom: 0,
                ),
                child: Column(
                  children: [
                    DonationPostCard(
                      asset: '$img',
                      title: dato.nombre,
                      subtitle: '$lugar',
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
                    PredefinedDonationButton(
                      donationAmount: const Text(
                        '07:00',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0XFF707089),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      colores: (donationForm.dato1 == false)
                          ? Colors.white
                          : Colors.amber,
                      onPressed: () {
                        dato.hora = '07:00';
                        donationForm.btncambiar();
                        if (donationForm.dato1 == true) {
                          donationForm.dato2 = false;
                          donationForm.dato3 = false;
                         
                        }
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
                      colores: (donationForm.dato2 == false)
                          ? Colors.white
                          : Colors.amber,
                      onPressed: () {
                        dato.hora = '09:00';
                        donationForm.btncambiar2();
                        if (donationForm.dato2 == true) {
                          donationForm.dato3 = false;
                          donationForm.dato1 = false;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PredefinedDonationButton(
                      colores: (donationForm.dato3 == false)
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
                        donationForm.btncambiar3();
                        if (donationForm.dato3 == true) {
                          donationForm.dato2 = false;
                          donationForm.dato1 = false;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    MyRoundedButton(
                      label: 'Vamos a ayudar',
                      onPressed: () {
                        print(asistiranfinal);
                        asistiranfinal = asistiran + 1;
                        updateDonation();
                        helpService.crearOactualizar(donationForm.help);
                        Navigator.pushNamed(context, '/search');
                        _onBasicAlertPressed(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      );
  }
}

class MyRoundedButton extends StatelessWidget {
  const MyRoundedButton({
    Key? key,
    required this.label,
    this.color = Colors.greenAccent,
    this.onPressed,
  }) : super(key: key);

  final String label;
  final Color color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 160,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: color,
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class DonationPostCard extends StatelessWidget {
  const DonationPostCard({
    Key? key,
    required this.asset,
    required this.title,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);
  final String asset;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: AspectRatio(
              aspectRatio: 2.5,
              child: Image.network(
                //'https://images.unsplash.com/photo-1543269865-cbf427effbad?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                asset,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          //'Donacion para Ni??os',
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF61627D),
                          ),
                        ),
                        Text(
                          //'Social Aid',
                          subtitle,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFFAFAEBE),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: onTap,
                  child: Container(
                    height: 36,
                    width: 36,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0XFFF9FAFE),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: Color(0XFF575E7D),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PredefinedDonationButton extends StatelessWidget {
  final Color? colores;
  const PredefinedDonationButton({
    Key? key,
    required this.onPressed,
    required this.donationAmount,
    this.colores,
  }) : super(key: key);
  final VoidCallback onPressed;
  final Widget donationAmount;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      borderRadius: BorderRadius.circular(16),
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
          alignment: Alignment.center,
          width: 200,
          height: 45,
          decoration: BoxDecoration(
            color: colores,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(16),
          ),
          child: donationAmount),
    );
  }
}
