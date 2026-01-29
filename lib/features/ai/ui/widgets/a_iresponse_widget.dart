import 'package:flutter/material.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class AIresponseWidget extends StatelessWidget {
  const AIresponseWidget({super.key, required this.responseText});

  final String responseText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: const Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 263,
            child: Text(
              responseText,
              style: MyTextStyle.body.body2.copyWith(
                color: MyColors.text.primary,
              ),
            ),
          ),
          const SizedBox(width: 16, height: 16),
        ],
      ),
    );
  }
}
