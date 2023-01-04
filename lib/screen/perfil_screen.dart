import 'package:ac/pages/login/register.dart';
import 'package:ac/pages/login/screenlogin.dart';
import 'package:ac/providers/storage-provider.dart';
import 'package:ac/screen/ajustes_screen.dart';
import 'package:ac/share_preferences/preferences.dart';
import 'package:ac/widget/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storageprovider = Provider.of<StorageHomeProvider>(context);

    _onAlertButtonsPressed(context) {
      Alert(
        context: context,
        type: AlertType.warning,
        title: "Elige",
        desc: "Como quieres cambiar tu foto?",
        buttons: [
          DialogButton(
            child: Text(
              "Camera",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: () {
              storageprovider.activecamera();
              Navigator.pop(context);
            },
            color: Color.fromRGBO(0, 179, 134, 1.0),
          ),
          DialogButton(
            child: Text(
              "Gallery",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: () {
              storageprovider.activegallery();
              Navigator.pop(context);
            },
            gradient: LinearGradient(colors: [
              Color.fromRGBO(116, 116, 191, 1.0),
              Color.fromRGBO(52, 138, 199, 1.0),
            ]),
          )
        ],
      ).show();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text(
          'Mi Perfil',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 275,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.greenAccent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              border: Border.all(width: 5, color: Colors.white),
                              borderRadius: BorderRadius.circular(80),
                              color: Colors.white,
                            ),
                            child: (storageprovider.image == null)
                                ? Stack(
                                    clipBehavior: Clip.none,
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      const CircleAvatar(
                                        radius: 150,
                                        child: Icon(Icons.photo, size: 50),
                                      ),
                                      Positioned(
                                        bottom: -25,
                                        child: IconButton(
                                          onPressed: () =>
                                              _onAlertButtonsPressed(context),
                                          icon: Icon(
                                            Icons.camera_alt,
                                            size: 36,
                                            color: Colors.white,
                                            shadows: <Shadow>[
                                              Shadow(
                                                  color: Colors.black,
                                                  blurRadius: 15.0)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Stack(
                                    clipBehavior: Clip.none,
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      CircleAvatar(
                                        radius: 60,
                                        backgroundImage:
                                            FileImage(storageprovider.image!),
                                      ),
                                      Positioned(
                                        bottom: -25,
                                        child: IconButton(
                                          onPressed: () =>
                                              _onAlertButtonsPressed(context),
                                          icon: Icon(
                                            Icons.camera_alt,
                                            size: 36,
                                            color: Colors.white,
                                            shadows: <Shadow>[
                                              Shadow(
                                                  color: Colors.black,
                                                  blurRadius: 15.0)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              (Preferences.nombre == '')
                                  ? const Text(
                                      'Ingrese su nombre',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      Preferences.nombre,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                              const SizedBox(
                                width: 2,
                              ),
                              (Preferences.nombre == '')
                                  ? const Text(
                                      '',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      Preferences.apellido,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 40,
                          width: 125,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Colors.yellowAccent,
                            child: const Text(
                              'Editar Perfil',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AjusteScreen()),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 65,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                height: 30,
                                width: 60,
                                child: Icon(Icons.mail),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Container(
                                  height: 25,
                                  width: 200,
                                  child: const Text(
                                    'E-mail',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: SizedBox(
                                height: 35,
                                width: 260,
                                child: (Preferences.email == '')
                                    ? const Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          '-----',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      )
                                    : Text(Preferences.email,
                                        style: const TextStyle(fontSize: 15))),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                        height: 5,
                        thickness: 3,
                        color: Color.fromARGB(255, 224, 217, 217)),
                    SizedBox(
                      height: 65,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                height: 30,
                                width: 60,
                                child: Icon(Icons.phone_android),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Container(
                                  height: 25,
                                  width: 200,
                                  child: const Text(
                                    'Phone',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: SizedBox(
                                height: 35,
                                width: 260,
                                child: (Preferences.mobile == '')
                                    ? const Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          '-----',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      )
                                    : Text(Preferences.mobile,
                                        style: const TextStyle(fontSize: 15))),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                        height: 5,
                        thickness: 3,
                        color: Color.fromARGB(255, 224, 217, 217)),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Center(
                child: ListTile(
                  title: const Text(
                    'cerrar sesion',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  onTap: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const LoginScreen();
                        },
                      ),
                      (route) => false,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
