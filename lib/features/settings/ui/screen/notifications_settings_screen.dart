import 'package:flutter/material.dart';
import 'package:tascom/features/settings/widgets/notification_switch_tile.dart';
import 'package:tascom/features/settings/widgets/settings_section_card.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Notifications Settings",
          style: TextStyle(
            color: Color(0xFF251455),
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF251455), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                children: const [
                  Text(
                    "Advanced",
                    style: TextStyle(
                      color: Color(0xFF251455),
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down, color: Color(0xFF251455)),
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
