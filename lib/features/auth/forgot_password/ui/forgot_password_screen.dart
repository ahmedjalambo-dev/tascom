import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/helpers/validator.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/auth/widgets/auth_header.dart';
import 'package:tascom/core/widgets/my_button.dart';
import 'package:tascom/core/widgets/my_text_form_field.dart';
import 'package:tascom/core/widgets/spacing_widgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
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
                const AuthHeader(title: 'Forgot Password'),
                VerticalSpace(8.h),

                // Subtitle
                Text(
                  'Enter your email to receive reset instructions',
                  textAlign: TextAlign.center,
                  style: MyTextStyle.body.body2.copyWith(
                    color: MyColors.text.secondary,
                  ),
                ),
                VerticalSpace(24.h),

                // Email Field
                MyTextFormField(
                  lable: 'Email',
                  controller: emailController,
                  hintText: 'Placeholder@gmail.com',
                  validator: (value) => Validator.validateEmail(value, 'Email'),
                  prefixSvgPath: 'assets/icons/auth/email.svg',
                  textInputType: TextInputType.emailAddress,
                  obscureText: false,
                ),
                VerticalSpace(40.h),

                // Send Reset Link Button
                MyButton(
                  text: 'Send Reset Link',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO: Implement send reset link logic
                      // Navigate to success screen or show confirmation
                    }
                  },
                ),
                VerticalSpace(24.h),

                // Back to Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Back to ',
                      style: MyTextStyle.body.body2.copyWith(
                        color: MyColors.text.secondary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        'Login',
                        style: MyTextStyle.button.primaryButton1.copyWith(
                          color: MyColors.brand.purple,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
