import 'package:flutter/material.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/widgets/dialogs/my_confirmation_dialog.dart';

/// Shows a confirmation dialog for logging out.
/// Returns `true` if the user confirms logout, `false` if canceled, or `null` if dismissed.
Future<bool?> showLogoutConfirmationDialog(BuildContext context) {
  return showMyConfirmationDialog(
    context,
    iconPath: MyIcons.logoutStroke,
    title: 'Logout of Tascom?',
    description:
        'Are you sure you want to logout? You will need to sign in again to access your account and tasks.',
    cancelText: 'Cancel',
    confirmText: 'Logout',
  );
}
