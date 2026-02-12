import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/extentions/extentions.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_app_bar.dart';
import 'package:tascom/core/widgets/my_button.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/core/widgets/my_text_field.dart';
import 'package:tascom/features/settings/delete_account/delete_account_confirmation_dialog.dart';
import 'package:tascom/features/settings/delete_account/widgets/consequence_item.dart';
import 'package:tascom/features/settings/delete_account/widgets/warning_card.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  final TextEditingController _confirmController = TextEditingController();
  bool _isDeleteEnabled = false;

  @override
  void initState() {
    super.initState();
    _confirmController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _confirmController.removeListener(_onTextChanged);
    _confirmController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final isValid = _confirmController.text.toUpperCase() == 'DELETE';
    if (isValid != _isDeleteEnabled) {
      setState(() {
        _isDeleteEnabled = isValid;
      });
    }
  }

  Future<void> _onDeletePressed() async {
    final result = await showDeleteAccountConfirmationDialog(context);
    if (result == true && mounted) {
      // TODO: Implement actual delete account logic
      // For now, just pop back to settings
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const VerticalSpace(24),
                  const WarningCard(
                    title: 'Warning: This action is permanent',
                    description:
                        'Once you delete your account, all of your data will be permanently lost. Please be certain.',
                  ),
                  const VerticalSpace(24),
                  _buildConsequencesList(),
                  const VerticalSpace(24),
                  _buildConfirmationSection(),
                ],
              ),
            ),
            _buildDeleteButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return MyAppBar(
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: SvgPicture.asset(
            MyIcons.arrowBack,
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(MyColors.icons.icon, BlendMode.srcIn),
          ),
        ),
      ),
      title: Text(
        'Delete Account',
        style: MyTextStyles.heading.h32.copyWith(color: MyColors.text.primary),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Delete Account',
          style: MyTextStyles.heading.h32.copyWith(
            color: MyColors.text.primary,
          ),
        ),
        const VerticalSpace(8),
        Text(
          'Permanently remove your account and data from Tascom.',
          style: MyTextStyles.body.body2.copyWith(
            color: MyColors.text.secondary,
          ),
        ),
      ],
    );
  }

  Widget _buildConsequencesList() {
    return const Column(
      children: [
        ConsequenceItem(
          text: 'Your public profile will be immediately deactivated.',
        ),
        ConsequenceItem(text: 'All your earned points will be lost.'),
        ConsequenceItem(
          text: 'Your active tasks will be canceled automatically.',
        ),
        ConsequenceItem(
          text:
              'You will not receive any further notifications related to your account.',
        ),
      ],
    );
  }

  Widget _buildConfirmationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'To confirm, type "DELETE" below',
          style: MyTextStyles.heading.h32.copyWith(
            color: MyColors.text.primary,
          ),
        ),
        const VerticalSpace(12),
        MyTextField(controller: _confirmController, hintText: 'DELETE'),
      ],
    );
  }

  Widget _buildDeleteButton() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: MyButton(
          text: 'Delete Account',
          onPressed: _isDeleteEnabled ? _onDeletePressed : null,
        ),
      ),
    );
  }
}
