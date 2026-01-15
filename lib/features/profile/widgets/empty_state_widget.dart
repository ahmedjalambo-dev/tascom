import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  final VoidCallback? onActionPressed;

  const EmptyStateWidget({
    super.key,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
       
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: const Color(0xFFE0E0E0),
            borderRadius: BorderRadius.circular(16),
            // In a real app, use an SVG or Image asset here
          ),
          child: const Icon(Icons.search, size: 60, color: Colors.white), // Placeholder
          alignment: Alignment.center,
        ),
        const SizedBox(height: 24),
        const Text(
          "You have no active tasks yet.",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF251455),
          ),
        ),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            "Post a task or help others in your community to get started.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF6E6E6E),
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 32),
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 24),
         child: SizedBox(
           width: double.infinity,
            height: 48,
            child: ElevatedButton(
              
              onPressed: onActionPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF6B39F4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
                elevation: 0,
              ),
              
              child: const Text(
                "Post a task",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
       ),
      ],
    );
  }
}
