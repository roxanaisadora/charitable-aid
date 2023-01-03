import 'dart:convert';

import 'package:ac/pages/category/social_aid/widgets/social_aid_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialAidScreen extends StatefulWidget {
  const SocialAidScreen({super.key});

  @override
  State<SocialAidScreen> createState() => _SocialAidScreenState();
}

class _SocialAidScreenState extends State<SocialAidScreen> {
  List<dynamic> _data = [];
  Future<void> readJson() async {
  final String response = await rootBundle.loadString('assets/json/listhome.json');
  final data = await json.decode(response);
    setState(() {
      _data = data["item_7"];
    });
  }
  


  @override
  void initState() {
    super.initState();
    readJson();
    // loadData().then((value) => catalogdata=value);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: _data.length,
            itemBuilder: (BuildContext context, int index) {
              final dato = _data[index];
              final Uri _url = Uri.parse('${dato['url']}');

              Future<void> _launchUrl() async {
              if (!await launchUrl(_url)) {
                throw 'Could not launch $_url';
              }
            }
              return SocialAidPost(
                postAsset:dato['image'],
                postTitle: dato['title'],
                postDescript:dato['description'],
                donationAmount:dato['donation'],
                donorsNumber:dato['colaboradores'].toInt(),
                category:dato['sub_title'],
                img1: dato['img_1'],
                img2: dato['img_2'],
                img3: dato['img_3'],
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
