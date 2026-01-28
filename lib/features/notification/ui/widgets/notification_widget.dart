import 'package:flutter/material.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/notification/ui/widgets/avatar_widget.dart';

class NotificationItem extends StatelessWidget {
  final String name;
  final String message;
  final bool unread;
  final DateTime date;

  const NotificationItem({
    super.key,
    required this.name,
    required this.message,
    required this.date,
    this.unread = false,
  });

  @override
  Widget build(BuildContext context) {
    final time = TimeOfDay.fromDateTime(date).format(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: MyColors.background.secondary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEEEEF5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Avatar(image: AssetImage('assets/images/AvatarImage.png')),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: MyTextStyle.body.body2.copyWith(
                        color: MyColors.text.primary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      time,
                      style: MyTextStyle.label.label2.copyWith(
                        color: MyColors.text.secondary,
                        height: 2.19,
                      ),
                    ),
                    const Spacer(),
                    if (unread)
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: MyColors.brand.purple,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        message,
                        style: MyTextStyle.caption.captionNotes.copyWith(
                          color: MyColors.text.primary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Read More',
                      style: MyTextStyle.label.label2.copyWith(
                        color: MyColors.text.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
