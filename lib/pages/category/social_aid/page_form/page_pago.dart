
import 'package:ac/providers/provider_supabase.dart';
import 'package:ac/services/dato_supabase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DonationPage extends StatelessWidget {
  const DonationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final donationService = Provider.of<DonationesService>(context);
    return ChangeNotifierProvider(
      create: (_) => DonationFormProvider(donationService.seleccionarLugar),
      child: donationFormPage(donationService: donationService),
    );
  }
}

class donationFormPage extends StatelessWidget {
  final DonationesService donationService;

  const donationFormPage({super.key, required this.donationService});

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          donationService.crearOactualizar(donationForm.donation);
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}