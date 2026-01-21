import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class NotificationSwitchTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const NotificationSwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: MyTextStyle.body.body1.copyWith(
              color:Color(0XFF263238),
              fontWeight: FontWeight.w500,
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
                activeColor: MyColors.text.white,
            activeTrackColor: MyColors.brand.purple,
            inactiveThumbColor: MyColors.text.white,
            inactiveTrackColor: Color(0XFFD1D1D6),
        
            trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
        
         
          ),
        ],
      ),
    );
  }
}
