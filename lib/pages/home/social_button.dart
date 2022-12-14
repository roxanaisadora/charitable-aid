import 'package:ac/pages/category/social_aid/widgets/social_aid_post.dart';
import 'package:flutter/material.dart';

class SocialScreenHome extends StatelessWidget {
  final String? postAsset;
  final String? postTitle;
  final String? postDescript;
  final double? donationAmount;
  final int? donorsNumber;
  final String?category;
  const SocialScreenHome({super.key, this.postAsset, this.postTitle, this.postDescript, this.donationAmount, this.donorsNumber, this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 1,
        itemBuilder: (context, index) {
          return SocialAidPost(
            postAsset:postAsset,
            postTitle: postTitle,
            postDescript:postDescript,
            donationAmount: donationAmount,
            donorsNumber: donorsNumber,
            category:category
          );
        },
      ),
    );
  }
}
