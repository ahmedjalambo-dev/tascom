import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';

const List<String> predefinedSkills = [
  'Tutoring',
  'Repairs',
  'Pet Care',
  'Transportation',
  'Home Services',
  'Cooking',
  'Cleaning',
  'Gardening',
  'Tech Support',
  'Moving',
];

class SkillsInputWidget extends StatelessWidget {
  const SkillsInputWidget({
    super.key,
    required this.selectedSkills,
    required this.onSkillAdded,
    required this.onSkillRemoved,
  });

  final List<String> selectedSkills;
  final ValueChanged<String> onSkillAdded;
  final ValueChanged<String> onSkillRemoved;

  void _showSkillsPicker(BuildContext context) {
    final availableSkills = predefinedSkills
        .where((s) => !selectedSkills.contains(s))
        .toList();

    if (availableSkills.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('All skills have been selected'),
          backgroundColor: MyColors.brand.purple,
        ),
      );
      return;
    }

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Select Skill',
              style: MyTextStyles.heading.h22.copyWith(
                color: MyColors.text.primary,
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              // shrinkWrap: true,
              itemCount: availableSkills.length,
              itemBuilder: (context, index) {
                final skill = availableSkills[index];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      skill,
                      style: MyTextStyles.body.body1.copyWith(
                        color: MyColors.text.primary,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    onSkillAdded(skill);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showSkillsPicker(context),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        constraints: BoxConstraints(minHeight: 48.h),
        decoration: BoxDecoration(
          border: Border.all(color: MyColors.border.border, width: 1.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ...selectedSkills.map(
              (skill) => Chip(
                label: Text(
                  skill,
                  style: MyTextStyles.label.label1.copyWith(
                    color: MyColors.text.primary,
                  ),
                ),
                deleteIcon: Icon(Icons.close, size: 16.w),
                onDeleted: () => onSkillRemoved(skill),
                backgroundColor: MyColors.background.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  side: BorderSide(color: MyColors.border.border),
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
              ),
            ),
            Text(
              'Select Skills ...',
              style: MyTextStyles.body.body2.copyWith(
                color: MyColors.text.third,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
