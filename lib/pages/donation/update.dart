
import 'package:ac/pages/category/social_aid/page_form/textfild.dart';
import 'package:ac/providers/provider_supabase_help.dart';
import 'package:ac/services/dato_supabase_help.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LugarPage extends StatelessWidget {
  const LugarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final helpService = Provider.of<HelpSeresvice>(context);
    return ChangeNotifierProvider(
      create: (_) => HelpFormProvider(helpService.seleccionarLugar2),
      child: DonationFormPage(helpService: helpService),
    );
  }
}

class DonationFormPage extends StatelessWidget {
  final HelpSeresvice helpService;

  const DonationFormPage({super.key, required this.helpService});

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
                initialValue: dato.hora,
                hintText: 'hora',
                onChanged: (value) => dato.hora = value,
              ),

              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                maxLines: 5,
                initialValue: dato.fecha,
                hintText: 'fecha',
                onChanged: (value) => dato.fecha = value,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          helpService.crearOactualizar(lugarForm.help);
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}