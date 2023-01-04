import 'package:flutter/material.dart';

class CardCustom2 extends StatelessWidget {
  final Widget? title;
  final Widget? leading;
  final Widget? subtitle;


  const CardCustom2(
      {super.key, this.title, this.leading, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: leading,
            title: title,
            subtitle: subtitle,
          ),

        ],
      ),
    );
  }
}