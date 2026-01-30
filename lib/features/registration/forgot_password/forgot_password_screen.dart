import 'package:flutter/gestures.dart';
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

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _emailFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocus.dispose();
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
                    'Forgot Password',
                    style: MyTextStyles.heading.h22.copyWith(
                      color: MyColors.text.primary,
                    ),
                  ),
                ),
                VerticalSpace(8.h),

                // Subtitle
                Center(
                  child: Text(
                    'Enter your email to receive reset instructions',
                    style: MyTextStyles.body.body2.copyWith(
                      color: MyColors.text.secondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                VerticalSpace(32.h),

                // Email
                _buildLabeledField(
                  label: 'Email',
                  child: MyTextField(
                    controller: _emailController,
                    focusNode: _emailFocus,
                    hintText: 'Placeholder@gmail.com',
                    textInputType: TextInputType.emailAddress,
                    prefixIcon: _buildPrefixIcon(
                      MyIcons.userStroke,
                      _emailFocus,
                    ),
                  ),
                ),
                VerticalSpace(32.h),

                // Send Reset Link Button
                MyButton(
                  text: 'Send Reset Link',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle send reset link
                    }
                  },
                ),
                const VerticalSpace(24),

                // Back to Login
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: MyTextStyles.body.body2.copyWith(
                        color: MyColors.text.primary,
                      ),
                      children: [
                        const TextSpan(text: 'Back to '),
                        TextSpan(
                          text: 'Login',
                          style: MyTextStyles.button.primaryButton1.copyWith(
                            color: MyColors.brand.purple,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigate back to login
                              Navigator.pop(context);
                            },
                        ),
                      ],
                    ),
                  ),
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
