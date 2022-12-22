import 'package:flutter/material.dart';
import '../pages/home/index_home.dart';
import 'index_page.dart';

class MyRoutes {
  static const String rHome = '/Home';
  static const String rLogin = '/login';
  static const String rRegister = '/register';
  static const String rVerifyT = '/verify';
  static const String help2 = '/help2';
  static const String help = '/help';
  static const String rSplash = '/splash';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ('/splash'):
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case ('/login'):
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case ('/register'):
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case ('/verify'):
        return MaterialPageRoute(builder: (_) => const VerifyAuthScreen());
      case ('/help'):
        return MaterialPageRoute(builder: (_) => const SecreenHelp());
      case ('/help2'):
        return MaterialPageRoute(builder: (_) => const SecreenHelp2());
      case ('/Home'):
        return MaterialPageRoute(builder: (_) => BottomNavBar());
      default:
        return MaterialPageRoute(builder: (_) => BottomNavBar());
    }
  }
}
