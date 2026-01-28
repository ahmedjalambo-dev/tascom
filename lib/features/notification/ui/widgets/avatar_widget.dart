import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final ImageProvider image;
  final double size;

  const Avatar({
    super.key,
    required this.image,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

