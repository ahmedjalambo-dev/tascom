

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class TaskActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isOutlined;
  final Color color;

  const TaskActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isOutlined = false,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    // نستخدم Flexible هنا لضمان توزيع المساحة داخل الـ Row
    return Expanded(
      child: SizedBox(
        height: 32.h, // الارتفاع الموحد من Figma
        child: isOutlined
            ? OutlinedButton(
                onPressed: onPressed,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: color, width: 1),
                  shape: const StadiumBorder(), // شكل الكبسولة
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
              
                ),
                child: _buildText(),
              )
            : ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  shape: const StadiumBorder(),
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  elevation: 0,
                ),
                child: _buildText(),
              ),
      ),
    );
  }

  Widget _buildText() {
    return Text(
      label,
      style: MyTextStyle.button.smallButtons.copyWith(
        color: isOutlined ? color : Colors.white,
        fontSize: 11.sp, // حجم خط مناسب للارتفاع 32
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis, // يمنع خروج النص عن الحدود
    );
  }
}