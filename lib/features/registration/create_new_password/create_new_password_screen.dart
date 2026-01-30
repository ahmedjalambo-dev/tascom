import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/constants/my_images.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_button.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/core/widgets/my_text_field.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    _passwordFocus.addListener(() => setState(() {}));
    _confirmPasswordFocus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpace(48),

                // Logo
                Center(child: Image.asset(MyImages.tascom, height: 120.h)),
                VerticalSpace(16.h),

                // Title
                Center(
                  child: Text(
                    'Create New Password',
                    style: MyTextStyles.heading.h22.copyWith(
                      color: MyColors.text.primary,
                    ),
                  ),
                ),
                VerticalSpace(8.h),

                // Subtitle
                Center(
                  child: Text(
                    'Create a new password to secure you account',
                    style: MyTextStyles.body.body2.copyWith(
                      color: MyColors.text.secondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                VerticalSpace(32.h),

                // New Password
                _buildLabeledField(
                  label: 'New Password',
                  child: MyTextField(
                    controller: _passwordController,
                    focusNode: _passwordFocus,
                    hintText: '********',
                    textInputType: TextInputType.visiblePassword,
                    isObscureText: _obscurePassword,
                    prefixIcon: _buildPrefixIcon(
                      MyIcons.lockPassword,
                      _passwordFocus,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                      child: Padding(
                        padding: EdgeInsets.all(12.dg),
                        child: SvgPicture.asset(
                          _obscurePassword ? MyIcons.eyeOff : MyIcons.eye,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                    ),
                  ),
                ),
                VerticalSpace(16.h),

                // Confirm New Password
                _buildLabeledField(
                  label: 'Confirm New Password',
                  child: MyTextField(
                    controller: _confirmPasswordController,
                    focusNode: _confirmPasswordFocus,
                    hintText: '********',
                    textInputType: TextInputType.visiblePassword,
                    isObscureText: _obscureConfirmPassword,
                    prefixIcon: _buildPrefixIcon(
                      MyIcons.lockPassword,
                      _confirmPasswordFocus,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () => setState(
                        () =>
                            _obscureConfirmPassword = !_obscureConfirmPassword,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.dg),
                        child: SvgPicture.asset(
                          _obscureConfirmPassword
                              ? MyIcons.eyeOff
                              : MyIcons.eye,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                    ),
                  ),
                ),
                VerticalSpace(32.h),

                // Create New Password Button
                MyButton(
                  text: 'Create New Password',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle create new password
                    }
                  },
                ),
                const VerticalSpace(24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabeledField({required String label, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: MyTextStyles.body.body1.copyWith(color: MyColors.text.primary),
        ),
        const VerticalSpace(8),
        child,
      ],
    );
  }

  Widget _buildPrefixIcon(String assetPath, FocusNode focusNode) {
    final color = focusNode.hasFocus
        ? MyColors.brand.purple
        : MyColors.border.border;
    return Padding(
      padding: EdgeInsets.all(12.dg),
      child: SvgPicture.asset(
        assetPath,
        width: 24.w,
        height: 24.h,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }
}
