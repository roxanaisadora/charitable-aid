import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class PostImage extends StatelessWidget {
  const PostImage({
    Key? key,
    this.asset,
    this.sharetap,
  }) : super(key: key);
  final String? asset;
  final Function? sharetap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            30,
          ),
          child: Stack(
            children: [
              const AspectRatio(
                aspectRatio: 16 / 12,
                child: Center(child: CircularProgressIndicator()),
              ),
              AspectRatio(
                aspectRatio: 16 / 12,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: asset!,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
