import 'package:flutter/material.dart';

class ProfileImagePicker extends StatelessWidget {
  const ProfileImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              'https://i.pravatar.cc/300', // Placeholder image similar to screenshot
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: const Color(0xFF6C38F7), // Purple color from screenshot
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
