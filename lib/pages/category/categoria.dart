
import 'package:ac/pages/category/search_2.dart';
import 'package:ac/pages/category/social_aid/help_points_screen.dart';
import 'package:ac/pages/category/social_aid/payment_screen.dart';
import 'package:ac/pages/category/social_aid/social_aid_screen.dart';
import 'package:ac/pages/category/social_aid/widgets/card.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(126, 105, 240, 175),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Categorías',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 20,
        ),
        color: const Color.fromARGB(126, 105, 240, 175),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CategoryCard(
              asset:
                  'https://blog.oxfamintermon.org/wp-content/uploads/2018/07/voluntariado-onu.jpg',
              label: 'Voluntariado',
              onPressed: () {
                final route = MaterialPageRoute(
                  builder: (context) => const Search2List(),
                );
                Navigator.push(context, route);
              },
            ),

            CategoryCard(
              asset:'https://www.infocapitalhumano.pe/wp-content/uploads/2020/06/empresas4.jpg',
              label: 'Donaciones',
              onPressed: () {
                final route = MaterialPageRoute(
                  builder: (context) => const SocialAidScreen(),
                );
                Navigator.push(context, route);
              },
            ),

            CategoryCard(
              asset:'https://play-lh.googleusercontent.com/2MbiK1SICz2OX5OfHwIp_S-YydIEHsH4IujPBAr7tV5SeF56hZ1mSxhg_1ZIvEGdiQQ',
              label: 'Puntos de Acopio',
              onPressed: () {
                final route = MaterialPageRoute(
                  builder: (context) => const HelpPointsScreen(),
                );
                Navigator.push(context, route);
              },
            ),
            const SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
