import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/search/data/search_mock_data.dart';
import 'package:tascom/features/search/ui/widgets/recent_search_tile.dart';

class RecentSearchesSection extends StatelessWidget {
  final List<RecentSearchItem> recentSearches;
  final VoidCallback onClearTap;
  final ValueChanged<RecentSearchItem> onItemTap;

  const RecentSearchesSection({
    super.key,
    required this.recentSearches,
    required this.onClearTap,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Text(
                'Recent',
                style: MyTextStyles.heading.h22.copyWith(
                  color: MyColors.text.primary,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: onClearTap,
                child: Text(
                  'Clear',
                  style: MyTextStyles.body.body2.copyWith(
                    color: MyColors.brand.purple,
                  ),
                ),
              ),
            ],
          ),
        ),
        const VerticalSpace(8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recentSearches.length,
          itemBuilder: (context, index) {
            final item = recentSearches[index];
            return RecentSearchTile(item: item, onTap: () => onItemTap(item));
          },
        ),
      ],
    );
  }
}
