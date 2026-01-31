import 'package:flutter/material.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    super.key,
    required this.questionText,
    required this.actionText,
    required this.onActionTap,
  });

  final String questionText;
  final String actionText;
  final VoidCallback onActionTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionText,
          style: MyTextStyle.body.body2.copyWith(
            color: MyColors.text.secondary,
          ),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: onActionTap,
          child: Text(
            actionText,
            style: MyTextStyle.button.primaryButton1.copyWith(
              color: MyColors.brand.purple,
            ),
          ),
        ),
      ],
    );
  }
}
