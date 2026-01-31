import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/extentions/extentions.dart';
import 'package:tascom/core/helpers/validator.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/auth/widgets/auth_footer.dart';
import 'package:tascom/features/auth/widgets/auth_header.dart';
import 'package:tascom/core/widgets/my_button.dart';
import 'package:tascom/core/widgets/my_text_form_field.dart';
import 'package:tascom/features/auth/widgets/social_login_section.dart';
import 'package:tascom/core/widgets/spacing_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isTermsAccepted = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
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
                const AuthHeader(title: 'Create an account'),

                // Name Field
                MyTextFormField(
                  lable: 'Name',
                  controller: nameController,
                  hintText: 'Placeholder',
                  validator: (value) => Validator.validateName(value, 'Name'),
                  prefixSvgPath: 'assets/icons/auth/name.svg',
                  textInputType: TextInputType.name,
                  obscureText: false,
                ),
                VerticalSpace(16.h),

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
                VerticalSpace(16.h),

                // Phone Number Field
                MyTextFormField(
                  lable: 'Phone Number',
                  controller: phoneController,
                  hintText: '059-000-0000',
                  validator: (value) =>
                      validatePhone(value, minLength: 10, maxLength: 15),
                  prefixSvgPath: 'assets/icons/auth/phone.svg',
                  textInputType: TextInputType.phone,
                  obscureText: false,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      'assets/icons/auth/flag.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                ),
                VerticalSpace(16.h),

                // Password Field
                MyTextFormField(
                  lable: 'Password',
                  controller: passwordController,
                  hintText: '********',
                  validator: (value) =>
                      Validator.validatePassword(value, 'Password'),
                  obscureText: !_isPasswordVisible,
                  prefixSvgPath: 'assets/icons/auth/lock-password.svg',
                  textInputType: TextInputType.text,
                  suffixIcon: GestureDetector(
                    onTap: () => setState(
                      () => _isPasswordVisible = !_isPasswordVisible,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        _isPasswordVisible
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

                // Confirm Password Field
                MyTextFormField(
                  lable: 'Confirm Password',
                  controller: confirmPasswordController,
                  hintText: '12345678',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm password cannot be empty';
                    }
                    if (value != passwordController.text) {
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
                VerticalSpace(8.h),

                // Terms & Privacy Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: _isTermsAccepted,
                      onChanged: (value) =>
                          setState(() => _isTermsAccepted = value ?? false),
                      activeColor: MyColors.brand.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.dg),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // TODO: Navigate to Terms & Privacy screen
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'I agree to the ',
                                style: MyTextStyle.body.body2.copyWith(
                                  color: MyColors.text.primary,
                                ),
                              ),
                              TextSpan(
                                text: 'Terms & Privacy Policy',
                                style: MyTextStyle.body.body2.copyWith(
                                  color: MyColors.text.primary,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                VerticalSpace(24.h),

                // Sign up Button
                MyButton(
                  text: 'Sign up',
                  onPressed: () {
                    if (!_isTermsAccepted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            'Please accept Terms & Privacy Policy',
                          ),
                          backgroundColor: MyColors.states.error,
                        ),
                      );
                      return;
                    }
                    if (_formKey.currentState!.validate()) {
                      // TODO: Implement sign up logic
                    }
                  },
                ),
                VerticalSpace(24.h),

                // Social Login Section
                SocialLoginSection(
                  onGoogleTap: () {
                    // TODO: Implement Google sign up
                  },
                  onFacebookTap: () {
                    // TODO: Implement Facebook sign up
                  },
                ),
                VerticalSpace(24.h),

                // Footer
                AuthFooter(
                  questionText: 'Already Have An Account?',
                  actionText: 'Login',
                  onActionTap: () =>
                      context.pushReplacementNamed(MyRoutes.login),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
