import 'package:ac/providers/donation_verification_provider.dart';
import 'package:ac/route/index_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/provider_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ProviderLogin()),
      ChangeNotifierProvider(create: (_) => AuthService()),
      ChangeNotifierProvider(create: (_) => ProductoProvider()),
      ChangeNotifierProvider(
        create: (_) => DonationesService(),
      ),
      ChangeNotifierProvider(
        create: (_) => HelpSeresvice(),
      ),
      ChangeNotifierProvider(create: (_) => StorageHomeProvider()),
      ChangeNotifierProvider(create: (_) => DonationVerificationProvider())
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
      title: 'Charitable Aid',
      scaffoldMessengerKey: CustomSnackbbar.msgkey,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Color.fromARGB(255, 86, 82, 98),
      ),
      onGenerateRoute: MyRoutes.generateRoute,
      initialRoute: MyRoutes.rSplash,
      routes: {
        'page_pago': (_) => const DonationPage(),
        'page_update': (_) => const LugarPage(),
      },
    );
  }
}
