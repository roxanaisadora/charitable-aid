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
              AspectRatio(
                aspectRatio: 16 / 12,
                child: const Center(child: CircularProgressIndicator()),
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
        Positioned(
          top: 20,
          right: 15,
          left: 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: InkWell(
                  onTap: () => sharetap!(),
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
              ),
            ],
          ),
        )
      ],
    );
  }
}
