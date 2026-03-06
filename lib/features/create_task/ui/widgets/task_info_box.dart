import 'package:flutter/material.dart';
import 'package:tascom/core/widgets/my_info_box.dart';

class TaskInfoBox extends StatelessWidget {
  const TaskInfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyInfoBox(
      title: 'Important Instructions Before Posting',
      items: [
        MyInfoBoxItem(
          prefix: 'Points: ',
          highlighted: '5 points',
          suffix:
              ' will be deducted once the task is completed, based on the task details',
        ),
        MyInfoBoxItem(
          prefix: 'Accurate Information: ',
          suffix:
              'Make sure all details (category, priority, and location) are correct to avoid confusion and attract the right helper',
        ),
      ],
    );
  }
}
