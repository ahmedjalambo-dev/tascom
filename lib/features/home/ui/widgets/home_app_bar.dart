import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/services/location_service.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_app_bar.dart';
import 'package:tascom/core/widgets/my_spacing.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  String _userLocationDisplay = 'No location';

  @override
  void initState() {
    super.initState();
    _loadUserLocation();
  }

  Future<void> _loadUserLocation() async {
    final display = await LocationService.getStoredLocationDisplayName();
    if (!mounted) return;
    setState(() => _userLocationDisplay = display);
  }

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      leading: Row(
        children: [
          SvgPicture.asset(
            MyIcons.locationStroke,
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(MyColors.icons.icon, BlendMode.srcIn),
          ),
          const HorizontalSpace(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Location',
                style: MyTextStyles.caption.captionNotes.copyWith(
                  color: MyColors.text.secondary,
                ),
              ),
              Text(
                _userLocationDisplay,
                style: MyTextStyles.button.secondaryButton2.copyWith(
                  color: MyColors.text.primary,
                ),
              ),
            ],
          ),
        ],
      ),
      trailing: [
        SvgPicture.asset(
          MyIcons.notificationStroke,
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(MyColors.icons.icon, BlendMode.srcIn),
        ),
        const HorizontalSpace(16),
        SvgPicture.asset(
          MyIcons.messageStroke,
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(MyColors.icons.icon, BlendMode.srcIn),
        ),
      ],
    );
  }
}
