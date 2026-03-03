import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/services/location_service.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_app_bar.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/profile/cubit/profile_cubit.dart';
import 'package:tascom/features/profile/cubit/profile_state.dart';
import 'package:tascom/features/user/data/models/user_model.dart';

class HelperDetailsScreen extends StatefulWidget {
  final String userId;

  const HelperDetailsScreen({super.key, required this.userId});

  @override
  State<HelperDetailsScreen> createState() => _HelperDetailsScreenState();
}

class _HelperDetailsScreenState extends State<HelperDetailsScreen> {
  String? _resolvedLocation;

  Future<void> _resolveLocation(String? location) async {
    if (location == null || location.isEmpty) return;

    final parts = location.split(',');
    if (parts.length != 2) return;

    final lat = double.tryParse(parts[0].trim());
    final lng = double.tryParse(parts[1].trim());
    if (lat == null || lng == null) return;

    final placemark = await LocationService.getPlacemark(lat, lng);
    if (placemark == null || !mounted) return;

    final locationParts = <String>[];
    if (placemark.country != null && placemark.country!.isNotEmpty) {
      locationParts.add(placemark.country!);
    }
    if (placemark.locality != null && placemark.locality!.isNotEmpty) {
      locationParts.add(placemark.locality!);
    }

    if (locationParts.isNotEmpty) {
      setState(() {
        _resolvedLocation = locationParts.join(', ');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.primary,
      body: Column(
        children: [
          _buildAppBar(context),
          Expanded(
            child: BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                state.maybeWhen(
                  loaded: (user) => _resolveLocation(user.location),
                  orElse: () {},
                );
              },
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  loaded: (user) => _buildContent(user),
                  error: (error) =>
                      _buildError(error.message ?? 'Something went wrong'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return MyAppBar(
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20.w,
            color: MyColors.icons.icon,
          ),
        ),
      ),
      title: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final name = state.maybeWhen(
            loaded: (user) => user.name,
            orElse: () => null,
          );
          return Text(
            name != null ? '$name Profile' : 'Profile',
            style: MyTextStyles.heading.h22.copyWith(
              color: MyColors.text.primary,
            ),
          );
        },
      ),
      trailing: [
        Icon(Icons.more_vert, size: 24.w, color: MyColors.icons.icon),
      ],
    );
  }

  Widget _buildContent(UserModel user) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const VerticalSpace(24),
          _buildProfileHeader(user),
          const VerticalSpace(24),
          _buildStatsRow(user),
          const VerticalSpace(24),
          _buildAboutSection(user),
          const VerticalSpace(24),
          _buildSkillsSection(user),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(UserModel user) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            CircleAvatar(
              radius: 50.r,
              backgroundColor: MyColors.brand.purple.withValues(alpha: 0.1),
              backgroundImage:
                  user.avatar != null ? NetworkImage(user.avatar!) : null,
              child: user.avatar == null
                  ? Text(
                      user.name.isNotEmpty ? user.name[0].toUpperCase() : '?',
                      style: MyTextStyles.heading.h1.copyWith(
                        color: MyColors.brand.purple,
                      ),
                    )
                  : null,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: MyColors.brand.purple,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: SvgPicture.asset(
                      MyIcons.sendSolid,
                      width: 18.w,
                      height: 18.h,
                      colorFilter: ColorFilter.mode(
                        MyColors.background.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const VerticalSpace(12),
        Text(
          user.name,
          style: MyTextStyles.heading.h22.copyWith(
            color: MyColors.text.primary,
          ),
        ),
        if (_resolvedLocation != null) ...[
          const VerticalSpace(8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.location_on,
                size: 16.w,
                color: MyColors.brand.purple,
              ),
              SizedBox(width: 4.w),
              Text(
                _resolvedLocation!,
                style: MyTextStyles.label.label1.copyWith(
                  color: MyColors.brand.purple,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildStatsRow(UserModel user) {
    final totalTasks = (user.postedCount ?? 0) + (user.claimedCount ?? 0);
    final completionRate = totalTasks > 0
        ? ((user.completedCount ?? 0) / totalTasks * 100).toInt()
        : 0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              icon: Icons.star_rounded,
              iconColor: MyColors.icons.star,
              title: 'Overall Rating',
              value: (user.rating ?? 0.0).toStringAsFixed(1),
              subtitle: '${user.reviewCount ?? 0} ratings',
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: _buildStatCard(
              icon: Icons.check_circle_outline,
              iconColor: MyColors.brand.purple,
              title: 'Completion Rate',
              value: '$completionRate%',
              subtitle: '${user.reviewCount ?? 0} ratings',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: MyColors.background.primary,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: MyColors.border.postBorder, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: MyTextStyles.label.label1.copyWith(
              color: MyColors.text.secondary,
            ),
          ),
          const VerticalSpace(8),
          Row(
            children: [
              Icon(icon, size: 20.w, color: iconColor),
              SizedBox(width: 6.w),
              Text(
                value,
                style: MyTextStyles.heading.h22.copyWith(
                  color: MyColors.text.primary,
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  subtitle,
                  style: MyTextStyles.caption.captionNotes.copyWith(
                    color: MyColors.text.third,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection(UserModel user) {
    if (user.about == null || user.about!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About ${user.name}',
            style: MyTextStyles.heading.h32.copyWith(
              color: MyColors.text.primary,
            ),
          ),
          const VerticalSpace(8),
          Text(
            user.about!,
            style: MyTextStyles.body.body2.copyWith(
              color: MyColors.text.secondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection(UserModel user) {
    if (user.skills == null || user.skills!.isEmpty) {
      return const SizedBox.shrink();
    }

    final skillList = user.skills!
        .split(',')
        .map((s) => s.trim().replaceAll(RegExp(r'[\[\]"]'), '').trim())
        .where((s) => s.isNotEmpty)
        .toList();

    if (skillList.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: MyTextStyles.heading.h32.copyWith(
              color: MyColors.text.primary,
            ),
          ),
          const VerticalSpace(12),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: skillList
                .map(
                  (skill) => Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: MyColors.brand.purple.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      skill,
                      style: MyTextStyles.caption.captionNotes.copyWith(
                        color: MyColors.brand.purple,
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

  Widget _buildError(String message) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 64.w,
              color: MyColors.text.third,
            ),
            const VerticalSpace(16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: MyTextStyles.body.body1.copyWith(
                color: MyColors.text.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
