import 'package:ac/screen/perfil_screen.dart';
import 'package:ac/share_preferences/preferences.dart';

import 'package:ac/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class AjusteScreen extends StatefulWidget {
  const AjusteScreen({super.key});

  @override
  State<AjusteScreen> createState() => _AjusteScreenState();
}

class _AjusteScreenState extends State<AjusteScreen> {
  final imgController = TextEditingController(text: Preferences.img);
  final nombreController = TextEditingController(text: Preferences.nombre);
  final apellidoController = TextEditingController(text: Preferences.apellido);

  final emailController = TextEditingController(text: Preferences.email);
  final mobileController = TextEditingController(text: Preferences.mobile);
  @override
  Widget build(BuildContext context) {
    save() {
      Preferences.img = imgController.text;
      Preferences.nombre = nombreController.text;
      Preferences.apellido = apellidoController.text;

      Preferences.email = emailController.text;
      Preferences.mobile = mobileController.text;

      print(imgController.text);
      setState(() {});
    }

    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text('Registrar'),
        centerTitle: true,
        actions: [
          // Switch.adaptive(
          //   value: Preferences.theme,
          //   onChanged: (value) {
          //     Preferences.theme = value;
          //     final themeP = Provider.of<ProviderTheme>(context, listen: false);
          //     value ? themeP.setOscuro() : themeP.setClaro();
          //     setState(() {});
          //   },
          // )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomTextFieldWidget(
                  controller: nombreController,
                  keyboardType: TextInputType.name,
                  hintText: 'Nombre',
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                ),
                CustomTextFieldWidget(
                  controller: apellidoController,
                  keyboardType: TextInputType.name,
                  hintText: 'Apellido',
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                ),
                CustomTextFieldWidget(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Email',
                    prefixIcon: const Icon(
                      Icons.email_rounded,
                      color: Colors.grey,
                    )),
                CustomTextFieldWidget(
                  controller: mobileController,
                  keyboardType: TextInputType.number,
                  hintText: 'Cellphone',
                  prefixIcon: const Icon(
                    Icons.phone_android_rounded,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.yellowAccent,
                    child: const Text(
                      'Guardar',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    onPressed: () {
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        title: 'PERFIL',
                        text: 'Se guardo correctamente',
                        autoCloseDuration: const Duration(seconds: 2),
                      );
                      save();
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
