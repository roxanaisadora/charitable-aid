import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  const PostImage({
    Key? key,
    required this.asset,
    required this.onTap,
  }) : super(key: key);
  final String asset;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            30,
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              // 'https://images.unsplash.com/photo-1508847154043-be5407fcaa5a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
              asset,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 15,
          left: 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onTap,
                /* () {
                  print('back pressed');
                }, */
                child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.bookmark_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
