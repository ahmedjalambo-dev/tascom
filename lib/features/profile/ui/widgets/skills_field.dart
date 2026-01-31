import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class SkillsField extends StatefulWidget {
  const SkillsField({super.key});

  @override
  State<SkillsField> createState() => _SkillsFieldState();
}

class _SkillsFieldState extends State<SkillsField> {
  final TextEditingController _controller = TextEditingController();
  // Pre-populating with some skills to match screenshot example "Skill A", "Skill B"
  final List<String> _skills = ['Skill A', 'Skill B'];

  void _addSkill() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    if (!_skills.contains(text)) {
      setState(() {
        _skills.add(text);
        _controller.clear();
      });
    } else {
      _controller.clear();
    }
  }

  void _removeSkill(String skill) {
    setState(() {
      _skills.remove(skill);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Skills",
          style: MyTextStyle.body.body1.copyWith(
            fontWeight: FontWeight.w500,
            color: MyColors.text.primary,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            border: Border.all(color: MyColors.border.border),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Wrap(
            spacing: 8.w,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ..._skills.map(
                (skill) => Chip(
                  backgroundColor: MyColors.background.cardHover,
                  labelStyle: MyTextStyle.label.label1.copyWith(
                      color: MyColors.brand.purple, fontWeight: FontWeight.bold),
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r)),
                  label: Text(skill),
                  deleteIcon: Icon(Icons.close, size: 18.sp, color: MyColors.text.third),
                  onDeleted: () => _removeSkill(skill),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 100.w, maxWidth: 150.w),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Select Skills ...",
                    hintStyle: MyTextStyle.body.body2.copyWith(color: MyColors.text.third),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                  ),
                  onSubmitted: (_) => _addSkill(),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
