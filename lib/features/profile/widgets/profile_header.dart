// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
            boxShadow: [
               BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 1,
                blurRadius: 10,
              ),
            ]
          ),
          child: const CircleAvatar(
            //35
            radius: 57,
            backgroundImage: NetworkImage(
                "https://i.pravatar.cc/300?img=5"), // Placeholder image
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Sara Mahdi",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xFF251455), // Dark text
          ),
        ),
        const SizedBox(height: 4),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
             color:Color(0xFFFFFFFF),
          ),
         
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: Color(0xFFFFC107), size: 18),
              const SizedBox(width: 4),
             Text("4.5 (120 reviews)",
             textAlign: TextAlign.center,
             style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0XFF251455)),)
            ],
          ),
        ),
      ],
    );
  }
}
