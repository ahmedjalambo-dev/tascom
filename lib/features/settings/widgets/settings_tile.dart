import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsTile extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback onTap;
  final Color? textColor;
  final bool showArrow;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.textColor,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 16,
      onTap: onTap,
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          color: textColor ?? const Color(0xFF251455),
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      trailing: showArrow
          ? SvgPicture.asset(
              'assets/svg/arrow_forward_ios.svg',
              width: 16,
              height: 16,
              colorFilter: const ColorFilter.mode(
                Color(0xFF251455),
                BlendMode.srcIn,
              ),
            )
          : null,
    );
  }
}
