
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // تأكدي من الاستيراد

class CustomPillDropdown<T> extends StatelessWidget {
  final T value;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final String Function(T) itemLabelBuilder;
  final double height;
  final double menuWidth;
  final Color textColor;
  final Color borderColor;
  final double fontSize;

  const CustomPillDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.itemLabelBuilder,
    this.height = 24.0, // سيتم تحويلها لـ .h عند الاستخدام
    this.menuWidth = 120.0, // سيتم تحويلها لـ .w عند الاستخدام
    this.textColor = const Color(0xFF251455),
    this.borderColor = const Color(0xFFCCCCCC),
    this.fontSize = 12.0, // سيتم تحويلها لـ .sp عند الاستخدام
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        // استخدمي .h هنا لضمان تناسق الطول في كل الصفحات
        height: height.h, 
        decoration: BoxDecoration(
          color: Colors.white,
          // استخدمي .r للزوايا
          borderRadius: BorderRadius.circular(8.r), 
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                // padding متجاوب
                padding: EdgeInsets.symmetric(horizontal: 8.w), 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      itemLabelBuilder(value),
                      style: TextStyle(
                        fontSize: fontSize.sp, // نص متجاوب
                        color: textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: (fontSize + 2).sp, // أيقونة متناسبة مع الخط
                      color: textColor,
                    ),
                  ],
                ),
              ),
            ),

            Positioned.fill(
              child: Opacity(
                opacity: 0,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<T>(
                    value: value,
                    isExpanded: true,
                    menuWidth: menuWidth.w, // عرض القائمة متجاوب
                    alignment: AlignmentDirectional.bottomEnd,
                    items: items.map((T item) {
                      return DropdownMenuItem<T>(
                        value: item,
                        child: Text(
                          itemLabelBuilder(item),
                          style: TextStyle(
                            fontSize: 14.sp, // حجم نص القائمة
                            color: textColor,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: onChanged,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
