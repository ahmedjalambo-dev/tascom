import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/settings/delete_account/ui/widgets/consequence_item.dart';
import 'package:tascom/features/settings/delete_account/ui/widgets/delete_confirmation_dialog.dart';
import 'package:tascom/features/settings/delete_account/ui/widgets/warning_box.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  final TextEditingController _deleteController = TextEditingController();
  bool _isDeleteEnabled = false;

  @override
  void initState() {
    super.initState();
    _deleteController.addListener(() {
      setState(() {
        _isDeleteEnabled = _deleteController.text.trim().toUpperCase() == "DELETE";
      });
    });
  }

  @override
  void dispose() {
    _deleteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.primary,
      appBar: AppBar(
        backgroundColor: MyColors.background.secondary,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: MyColors.text.primary, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Delete Account",
          style: MyTextStyle.heading.h22.copyWith(color: MyColors.text.primary),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.r)),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Text(
              "Delete Account",
              style: MyTextStyle.heading.h22.copyWith(
                color: MyColors.text.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              "Permanently remove your account and data from Tascom.",
              style: MyTextStyle.body.body2.copyWith(color: MyColors.text.secondary),
            ),
            SizedBox(height: 24.h),
            const WarningBox(),
            SizedBox(height: 24.h),
            const ConsequenceItem(text: "Your public profile will be immediately deactivated."),
            const ConsequenceItem(text: "All your earned points will be lost."),
            const ConsequenceItem(text: "Your active tasks will be canceled automatically."),
            const ConsequenceItem(text: "You will not receive any further notifications related to your account."),
            SizedBox(height: 24.h),
            Text(
              'To confirm, type "DELETE" below',
              style: MyTextStyle.body.body2.copyWith(
                color: MyColors.text.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 12.h),
            TextField(
              controller: _deleteController,
              decoration: InputDecoration(
                hintText: "DELETE",
                hintStyle: MyTextStyle.body.body2.copyWith(color: MyColors.text.disable),
                filled: true,
                fillColor: MyColors.background.secondary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: MyColors.border.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: MyColors.border.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: MyColors.brand.purple),
                ),
                suffixIcon: Icon(Icons.square, color: MyColors.background.primary, size: 20.sp), // Placeholder for the box in design
              ),
            ),
            SizedBox(height: 40.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isDeleteEnabled
                    ? () {
                        showDialog(
                          context: context,
                          builder: (context) => const DeleteConfirmationDialog(),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.brand.purple,
                  disabledBackgroundColor: MyColors.brand.purple.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                ),
                child: Text(
                  "Delete Account",
                  style: MyTextStyle.button.primaryButton1.copyWith(color: MyColors.text.white),
                ),
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
