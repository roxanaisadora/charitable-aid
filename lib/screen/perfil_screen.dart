import 'package:ac/pages/login/screenlogin.dart';
import 'package:ac/providers/storage-provider.dart';
import 'package:ac/screen/ajustes_screen.dart';
import 'package:ac/screen/indicator_chart.dart';
import 'package:ac/screen/pie_chart.dart';
import 'package:ac/share_preferences/preferences.dart';
import 'package:fl_chart/fl_chart.dart';
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
            // ignore: sort_child_properties_last
            child: const Text(
              "Camera",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: () {
              storageprovider.activecamera();
              Navigator.pop(context);
            },
            color: const Color.fromARGB(126, 105, 240, 175),
          ),
          DialogButton(
            // ignore: sort_child_properties_last
            child: const Text(
              "Gallery",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: () {
              storageprovider.activegallery();
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(126, 105, 240, 175),
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
                    color: Color.fromARGB(126, 105, 240, 175),
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
                                          icon: const Icon(
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
                                          icon: const Icon(
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
                            children: const [
                              SizedBox(
                                height: 30,
                                width: 60,
                                child: Icon(Icons.mail),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 3),
                                child: SizedBox(
                                  height: 25,
                                  width: 200,
                                  child: Text(
                                    'E-mail',
                                    style: TextStyle(fontSize: 15),
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
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue))),
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
                            children: const [
                              SizedBox(
                                height: 30,
                                width: 60,
                                child: Icon(Icons.phone_android),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 3),
                                child: SizedBox(
                                  height: 25,
                                  width: 200,
                                  child: Text(
                                    'Phone',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
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
                                          style: TextStyle(
                                            fontSize: 17,
                                          ),
                                        ),
                                      )
                                    : Text(Preferences.mobile,
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue))),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                        height: 0,
                        thickness: 3,
                        color: Color.fromARGB(255, 224, 217, 217)),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text('Estadisticas'),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 70, bottom: 60, right: 70, left: 70),
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: Expanded(
                          child: PieChart(
                        PieChartData(
                          borderData: FlBorderData(show: false),
                          sectionsSpace: 2,
                          centerSpaceRadius: 30,
                          sections: getSections(),
                        ),
                      )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: IndicatorsWidget(),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 40,
                width: 130,
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.red,
                    child: const Text(
                      'Cerrar Sesion',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onPressed: () => _onAlertButton(context)),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

_onAlertButton(context) {
  Alert(
    context: context,
    type: AlertType.warning,
    title: "¿Desea Cerrar Sesion?",
    buttons: [
      DialogButton(
        // ignore: sort_child_properties_last
        child: const Text(
          "Si",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const LoginScreen();
              },
            ),
            (route) => false,
          );
        },
        color: Color.fromARGB(124, 186, 56, 173),
      ),
      DialogButton(
        // ignore: sort_child_properties_last
        child: const Text(
          "No",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const PerfilScreen();
              },
            ),
            (route) => false,
          );
        },
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 116, 126, 191),
          Color.fromRGBO(52, 138, 199, 1.0),
        ]),
      )
    ],
  ).show();
}
