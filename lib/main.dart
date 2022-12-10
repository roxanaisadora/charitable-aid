
import 'package:ac/providers/provider_theme.dart';
import 'package:ac/route/index_page.dart';
import 'package:ac/share_preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Preferences.init();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => ProviderTheme(isDarkMode: Preferences.theme),
      ),
    
      
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:  Provider.of<ProviderTheme>(context).currentTheme,
      home: const SplashScreen(),
    );
  }
}