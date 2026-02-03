import 'package:flutter/material.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/widgets/dialogs/my_confirmation_dialog.dart';

/// Shows a confirmation dialog for claiming a task.
/// Returns `true` if the user accepts, `false` if ignored, or `null` if dismissed.
Future<bool?> showClaimConfirmationDialog(BuildContext context) {
  return showMyConfirmationDialog(
    context,
    iconPath: MyIcons.trueSolid,
    title: 'Confirm Task Claim',
    description:
        'Are you sure you want to claim this task?\nOnce confirmed, the task will be assigned to you.',
    cancelText: 'Ignore',
    confirmText: 'Accept',
  );
}
