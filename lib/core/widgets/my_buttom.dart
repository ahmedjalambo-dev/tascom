import 'package:flutter/material.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class MyBottom extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback? onTap;

  const MyBottom({super.key, required this.text, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
        ),
        child: Text(
          text,
          style: MyTextStyle.button.primaryButton1.copyWith(
            color: MyColors.text.white,
          ),
        ),
      ),
    );
  }
}
