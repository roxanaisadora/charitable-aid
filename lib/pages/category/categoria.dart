import 'package:ac/pages/category/search.dart';
import 'package:ac/pages/category/social_aid/help_points_screen.dart';
import 'package:ac/pages/category/social_aid/payment_screen.dart';
import 'package:ac/pages/category/social_aid/social_aid_screen.dart';
import 'package:ac/pages/category/social_aid/volunteer_screen.dart';
import 'package:ac/pages/category/social_aid/widgets/card.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        ).copyWith(
          bottom: 0,
        ),
        color: Colors.greenAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            CategoryCard(
              asset:
                  'https://images.unsplash.com/photo-1582213782179-e0d53f98f2ca?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
              label: 'Voluntariado',
              onPressed: () {
                final route = MaterialPageRoute(
                  builder: (context) => SearchList(),
                );
                Navigator.push(context, route);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CategoryCard(
              asset:
                  'https://images.unsplash.com/photo-1593113598332-cd288d649433?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
              label: 'Donaciones',
              onPressed: () {
                final route = MaterialPageRoute(
                  builder: (context) => const SocialAidScreen(),
                );
                Navigator.push(context, route);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CategoryCard(
              asset:
                  'https://images.unsplash.com/photo-1593113598332-cd288d649433?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
              label: 'pagos',
              onPressed: () {
                final route = MaterialPageRoute(
                  builder: (context) => const PaymentScreen(),
                );
                Navigator.push(context, route);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CategoryCard(
              asset:
                  'https://images.unsplash.com/photo-1593113598332-cd288d649433?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
              label: 'Puntos de Acopio',
              onPressed: () {
                final route = MaterialPageRoute(
                  builder: (context) => const HelpPointsScreen(),
                );
                Navigator.push(context, route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
