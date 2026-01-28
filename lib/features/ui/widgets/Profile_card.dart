import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/data/Profile_Model.dart';

class ProfileCard extends StatelessWidget {
  final ProfileModel profile;

  const ProfileCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 64,
                height: 64,
                child: CircleAvatar(
                  radius: 50.r,
                  backgroundImage: AssetImage(profile.imageUrl),
                ),
              ),
              SizedBox(width: 10.w),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        profile.name,
                        style: MyTextStyle.body.body1.copyWith(
                          color: MyColors.text.primary,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(Icons.star, size: 16, color: Colors.amber),
                      Text(
                        profile.rating.toString(),
                        style: MyTextStyle.label.label1.copyWith(
                          color: MyColors.text.third,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: MyColors.background.primary,
                      borderRadius: BorderRadius.circular(68.r),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 14,
                          color: Colors.purple,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          profile.location,
                          style: MyTextStyle.label.label2.copyWith(
                            color: MyColors.brand.purple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(child: SizedBox(width: 40.w)),

              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/images/edit-02.svg',
                  height: 16.h,
                  width: 16.w,
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 17),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    MyColors.brand.purple,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(103.r),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          Text(
            profile.description,
            style: MyTextStyle.caption.captionNotes.copyWith(
              color: MyColors.text.secondary,
            ),
          ),

          const SizedBox(height: 16),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: profile.skills
                .map(
                  (skill) => Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.r),
                      color: MyColors.background.primary,
                      shape: BoxShape.rectangle,
                    ),
                    child: Text(
                      skill,
                      style: MyTextStyle.caption.captionNotes.copyWith(
                        color: MyColors.text.primary,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
