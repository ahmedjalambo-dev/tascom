import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/get_tasks/data/models/all_tasks_response.dart';

class SavedTaskCard extends StatelessWidget {
  final TaskResponseData task;
  final VoidCallback onTap;
  final VoidCallback onUnsaveTap;

  const SavedTaskCard({
    super.key,
    required this.task,
    required this.onTap,
    required this.onUnsaveTap,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        task.assets.isNotEmpty ? task.assets[0]['url'] as String? : null;
    final points = task.pointsOffered ?? 0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.background.primary,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: MyColors.border.postBorder, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
              child: imageUrl != null
                  ? Image.network(
                      imageUrl,
                      width: double.infinity,
                      height: 120.h,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => _buildImagePlaceholder(),
                    )
                  : _buildImagePlaceholder(),
            ),

            // Content
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title + Bookmark
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            task.title,
                            style: MyTextStyles.body.body2.copyWith(
                              color: MyColors.text.primary,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const HorizontalSpace(4),
                        GestureDetector(
                          onTap: onUnsaveTap,
                          child: SvgPicture.asset(
                            MyIcons.saveSolid,
                            width: 20.w,
                            height: 20.w,
                            colorFilter: ColorFilter.mode(
                              MyColors.brand.purple,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const VerticalSpace(4),

                    // Points
                    Row(
                      children: [
                        SvgPicture.asset(
                          MyIcons.pointsSolid,
                          width: 14.w,
                          height: 14.w,
                          colorFilter: ColorFilter.mode(
                            MyColors.brand.purple,
                            BlendMode.srcIn,
                          ),
                        ),
                        const HorizontalSpace(4),
                        Text(
                          '$points Points',
                          style: MyTextStyles.label.label1.copyWith(
                            color: MyColors.brand.purple,
                          ),
                        ),
                      ],
                    ),
                    const VerticalSpace(4),

                    // Description
                    Expanded(
                      child: Text(
                        task.description,
                        style: MyTextStyles.label.label1.copyWith(
                          color: MyColors.text.secondary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      width: double.infinity,
      height: 120.h,
      color: MyColors.background.secondary,
      child: Icon(
        Icons.image_outlined,
        size: 36.w,
        color: MyColors.text.third,
      ),
    );
  }
}
