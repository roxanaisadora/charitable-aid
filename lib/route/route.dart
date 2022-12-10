






import 'package:ac/pages/home/home.dart';
import 'package:ac/pages/navegacion/navigator.dart';
import 'package:ac/screen/ajustes_screen.dart';
import 'package:ac/screen/perfil_screen.dart';

import 'package:flutter/material.dart';

class MyRoutes {
 
  static const String rAJUSTES = '/ajuste';
  static const String rPERFIL = '/perfil';
   static const String rHOME = '/home';
   static const String rMENU = '/menu';
  

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
     
     case ('/ajuste'):
        return MaterialPageRoute(builder: (_) => const AjusteScreen());
      case ('/perfil'):
        return MaterialPageRoute(builder: (_) => const PerfilScreen());
        case ('/home'):
        return MaterialPageRoute(builder: (_) => const HomeScrean());
         case ('/menu'):
        return MaterialPageRoute(builder: (_) =>  BottomNavBar ());
      

      default:
        return MaterialPageRoute(builder: (_) => const HomeScrean ());
    }
  }
}
