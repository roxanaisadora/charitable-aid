import 'package:ac/route/index_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   @override
   void initState(){
    Future.delayed(const Duration(milliseconds: 4500), ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar())
    ));
    super.initState();
   }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        
        children: [
          SizedBox.expand(
            child: Container(
              child: Image.asset(
                    'assets/image/splash.jpg',
                    fit: BoxFit.fitHeight, 
                  ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    height: 60,
                    width: 60,
                    child: const CircularProgressIndicator(),
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