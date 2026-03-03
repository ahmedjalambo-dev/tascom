import 'package:flutter/material.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/widgets/dialogs/my_confirmation_dialog.dart';

/// Shows a confirmation dialog for deleting account.
/// Returns `true` if the user confirms deletion, `false` if canceled, or `null` if dismissed.
Future<bool?> showDeleteAccountConfirmationDialog(BuildContext context) {
  return showMyConfirmationDialog(
    context,
    iconPath: MyIcons.trashStroke,
    title: 'Delete Account',
    description:
        'Are you sure you want to delete this account? This action cannot be undone.',
    cancelText: 'Cancel',
    confirmText: 'Delete',
    iconColor: MyColors.states.error,
    iconBackgroundColor: MyColors.states.error.withValues(alpha: 0.1),
    confirmButtonColor: MyColors.states.error,
  );
}
