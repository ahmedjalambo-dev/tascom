import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/services/location_service.dart';
import 'package:tascom/core/storage/shared_pref_helper.dart';
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
  String _locationText = 'Loading...';

  @override
  void initState() {
    super.initState();
    _loadLocation();
  }

  Future<void> _loadLocation() async {
    final location = SharedPrefHelper.getUserLocation();
    if (location == null || !location.contains(',')) {
      if (mounted) setState(() => _locationText = 'No location');
      return;
    }

    final parts = location.split(',');
    final latitude = double.tryParse(parts[0]);
    final longitude = double.tryParse(parts[1]);

    if (latitude == null || longitude == null) {
      if (mounted) setState(() => _locationText = 'No location');
      return;
    }

    final placemark = await LocationService.getPlacemark(latitude, longitude);

    if (!mounted) return;

    if (placemark != null) {
      final country = placemark.country ?? '';
      final city = placemark.locality ?? '';
      setState(() {
        _locationText = [country, city].where((s) => s.isNotEmpty).join(', ');
        if (_locationText.isEmpty) _locationText = '$latitude, $longitude';
      });
    } else {
      setState(() => _locationText = '$latitude, $longitude');
    }
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
                _locationText,
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
