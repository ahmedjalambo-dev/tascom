import 'package:flutter/material.dart';

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
        color: backgroundColor ?? const Color(0xFFF9F5FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: children,
      ),
    );
  }
}
