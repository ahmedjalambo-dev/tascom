import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tascom/features/profile/ui/screen/edit_profile_screen.dart';
import 'package:tascom/features/settings/ui/screen/reports_screen.dart';
import 'package:tascom/features/settings/ui/screen/language_screen.dart';
import 'package:tascom/features/settings/ui/screen/notifications_settings_screen.dart';
import 'package:tascom/features/settings/ui/screen/saved_tasks_screen.dart';
import 'package:tascom/features/settings/widgets/logout_dialog.dart';
import 'package:tascom/features/settings/widgets/settings_tile.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

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
                          builder: (context) => EditProfileScreen(),
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
