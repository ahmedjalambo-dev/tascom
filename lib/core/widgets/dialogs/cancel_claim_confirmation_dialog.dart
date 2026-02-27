import 'package:flutter/material.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/widgets/dialogs/my_confirmation_dialog.dart';

/// Shows a confirmation dialog for canceling a task claim.
/// Returns `true` if the user confirms cancellation, `false` if kept, or `null` if dismissed.
Future<bool?> showCancelClaimConfirmationDialog(BuildContext context) {
  return showMyConfirmationDialog(
    context,
    iconPath: MyIcons.cancelSolid,
    title: 'Cancel Task Claim',
    description:
        'Are you sure you want to cancel your claim on this task?\nThis action cannot be undone.',
    cancelText: 'Keep Claim',
    confirmText: 'Cancel Claim',
  );
}
