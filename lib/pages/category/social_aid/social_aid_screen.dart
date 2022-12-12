import 'package:ac/pages/category/social_aid/widgets/social_aid_post.dart';
import 'package:flutter/material.dart';

class SocialAidScreen extends StatelessWidget {
  const SocialAidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const SocialAidPost(
            postAsset:
                'https://images.unsplash.com/photo-1508847154043-be5407fcaa5a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
            postTitle: 'Ayuda Puno',
            postDescript:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
            donationAmount: 6550.5,
            donorsNumber: 2750,
          );
        },
      ),
    );
  }
}
