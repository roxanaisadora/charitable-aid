import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {
  final Widget? title;
  final Widget? leading;
  final Widget? subtitle;
  final Function()? onTap;
  final Function()? onPressed;

  const CardCustom(
      {super.key, this.title, this.leading, this.subtitle, this.onTap, this.onPressed});

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
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: const Icon(Icons.edit), onPressed: ()=>onTap!()),
                IconButton(icon: const Icon(Icons.delete), onPressed: ()=>onPressed!())
              ],
            ),
          ),

        ],
      ),
    );
  }
}