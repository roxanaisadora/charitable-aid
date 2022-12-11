import 'package:flutter/material.dart';

class SocialAidInformationItem extends StatelessWidget {
  const SocialAidInformationItem({
    Key? key,
    required this.title,
    this.text,
    this.withText = true,
    this.widget,
  }) : super(key: key);
  final String title;
  final String? text;
  final bool withText;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            // '6000 donarón',
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black54,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          withText
              ? Text(
                  // 'S/. 6000',
                  'S/. $text',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                )
              : widget!,
        ],
      ),
    );
  }
}
