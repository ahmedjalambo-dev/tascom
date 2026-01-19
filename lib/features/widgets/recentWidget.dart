import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class Recentwidget extends StatelessWidget {
  const Recentwidget({super.key, required this.titleText, required this.icon});
  final String titleText;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        icon,
        width: 20.w,
        height: 20.h,
        color: MyColors.brand.purple,
      ),
      title: Text(
        titleText,
        style: MyTextStyle.caption.captionNotes.copyWith(
          color: MyColors.text.secondary,
        ),
      ),
      trailing: Icon(Icons.north_east),
      onTap: () {},
    );
  }
}
