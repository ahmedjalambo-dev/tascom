import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/features/settings/notifications/ui/widgets/notification_switch_tile.dart';
import 'package:tascom/features/settings/main/ui/widgets/settings_section_card.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class NotificationsSettingsScreen extends StatefulWidget {
  const NotificationsSettingsScreen({super.key});

  @override
  State<NotificationsSettingsScreen> createState() => _NotificationsSettingsScreenState();
}

class _NotificationsSettingsScreenState extends State<NotificationsSettingsScreen> {
  bool pushNotifications = true;
  bool emailNotifications = false;
  bool taskUpdates = true;
  bool newMessages = false;
  bool taskCompleted = true;
  bool taskCanceled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.secondary,
      appBar: AppBar(
        title: Text(
          "Notifications Settings",
          style: MyTextStyle.heading.h22.copyWith(
            color: MyColors.text.primary,
          ),
        ),
        centerTitle: true,
        backgroundColor: MyColors.background.primary,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: MyColors.text.primary,
            size: 20.sp,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingsSectionCard(
                children: [
                  NotificationSwitchTile(
                    title: "Push Notifications",
                    value: pushNotifications,
                    onChanged: (val) => setState(() => pushNotifications = val),
                  ),
                  NotificationSwitchTile(
                    title: "Email Notifications",
                    value: emailNotifications,
                    onChanged: (val) => setState(() => emailNotifications = val),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    "Advanced",
                    style: MyTextStyle.heading.h32.copyWith(
                      color: MyColors.text.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down, color: MyColors.text.primary),
                ],
              ),
              const SizedBox(height: 16),
              SettingsSectionCard(
                children: [
                  NotificationSwitchTile(
                    title: "Task updates",
                    value: taskUpdates,
                    onChanged: (val) => setState(() => taskUpdates = val),
                  ),
                  NotificationSwitchTile(
                    title: "New messages",
                    value: newMessages,
                    onChanged: (val) => setState(() => newMessages = val),
                  ),
                  NotificationSwitchTile(
                    title: "Task completed",
                    value: taskCompleted,
                    onChanged: (val) => setState(() => taskCompleted = val),
                  ),
                  NotificationSwitchTile(
                    title: "Task canceled",
                    value: taskCanceled,
                    onChanged: (val) => setState(() => taskCanceled = val),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
