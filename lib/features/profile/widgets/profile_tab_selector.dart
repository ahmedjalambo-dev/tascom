import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';

enum ProfileTab { posted, claimed }

class ProfileTabSelector extends StatelessWidget {
  final ProfileTab selectedTab;
  final ValueChanged<ProfileTab> onTabChanged;

  const ProfileTabSelector({
    super.key,
    required this.selectedTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: MyColors.priority.low.bg,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final tabWidth = (constraints.maxWidth) / 2;
          return Stack(
            children: [
              // Sliding indicator
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                left: selectedTab == ProfileTab.posted ? 0 : tabWidth,
                top: 0,
                bottom: 0,
                width: tabWidth,
                child: Container(
                  decoration: BoxDecoration(
                    color: MyColors.background.primary,
                    borderRadius: BorderRadius.circular(26.r),
                    boxShadow: [
                      BoxShadow(
                        color: MyColors.text.primary.withValues(alpha: 0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
              // Tab labels
              Row(
                children: [
                  Expanded(
                    child: _buildTab(
                      label: 'Posted',
                      tab: ProfileTab.posted,
                      isSelected: selectedTab == ProfileTab.posted,
                    ),
                  ),
                  Expanded(
                    child: _buildTab(
                      label: 'Claimed',
                      tab: ProfileTab.claimed,
                      isSelected: selectedTab == ProfileTab.claimed,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTab({
    required String label,
    required ProfileTab tab,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => onTabChanged(tab),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            style: MyTextStyles.button.secondaryButton2.copyWith(
              color: isSelected
                  ? MyColors.brand.purple
                  : MyColors.text.secondary,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
            child: Text(label),
          ),
        ),
      ),
    );
  }
}
