import 'package:ac/providers/provider_supabase.dart';
import 'package:ac/services/dato_supabase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonationPage extends StatelessWidget {

  const DonationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final donationService = Provider.of<DonationesService>(context);
    return ChangeNotifierProvider(
      create: (_) => DonationFormProvider(donationService.seleccionarLugar),
      child: DonationScreen(donationService: donationService),
    );
  }
}


class DonationScreen extends StatelessWidget {
  final DonationesService donationService;
  const DonationScreen({super.key, required this.donationService});

  @override

  Widget build(BuildContext context) {
    final donationForm = Provider.of<DonationFormProvider>(context);
    final dato = donationForm.donation;
  
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmar Donacion'),
      ),
      body:Form(
        key: donationForm.formkey,
        child: SingleChildScrollView
        (child: SafeArea(
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
                  asset:
                      'https://images.unsplash.com/photo-1543269865-cbf427effbad?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
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
                  onChanged: (value) => dato.precio = value,
                ),
                const SizedBox(
                  height: 20,
                ),
                PredefinedDonationButton(
                  donationAmount: 50,
                  onPressed: () {
                    dato.precio='50';
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                PredefinedDonationButton(
                  donationAmount: 20,
                  onPressed: () {
                    dato.precio='20';
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                PredefinedDonationButton(
                  donationAmount: 10,
                  onPressed: () {
                    dato.precio='10';
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
      child: const Text(
        'Donar',
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

class DonationTextField extends StatelessWidget {
  final Function(String)? onChanged;
  const DonationTextField({
    Key? key, this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 200.0,
        maxHeight: 45.0,
      ),
      child: TextFormField(
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
  const PredefinedDonationButton({
    Key? key,
    required this.onPressed,
    required this.donationAmount,
  }) : super(key: key);
  final VoidCallback onPressed;
  final double donationAmount;

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
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          'S/. $donationAmount',
          style: const TextStyle(
            fontSize: 18,
            color: Color(0XFF707089),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
