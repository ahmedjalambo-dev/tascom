import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tascom/features/settings/points/ui/screen/points_history_screen.dart';
import 'package:tascom/features/profile/ui/screen/edit_profile_screen.dart';
import 'package:tascom/features/settings/reports/ui/screen/reports_screen.dart';
import 'package:tascom/features/settings/language/ui/screen/language_screen.dart';
import 'package:tascom/features/settings/notifications/ui/screen/notifications_settings_screen.dart';
import 'package:tascom/features/settings/saved_tasks/ui/screen/saved_tasks_screen.dart';
import 'package:tascom/features/settings/logout/logout_dialog.dart';
import 'package:tascom/features/settings/delete_account/ui/screen/delete_account_screen.dart';
import 'package:tascom/features/settings/main/ui/widgets/settings_tile.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/settings/security/ui/screens/change_password_screen.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.secondary,
      appBar: AppBar(
        title: Text(
          "Settings",
          style: MyTextStyle.heading.h32.copyWith(
            color: MyColors.text.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: MyColors.background.primary, 
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: MyColors.text.primary),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top row of icons (optional/if present in specific design, skipping for now based on standard list view in main panel image)
            // It seems the User Panel is just a list.

            // List Options
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  SettingsTile(
                    icon: SvgPicture.asset(
                      'assets/svg/profile_person.svg',
                      width: 24,
                      height: 24,
                    ),
                    title: "My Profile",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfileScreen(),
                        ),
                      );
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    indent: 24,
                    endIndent: 24,
                    color: MyColors.border.border,
                  ), // Divider with indent matching icon width
                  SettingsTile(
                    icon: SvgPicture.asset(
                      'assets/svg/saved_tasks_bookmark.svg',
                      width: 24,
                      height: 24,
                    ),
                    title: "Saved Tasks",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SavedTasksScreen(),
                        ),
                      );
                    },
                  ),

                   Divider(
                    height: 1,
                    thickness: 1,
                    indent: 24,
                    endIndent: 24,
                    color: MyColors.border.border,
                  ),
                    SettingsTile(
                    icon: SvgPicture.asset(
                      'assets/svg/stroke.svg',
                      width: 24,
                      height: 24,
                    ),
                    title: "Points History",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PointsHistoryScreen(),
                        ),
                      );
                    },
                  ),
              













                  Divider(
                    height: 1,
                    thickness: 1,
                    indent: 24,
                    endIndent: 24,
                    color: MyColors.border.border,
                  ),
                  SettingsTile(
                    icon: SvgPicture.asset(
                      'assets/svg/language_globe.svg',
                      width: 24,
                      height: 24,
                    ),
                    title: "Language",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LanguageScreen(),
                        ),
                      );
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    indent: 24,
                    endIndent: 24,
                    color: MyColors.border.border,
                  ),
                  SettingsTile(
                    icon: SvgPicture.asset(
                      'assets/svg/notifications_bell.svg',

                      width: 24,
                      height: 24,
                    ),
                    title: "Notification ",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationsSettingsScreen(),
                        ),
                      );
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    indent: 24,
                    endIndent: 24,
                    color: MyColors.border.border,
                  ),






                SettingsTile(
                    icon: SvgPicture.asset(
                      'assets/svg/lock-password.svg',

                      width: 24,
                      height: 24,
                    ),
                    title: "Change Password",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChangePasswordScreen(),
                        ),
                      );
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    indent: 24,
                    endIndent: 24,
                    color: MyColors.border.border,
                  ),





















                  SettingsTile(
                    icon: SvgPicture.asset(
                      'assets/svg/reports_flag.svg',
                      width: 24,
                      height: 24,
                    ),
                    title: "Reports",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ReportsScreen(),
                        ),
                      );
                    },
                  ),



   Divider(
                    height: 1,
                    thickness: 1,
                    indent: 24,
                    endIndent: 24,
                    color: MyColors.border.border,
                  ),




                   SettingsTile(
                    icon: SvgPicture.asset(
                      'assets/svg/unavailable.svg',
                      width: 24,
                      height: 24,
                    ),
                    title: "Delete Account",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DeleteAccountScreen(),
                        ),
                      );
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    indent: 24,
                    endIndent: 24,
                    color: MyColors.border.border,
                  ),
                  SettingsTile(
                    icon: SvgPicture.asset(
                      'assets/svg/logout_arrow.svg',
                      width: 24,
                      height: 24,
                    ),
                    title: "Log Out",
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => LogoutDialog(
                          onLogout: () {
                            // Implement logout logic here
                            print("User logged out");
                          },
                        ),
                      );
                    },
                    showArrow: false,
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    indent: 24,
                    endIndent: 24,
                    color: MyColors.border.border,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
