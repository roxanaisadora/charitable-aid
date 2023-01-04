import 'package:ac/pages/category/social_aid/widgets/social_aid_post.dart';
import 'package:ac/services/donation_7_supabase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialAidScreen extends StatefulWidget {
  const SocialAidScreen({super.key});

  @override
  State<SocialAidScreen> createState() => _SocialAidScreenState();
}

class _SocialAidScreenState extends State<SocialAidScreen> {
  
  @override
  Widget build(BuildContext context) {
    final DonationPostService7 = Provider.of<DonationPostSeresvice7>(context);
    print(DonationPostService7.donationpost7s.length);
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: DonationPostService7.donationpost7s.length,
            itemBuilder: (BuildContext context, int index) {
              final dato = DonationPostService7.donationpost7s[index];
              final Uri _url = Uri.parse('${dato.url}');

              Future<void> _launchUrl() async {
              if (!await launchUrl(_url)) {
                throw 'Could not launch $_url';
              }
            }
              return SocialAidPost(
                postAsset:dato.image,
                postTitle: dato.title,
                postDescript:dato.description,
                donationAmount:dato.donation,
                donorsNumber:dato.colaboradores.toInt(),
                category:dato.subTitle,
                img1: dato.img1,
                img2: dato.img2,
                img3: dato.img3,
                shareTap:_launchUrl,
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
