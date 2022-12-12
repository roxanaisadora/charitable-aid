

import 'package:ac/pages/home/home.dart';
import 'package:ac/pages/login/screenlogin.dart';
import 'package:ac/pages/navegacion/navigator.dart';
import 'package:ac/screen/ajustes_screen.dart';
import 'package:ac/screen/perfil_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://acegif.com/wp-content/uploads/gif/fnepanespx-20.gif'),
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  '',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavBar()),);

            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuración'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const AjusteScreen()),);

            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.person),
          //   title: const Text('Profile'),
          //   onTap: () {
          //    Navigator.push(context, MaterialPageRoute(builder: (context)=> const PerfilScreen()),);
          //   },
          // ),
          ListTile(
            leading:  const Icon(Icons.highlight_off),
            title: const Text('cerrar sesion'),
            onTap: () {
              Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const LoginScreen();
                  },
                ),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
