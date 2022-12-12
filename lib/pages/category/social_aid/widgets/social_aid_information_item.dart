import 'package:ac/pages/category/social_aid/widgets/social_aid_information.dart';
import 'package:flutter/material.dart';

class SocialAidInformation extends StatelessWidget {
  const SocialAidInformation({
    Key? key,
    required this.donorsNumber,
    required this.donationAmount,
  }) : super(key: key);
  final int donorsNumber;
  final double donationAmount;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SocialAidInformationItem(
          title: '$donorsNumber donarón',
          withText: false,
          widget: CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            radius: 10,
            child: const Text(
              '+',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ),
        ),
        SocialAidInformationItem(
          title: 'Donación total',
          text: ' $donationAmount',
        ),
      ],
    );
  }
}
