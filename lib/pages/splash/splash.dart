import 'package:ac/route/route.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   @override
   void initState(){
    Future.delayed(const Duration(milliseconds: 7500), 
      ()=>Navigator.pushReplacementNamed(context, MyRoutes.rLogin)
      );

    super.initState();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
                  'assets/image/splash.jpg',
                  fit: BoxFit.fitHeight, 
                ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}