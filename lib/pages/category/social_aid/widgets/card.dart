import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.asset,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String asset;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(
        12,
      ),
      onPressed: onPressed,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.network(
                asset,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
          ),
          title: Text(
            // 'Ayuda Social',
            label,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 20,
          ),
        ),
      ),
    );
  }
}
