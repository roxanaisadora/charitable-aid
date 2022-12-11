import 'package:ac/pages/category/social_aid/widgets/post_image.dart';
import 'package:ac/pages/category/social_aid/widgets/rounded_button.dart';
import 'package:ac/pages/category/social_aid/widgets/social_aid_information_item.dart';
import 'package:flutter/material.dart';

class SocialAidPost extends StatelessWidget {
  const SocialAidPost({
    Key? key,
    required this.postAsset,
    required this.postTitle,
    required this.postDescript,
    required this.donationAmount,
    required this.donorsNumber,
  }) : super(key: key);
  final String postAsset;
  final String postTitle;
  final String postDescript;
  final double donationAmount;
  final int donorsNumber;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ).copyWith(
          bottom: 0,
        ),
        child: Column(
          children: [
            PostImage(
              asset: postAsset,
              // 'https://images.unsplash.com/photo-1508847154043-be5407fcaa5a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
              onTap: () {
                print('on tap');
                Navigator.maybePop(context);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              // 'Ayuda Puno',
              postTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              postDescript,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SocialAidInformation(
              donationAmount: donationAmount,
              donorsNumber: donorsNumber,
            ),
            const SizedBox(
              height: 20,
            ),
            RoundedButton(
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
