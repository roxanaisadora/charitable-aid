import 'package:ac/providers/provider_supabase.dart';
import 'package:ac/services/dato_supabase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

final myController = TextEditingController();

class DonationPage extends StatelessWidget {
  final String? img;
  const DonationPage({super.key, this.img});

  @override
  Widget build(BuildContext context) {
    final donationService = Provider.of<DonationesService>(context);
    return ChangeNotifierProvider(
      create: (_) => DonationFormProvider(donationService.seleccionarLugar),
      child: DonationScreen(donationService: donationService, img: img),
    );
  }
}

class DonationScreen extends StatelessWidget {
  final DonationesService donationService;
  final String? img;
  const DonationScreen({super.key, required this.donationService, this.img});

  _onBasicAlertPressed(context) {
    Alert(
      context: context,
      title: "Muchas Gracias",
      desc: "Con tu aporte estas ayudando a quien mas lo necesita",
      image: Image.asset("assets/image/amigos.jpg"),
      buttons: [
        DialogButton(
          child: Text(
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
    final donationForm = Provider.of<DonationFormProvider>(context);
    final dato = donationForm.donation;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Confirmar Donacion'),
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
                      subtitle: dato.categoria,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      '¿Cuánto Donarás?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    DonationTextField(
                      onChanged: (value) {
                        dato.precio = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PredefinedDonationButton(
                      donationAmount: Text(
                        'S/. 50',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0XFF707089),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      colores: (donationForm.dato1 == false)
                          ? Colors.white
                          : Colors.amber,
                      onPressed: () {
                        dato.precio = '50';
                        donationForm.btncambiar();
                        if (donationForm.dato1 == true) {
                          donationForm.dato2 = false;
                          donationForm.dato3 = false;
                          myController.text = '';
                        }
                        ;
                        print(myController.text);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PredefinedDonationButton(
                      donationAmount: Text(
                        'S/. 20',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0XFF707089),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      colores: (donationForm.dato2 == false)
                          ? Colors.white
                          : Colors.amber,
                      onPressed: () {
                        dato.precio = '20';
                        donationForm.btncambiar2();
                        if (donationForm.dato2 == true) {
                          donationForm.dato3 = false;
                          donationForm.dato1 = false;
                          myController.text = '';
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
                      donationAmount: Text(
                        'S/. 10',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0XFF707089),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        dato.precio = '10';
                        donationForm.btncambiar3();
                        if (donationForm.dato3 == true) {
                          donationForm.dato2 = false;
                          donationForm.dato1 = false;
                          myController.text = '';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyRoundedButton(
                      label: 'Donar',
                      onPressed: () {
                        donationService.crearOactualizar(donationForm.donation);
                        Navigator.pushNamed(context, '/home');
                        _onBasicAlertPressed(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
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
        style: TextStyle(
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
        side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AspectRatio(
              aspectRatio: 2.5,
              child: Image.network(
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
                          //'Donacion para Niños',
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
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DonationTextField extends StatelessWidget {
  final Function(String)? onChanged;
  const DonationTextField({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 200.0,
        maxHeight: 45.0,
      ),
      child: TextField(
        controller: myController,
        onChanged: onChanged!,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
          ),
          hintText: 'Ingresa monto',
          filled: true,
          fillColor: const Color.fromARGB(255, 237, 240, 249),
          border: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
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
