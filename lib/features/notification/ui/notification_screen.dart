import 'package:flutter/material.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/notification/ui/widgets/notification_widget.dart';
import 'package:tascom/features/notification/ui/widgets/section_title.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day;
  }

  @override
  Widget build(BuildContext context) {
    final notifications = [
      NotificationItem(
        name: 'Mohammed',
        message: 'Mohammed accepted the task e...',
        date: DateTime.now().subtract(const Duration(hours: 1)),
        unread: true,
      ),
      NotificationItem(
        name: 'Tala',
        message: 'Tala declined your exchange re...',
        date: DateTime.now().subtract(const Duration(hours: 3)),
        unread: true,
      ),
      NotificationItem(
        name: 'Dana',
        message: 'Dana rated you after completing...',
        date: DateTime.now().subtract(const Duration(days: 1)),
      ),
      NotificationItem(
        name: 'Fadi',
        message: 'New exchange request',
        date: DateTime.now().subtract(const Duration(days: 1)),
      ),
      NotificationItem(
        name: 'Anas',
        message: 'You received a new rating from ...',
        date: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];

    final today = notifications.where((n) => isToday(n.date)).toList();
    final yesterday = notifications.where((n) => isYesterday(n.date)).toList();
    final rest = notifications
        .where((n) => !isToday(n.date) && !isYesterday(n.date))
        .toList();

    return Scaffold(
      backgroundColor: MyColors.background.primary,
      appBar: AppBar(
        backgroundColor: MyColors.background.secondary,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Notifications',
          style: MyTextStyle.heading.h32.copyWith(color: MyColors.text.primary),
        ),
      ),
      body: notifications.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView(
                children: [
                  const SizedBox(height: 16),

                  if (today.isNotEmpty) ...[
                    const SectionTitle('Today'),
                    ...today,
                  ],

                  if (yesterday.isNotEmpty) ...[
                    const SectionTitle('Yesterday'),
                    ...yesterday,
                  ],

                  if (rest.isNotEmpty) ...[
                    const SectionTitle('Earlier'),
                    ...rest,
                  ],
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/Notifications.png', 
                    width: 270,
                    height: 260,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "You don't have any notifications yet",
                    textAlign: TextAlign.center,
                    style: MyTextStyle.body.body2.copyWith(
                      color: MyColors.text.primary,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
