import 'package:flutter/material.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, required this.selectedMessage});

  final String? selectedMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: const Color(0xFFF0EBFE),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 263,
            child: Text(
              selectedMessage!,
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
