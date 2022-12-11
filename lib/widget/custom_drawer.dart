import 'package:ac/pages/home/home.dart';
import 'package:ac/pages/navegacion/navigator.dart';
import 'package:ac/screen/ajustes_screen.dart';
import 'package:ac/screen/perfil_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer( backgroundColor:  const Color.fromARGB(255, 235, 192, 128),
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://vistiendosonrisas.com/wp-content/uploads/2020/01/Vistiendo-Sonrisas-Logo-2.png'),
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
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text('Home'),
            trailing: const Icon(
              Icons.home,
              color: Colors.pinkAccent,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomNavBar()),
              );
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.settings,
              color: Colors.pinkAccent,
            ),
            title: const Text(
              'Registration',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AjusteScreen()),
              );
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.person,
              color: Colors.pinkAccent,
            ),
            title: const Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PerfilScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
