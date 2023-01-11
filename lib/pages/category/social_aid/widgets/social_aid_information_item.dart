import 'package:ac/pages/category/social_aid/widgets/social_aid_information.dart';
import 'package:flutter/material.dart';

class SocialAidInformation extends StatelessWidget {
  const SocialAidInformation({
    Key? key,
    this.donorsNumber,
 this.img1, this.img2, this.img3,
  }) : super(key: key);
  final int? donorsNumber;

  final String? img1; 
  final String? img2; 
  final String? img3; 

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SocialAidInformationItem(
          title: '$donorsNumber donarón',
          withText: false,
          widget: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(img1!),
              ),
              Positioned(
                left: 25,
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(img2!)
                ),
              ),
              Positioned(
                left: 50,
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(img3!),
                ),
              ),
              
            ],
          ),
        )
      ],
    );
  }
}
