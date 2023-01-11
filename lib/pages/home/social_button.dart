import 'package:ac/pages/category/social_aid/widgets/social_aid_post.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialScreenHome extends StatelessWidget {
  final String? postAsset;
  final String? postTitle;
  final String? postDescript;
  final double? donationAmount;
  final int? donorsNumber;
  final String?category;
  final String? img1; 
  final String? img2; 
  final String? img3; 
  final String? qr1; 
  final String? qr2; 
  final String? qr3; 
  final String socio; 
  final int numero; 
  final int id; 
  final int personas;
  final String? url_share; 
  const SocialScreenHome({super.key, this.postAsset, this.postTitle, this.postDescript, this.donationAmount, this.donorsNumber, this.category, this.img1, this.img2, this.img3, this.url_share, this.qr1, this.qr2, this.qr3, required this.socio, required this.numero, required this.id, required this.personas});

  

  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse(url_share!);

    Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 1,
            itemBuilder: (context, index) {
              return SocialAidPost(
                postAsset:postAsset,
                postTitle: postTitle,
                postDescript:postDescript,
                donationAmount: donationAmount,
                donorsNumber: donorsNumber,
                category:category,
                img1:img1,
                img2:img2,
                img3:img3,
                qr1:qr1,
                qr2:qr2,
                qr3:qr3,
                shareTap: _launchUrl,
                socio:socio,
                numero:numero,
                id:id,
                personas:personas
              );
            },
          ),
          Padding(
          padding: const EdgeInsets.only(top:50, left: 35, right: 20),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
              
            ],
          ),
        )
        ],
      ),
    );
  }
}
