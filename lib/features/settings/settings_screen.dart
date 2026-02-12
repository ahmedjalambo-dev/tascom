import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/extentions/extentions.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/features/auth/logout/cubit/logout_cubit.dart';
import 'package:tascom/features/auth/logout/cubit/logout_state.dart';
import 'package:tascom/features/settings/logout/logout_confirmation_dialog.dart';
import 'package:tascom/core/widgets/my_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          },
          success: () {
            context.pushNamedAndRemoveUntil(
              MyRoutes.login,
              predicate: (route) => false,
            );
          },
          error: (error) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error.message ?? 'Logout failed'),
                backgroundColor: MyColors.states.error,
              ),
            );
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: MyColors.background.primary,
        body: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _SettingsMenuItem(
                    icon: MyIcons.userStroke,
                    label: 'My Profile',
                    onTap: () {
                      context.pop();
                    },
                  ),
                  _SettingsMenuItem(
                    icon: MyIcons.requestsStroke,
                    label: 'Requests',
                    onTap: () {},
                  ),
                  _SettingsMenuItem(
                    icon: MyIcons.saveStroke,
                    label: 'Saved Tasks',
                    onTap: () {},
                  ),
                  _SettingsMenuItem(
                    icon: MyIcons.pointsStroke,
                    label: 'Points History',
                    onTap: () {
                      context.pushNamed(MyRoutes.pointsHistory);
                    },
                  ),
                  _SettingsMenuItem(
                    icon: MyIcons.languageStroke,
                    label: 'Language',
                    onTap: () {},
                  ),
                  _SettingsMenuItem(
                    icon: MyIcons.notificationStroke,
                    label: 'Notifications',
                    onTap: () {},
                  ),
                  _SettingsMenuItem(
                    icon: MyIcons.lockPassword,
                    label: 'Change Password',
                    onTap: () {},
                  ),
                  _SettingsMenuItem(
                    icon: MyIcons.reportsStroke,
                    label: 'Reports',
                    onTap: () {
                      context.pushNamed(MyRoutes.reports);
                    },
                  ),
                  _SettingsMenuItem(
                    icon: MyIcons.deleteAccountStroke,
                    label: 'Delete Account',
                    onTap: () {
                      context.pushNamed(MyRoutes.deleteAccount);
                    },
                  ),
                  _SettingsMenuItem(
                    icon: MyIcons.logoutStroke,
                    label: 'Log Out',
                    onTap: () async {
                      final confirmed = await showLogoutConfirmationDialog(
                        context,
                      );
                      if (confirmed == true && context.mounted) {
                        context.read<LogoutCubit>().logout();
                      }
                    },
                    showDivider: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return MyAppBar(
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: SvgPicture.asset(
            MyIcons.arrowBack,
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              MyColors.text.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      title: Center(
        child: Text(
          'Settings',
          style: MyTextStyles.heading.h22.copyWith(
            color: MyColors.text.primary,
          ),
        ),
      ),
    );
  }
}

class _SettingsMenuItem extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;
  final bool showDivider;

  const _SettingsMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Row(
                children: [
                  SvgPicture.asset(
                    icon,
                    width: 24.w,
                    height: 24.h,
                    colorFilter: ColorFilter.mode(
                      MyColors.text.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Text(
                      label,
                      style: MyTextStyles.body.body1.copyWith(
                        color: MyColors.text.primary,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    MyIcons.arrowRight,
                    width: 20.w,
                    height: 20.h,
                    colorFilter: ColorFilter.mode(
                      MyColors.text.secondary,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
            if (showDivider)
              Divider(height: 1, color: MyColors.border.postBorder),
          ],
        ),
      ),
    );
  }
}
