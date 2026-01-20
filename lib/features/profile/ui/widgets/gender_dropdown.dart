import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class GenderDropdown extends StatelessWidget {
  const GenderDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final String? value;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: MyTextStyle.body.body1.copyWith(
            fontWeight: FontWeight.w500,
            color: MyColors.text.primary,
          ),
        ),
        SizedBox(height: 8.h),
        DropdownButtonFormField<String>(
          value: value,
          icon: Icon(Icons.keyboard_arrow_down, color: MyColors.brand.purple, size: 24.sp),
          decoration: InputDecoration(
             contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
             border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: MyColors.border.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: MyColors.border.border),
            ),
             focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: MyColors.brand.purple),
            ),
          ),
          items: [
            DropdownMenuItem(
              value: 'Male',
              child: Text('Male', style: MyTextStyle.body.body1),
            ),
            DropdownMenuItem(
              value: 'Female',
              child: Text('Female', style: MyTextStyle.body.body1),
            ),
          ],
          onChanged: onChanged,
          validator: (value) {
            if (value == null) {
              return 'Please select gender';
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
