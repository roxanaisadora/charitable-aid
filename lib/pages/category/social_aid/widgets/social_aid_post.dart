// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:ac/pages/category/social_aid/widgets/post_image.dart';
import 'package:ac/pages/category/social_aid/widgets/rounded_button.dart';
import 'package:ac/pages/category/social_aid/widgets/social_aid_information_item.dart';
import 'package:flutter/material.dart';

class SocialAidPost extends StatelessWidget {
  final String? postAsset;
  final String? postTitle;
  final String? postDescript;
  final double? donationAmount;
  final int? donorsNumber;
  final String? category;
  final String? img1;
  final String? img2;
  final String? img3;
  final String? qr1;
  final String? qr2;
  final String? qr3;
  final String? socio;
  final int numero;
  final int personas;
  final int id;
  final Function? shareTap;
  const SocialAidPost({
    Key? key,
    this.postAsset,
    this.postTitle,
    this.postDescript,
    this.donationAmount,
    this.donorsNumber,
    this.category,
    this.img1,
    this.img2,
    this.img3,
    this.shareTap, this.qr1, this.qr2, this.qr3, this.socio, required this.numero, required this.id, required this.personas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ).copyWith(
            bottom: 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostImage(
                asset: postAsset!,
                //sharetap: () => shareTap!(),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  // 'Ayuda Puno',
                  postTitle!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    // 'Ayuda Puno',
                    'ONG: ${category}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  InkWell(
                  onTap: () => shareTap!(),
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.redo,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                postDescript!,
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
                donorsNumber: donorsNumber!,
                img1: img1!,
                img2: img2!,
                img3: img3!,
              ),
              const SizedBox(
                height: 20,
              ),
              RoundedButton(
                onPressed: () {},
                category: category!,
                donationAmount: donationAmount!,
                postTitle: postTitle!,
                img: postAsset!,
                qr1: qr1!,
                qr2:qr2!,
                qr3:qr3!,
                socio:socio!,
                numero:numero,
                id:id,
                personas:personas
              )
            ],
          ),
        ),
      ),
    );
  }
}
