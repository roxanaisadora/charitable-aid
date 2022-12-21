
import 'package:ac/pages/category/social_aid/page_form/textfild.dart';
import 'package:ac/providers/provider_supabase.dart';
import 'package:ac/services/dato_supabase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LugarPage extends StatelessWidget {
  const LugarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final donationService = Provider.of<DonationesService>(context);
    return ChangeNotifierProvider(
      create: (_) => DonationFormProvider(donationService.seleccionarLugar),
      child: DonationFormPage(donationService: donationService),
    );
  }
}

class DonationFormPage extends StatelessWidget {
  final DonationesService donationService;

  const DonationFormPage({super.key, required this.donationService});

  @override
  Widget build(BuildContext context) {
    final lugarForm = Provider.of<DonationFormProvider>(context);
    final dato = lugarForm.donation;

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
              CustomTextFormField(
                initialValue: dato.nombre,
                hintText: 'Nombre',
                onChanged: (value) => dato.nombre = value,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                maxLines: 5,
                initialValue: dato.categoria,
                hintText: 'categoria',
                onChanged: (value) => dato.categoria = value,
              ),

              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                maxLines: 5,
                initialValue: dato.precio,
                hintText: 'precio',
                onChanged: (value) => dato.precio = value,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          donationService.crearOactualizar(lugarForm.donation);
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}