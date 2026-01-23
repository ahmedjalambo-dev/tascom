import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/extentions/extentions.dart';
import 'package:tascom/core/helpers/validator.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/auth/widgets/auth_header.dart';
import 'package:tascom/core/widgets/my_button.dart';
import 'package:tascom/core/widgets/my_text_form_field.dart';
import 'package:tascom/core/widgets/spacing_widgets.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AuthHeader(title: 'Create New Password'),
                VerticalSpace(8.h),

                // Subtitle
                Text(
                  'Create a new password to secure you account',
                  textAlign: TextAlign.center,
                  style: MyTextStyle.body.body2.copyWith(
                    color: MyColors.text.secondary,
                  ),
                ),
                VerticalSpace(24.h),

                // New Password Field
                MyTextFormField(
                  lable: 'New Password',
                  controller: newPasswordController,
                  hintText: '********',
                  validator: (value) =>
                      Validator.validatePassword(value, 'Password'),
                  obscureText: !_isNewPasswordVisible,
                  prefixSvgPath: 'assets/icons/auth/lock-password.svg',
                  textInputType: TextInputType.text,
                  suffixIcon: GestureDetector(
                    onTap: () => setState(
                      () => _isNewPasswordVisible = !_isNewPasswordVisible,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        _isNewPasswordVisible
                            ? 'assets/icons/auth/eye_on.svg'
                            : 'assets/icons/auth/eye_off.svg',
                        width: 24.w,
                        height: 24.h,
                        colorFilter: ColorFilter.mode(
                          MyColors.text.third,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
                VerticalSpace(16.h),

                // Confirm New Password Field
                MyTextFormField(
                  lable: 'Confirm New Password',
                  controller: confirmPasswordController,
                  hintText: '********',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm password cannot be empty';
                    }
                    if (value != newPasswordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  obscureText: !_isConfirmPasswordVisible,
                  prefixSvgPath: 'assets/icons/auth/lock-password.svg',
                  textInputType: TextInputType.text,
                  suffixIcon: GestureDetector(
                    onTap: () => setState(
                      () => _isConfirmPasswordVisible =
                          !_isConfirmPasswordVisible,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        _isConfirmPasswordVisible
                            ? 'assets/icons/auth/eye_on.svg'
                            : 'assets/icons/auth/eye_off.svg',
                        width: 24.w,
                        height: 24.h,
                        colorFilter: ColorFilter.mode(
                          MyColors.text.third,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
                VerticalSpace(40.h),

                // Create New Password Button
                MyButton(
                  text: 'Create New Password',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO: Implement password reset logic
                      // Navigate to login or success screen
                      context.pushReplacementNamed(MyRoutes.login);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
