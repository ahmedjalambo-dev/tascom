import 'package:flutter/material.dart';
import 'package:tascom/core/themes/my_colors.dart';


class SettingsSectionCard extends StatelessWidget {
  final List<Widget> children;
  final Color? backgroundColor;

  const SettingsSectionCard({
    super.key,
    required this.children,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? MyColors.background.cardHover,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: children,
      ),
    );
  }
}
